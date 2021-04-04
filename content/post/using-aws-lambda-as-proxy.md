---
title: "Using AWS Lambda as Proxy"
date: 2021-04-04T15:41:06-05:00
draft: false
categories: Blog
tags:
- Programming
- Cloud
- Python
---

AWS Lambdas are some of the original "serverless computing" implementations.  These little bits of code run when you hit an API endpoint, taking whatever inputs you provide and returning the output.  They can be written in many programming languages, including my favorite: Python 3.

So I wondered - could I use this to build a simple little proxy at a URL?  Why not, right?  They can run any Python code...  If I wanted to, I could use the result to evade perimeter firewalls that might be blocking many arbitrary destination hosts, but not AWS assets.  It's not uncommon for enterprises to block sites based on host or URL, but most still need users to be able to get work done.  AWS is infrastructure that powers many other sites - so I suspect that most organizations have to let it get through.

With a Lambda-based proxy, accessed via HTTPS, requests would look like they were headed to AWS but would otherwise be encrypted.  They'd hit the proxy, request some other resource, collect the response and return it to the original requestor.  I could use this to even do things like pass data along for exfiltration.

The Lambda was pretty easy to build and setup, here's the code:

```
import json
import urllib.request
import traceback

def lambda_handler(event, context):
    response = dict()
    response["event"] = event
    try:
        response["typ"] = "{}".format(type(event["headers"]))
        url = event["queryStringParameters"]["url"]
        with urllib.request.urlopen(url, timeout=5) as f:
            response["data"] = f.read().decode("utf-8", "replace")
    except BaseException:
        response["exception"] = traceback.format_exc()
    return {
        'statusCode': 200,
        'body': json.dumps(response),
    }
```

Set that up as a new Lambda Python 3 function and deploy it (you must redeploy after each code change...).  Now you've got to make that accessible via a URL.  Go to the AWS API Gateway, create an API with HTTP API.  Add a Lambda integration and select your Lambda function.  Give it a name.  Now - your new API should be visible in the API Gateway list.  Grab the "invoke URL", and append your Lambda function name to create the request URL.  Your request URL should look like this:

`https://[API_ID].execute-api.[REGION].amazonaws.com/[LAMBDA_NAME]?url=[URL_TO_REQUEST]`

Put the URL you want to retrieve as the query string URL parameter - that gets pulled out as part of the custom Lambda code.  Now make a request!  The result will show in your web browser as JSON.  You could create a small HTML file to make this request for you and automatically parse the result JSON.  You'd probably need to enable CORS in the API Gateway.

You can make any kind of GET request you want using that URL, and could include further data as part of the request URL.  With that you could request a forbidden page or resource, or send data to a separate remote destination.

Of course - if you don't mind AWS being the final destination and data exfiltration is your goal, you can build a function that simply stores any data it's given in S3.  As a pen-tester, you could use these Lambdas as a C2 channel that enterprise firewalls are unlikely to block.

One improvement one should consider before using this for non-HTML resource requests - decoding data as "utf-8" only makes image (and other) reconstruction more difficult.  Encoding the bytes as base64 and returning them to the requestor for more-specific actions probably makes more sense.
