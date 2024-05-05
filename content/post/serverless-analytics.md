---
title: "Serverless Analytics"
date: 2024-05-05T13:55:09-05:00
draft: false
categories:
- Blog
tags:
- Programming
- Cloud
- Serverless
- Analytics
---

I'm annoyed by Google's Analytics.  It works great, but it's heavy and overkill for my needs.  Not to mention that it's very privacy-intrusive.  It's not like I don't give Google all my data already, but perhaps you don't make that same choice, and you shouldn't be forced into it simply by visiting my website.

I've been looking for a solution that lets me see what content folks are looking at and where they're coming from, while being extremely cheap, and easy to maintain.  All while reducing the privacy impact.  I toyed with building something, but got lost in the "what is the cheapest way I can leverage AWS for this" trade-space.

A couple weeks ago I found Ricardo Sueiras's [post about the serverless analytics solution he started using](https://blog.beachgeek.co.uk/deploying-open-source-clickstream-analytics/).  It sounded good, so I tried it out.  It leverages a [project by Rehan van der Merwe](https://github.com/rehanvdm/serverless-website-analytics).

I'm using that solution now, and want to document how I've set it up.  I've tried to make it easy to set up for you, too...  It hasn't produced a noticeable impact in my AWS bill, and you can see the cost estimates on Rehan and Ricardo's sites where I've linked above.  I have fewer than 200 hits in a month, generally - so you see why "extremely cheap" is a goal.

1. In AWS switch to us-east-1, create a Route53 Hosted Zone.  I gave Route53 a zone to manage that's a subdomain for an existing domain I own.
2. In AWS us-east-1, create a public certificate for that Route53 zone.  This is a little tricky actually.  If your Hosted Zone is `example.com`, and you want your analytics to be at `analytics.example.com`, your certificate must cover at least `analytics.example.com` and `*.analytics.example.com`.
3. `git clone` [my repo](https://github.com/kc0bfv/serverless-website-analytics-site)
4. Make sure NPM is already installed for you - on Debian it's just `apt install npm`
5. Copy `secrets_example.ts` to `secrets.ts` and fill it in.  You'll see there are comments in there explaining what's needed.  Steps 1 and 2 will have created resources you can pull `zonecert`, `zoneid`, and `zonename` from.  Everything else you get to choose yourself.
6. Run `npm install` to setup prerequisites.
7. Run `npm run build` to build the site.
8. This deployment leverages AWS's Cloud Development Kit.  If you haven't used that before run `./node_modules/aws-cdk/bin/cdk bootstrap` to bootstrap your AWS account for it.
9. Run `./node_modules/aws-cdk/bin/cdk deploy APPNAME`, filling in APPNAME with the value you put in `secrets.ts`.

If you have multiple AWS profiles setup you may have to prepend those last two commands with `AWS_PROFILE=whatever `
