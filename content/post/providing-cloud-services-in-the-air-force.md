---
author: finity
date: 2020-01-03 19:49:55+00:00
draft: false
title: Providing Cloud Services in the Air Force
type: post
url: /2020/01/providing-cloud-services-in-the-air-force/
categories:
- Blog
tags:
- cloud
- range
---




I was thinking this morning about how I might manage an Air Force unit that provides networked server management services. For some reason. I realized that, while I know a bit about some of the technology  used to provide cloud services, and manage a server farm - or at least what’s used by some cloud providers - I don’t know much about how they organize their business. I started to wonder if someone from Rackspace, or AWS, or DigitalOcean had written a book about their management  practices, or company organization.







Searching, I found [some Rackspace SEC filings](https://www.sec.gov/Archives/edgar/data/1107694/000119312508091225/ds1.htm) that seemed interesting. I’m just gonna put some notes here.







The services they provide are:





* Dedicated Hosting: this looks like an option where a business 
gets full access to a computer on the Internet, and then does whatever 
they need with that server. They’re in charge of managing it themselves,
 generally, but have support staff to help out along the way.
* Managed Hosting: this option has Rackspace providing, “a 
dedicated team of experts who provide comprehensive design, engineering,
 management, and monitoring expertise”. This is specifically for 
customers who “lack the technical expertise to support [these services] 
in-house”. So, it seems like the customer would work with Rackspace to 
determine what’s needed, then Rackspace would do the build-out and 
support.
* Email Hosting: pretty obvious what this is. I’m not that interested in this, so I’m going to ignore it.
* Cloud Hosting: this “includes tools for customers to develop, 
manage, and deliver new web-based services”. And, it targets “customers 
that do not have in-house IT expertise to support the OS layer of their 
IT systems”, yet want to focus on the app-side. This looks like it 
encompasses everything from VPS to “server-less” tech, although this was
 written in 2008 so back then it may have just meant VPS…
* Platform Hosting: this was still “in-development” at the time, 
but seems to be colocation services +, where companies can move/buy-in 
infrastructure at Rackspace, take lots of responsibility in management 
and administration, take advantage of Rackspace support and facilities, 
and probably take easy advantage of other Rackspace capabilities.





I can order these in terms of required customer technical interaction/expertise, increasing:





1. Managed Hosting
2. Cloud Hosting
3. Dedicated Hosting
4. Platform Hosting





And in terms of price, for similar service, I suspect the list is the
 same but reversed, with Platform Hosting costing the least. However, 
each of these plans is really geared toward very different types of 
services… Platform Hosting customers would probably require a much 
greater amount of service than Managed Hosting users, and thus would pay
 a much greater amount. Cloud Hosting customers generally run the gamut,
 some generally requiring very little service and some generally 
requiring a great deal, but many also require the ability to rapidly 
scale from small to large resources.







Rackspace’s customers numbered 29k, with 36k servers, and 32k cloud 
hosting domains. With that level of requirement, they had the following 
sales and marketing team:





* Direct sales: 180 folks working leads and such.
* Channel sales: 850 partners that, I presume, do customized IT services and like to use Rackspace for their customers.
* Marketing: No specific team numbers here, but the mission is clear.





They outline their support team structure, which was about 700 
Rackers on teams of 12 to 20. One on the team was an account manager 
acting as a customer’s single point of contact, and at least some on 
each team were “technical specialists to meet ongoing customer needs.”







Rackspace had R&D efforts geared at deploying new tech to meet 
emerging trends, developing internal-use tools, and developing 
sales/support processes. These efforts also integrated management and 
ops personnel, but otherwise only involved 86 personnel.







Regarding applicability to the Air Force, I suspect all of these 
service types, sales units, support activities and R&D activities 
are relevant to a unit involved in managing and providing networked 
server services to other units.







Regarding the service types, there’s a huge push to enable innovation
 within units. A service provider (SP) enabling cheap/free easy small 
hosting of specific services, perhaps only on internal networks, could 
be a huge step for enabling that innovation. The clients of this would 
be similar to low-level non-complex cloud hosting clients. They might 
agree to potentially low-availability services, and other service 
limits. With backend technology permitting these services to be given a 
very low priority, we might host such services in only the server time 
not required by higher priority customers. This capability might be 
funded by innovation funds. Mid and higher-level cloud hosting customers
 in the AF would probably result largely from innovation successes, and 
would be paid for by customers directly.







Managed hosting is useful when customers need a set of IT services 
that they can define in English, with a set of documents, but that they 
cannot or will not build themselves. After working with a customer to 
define what’s required, internal technical experts would build out the 
services. This service would, at times, require huge amounts of manpower
 capable of interfacing with the customers then designing and building 
out capability.







Dedicated hosting and platform hosting would primarily let AF 
customers take advantage of existing servers and networking capability, 
saving cost through economy of scale and centralization. Those customers
 would want nearly complete control over the devices or services they’ve
 deployed, and with that they’d take responsibility for management and 
security, but we might be responsible for physical requirement 
satisfaction (power, network, cooling…) and auditing.







Sales and marketing is useful as a function, although the end-motive 
is very different, and perhaps no people would be dedicated to this 
purpose. “Direct sales” functions would correspond to networking with 
other units who require services like what we provide, and making sure 
they’re aware of our capabilities. “Channel sales” functions correspond 
to educating leadership, even across-service, and working with other 
similar service providers to ensure the military as a whole is 
maximizing capability and minimizing cost. “Marketing” looks like 
outreach and more networking at every opportunity. Do folks realize that
 there is a place they can go to make their network-based innovations 
real? That’s the job of a marketing function.







The benefit of support teams is fairly obvious, the customer-focused 
rep seems like a fantastic organizational strategy, but a backup or 
other way for work to continue when someone’s out of the office is 
important. Small, cross-functional teams, are probably also a rewarding 
way for everyone to operate. The R&D function is something I’m 
personally very interested in, and keeping such a function working is as
 vital as it is difficult.







Ok. Thoughts on paper.



