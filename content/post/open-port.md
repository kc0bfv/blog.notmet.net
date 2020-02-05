---
author: finity
date: 2012-11-11 15:20:53+00:00
draft: false
title: Open Port
type: post
url: /2012/11/open-port/
categories:
- Blog
tags:
- network security
---

Every now and then when I'm at a coffee shop I wonder what ports I've got open on my home network.  Normally I don't have any ports open within Nmap's default port list.

    
    Starting Nmap 6.01
    Initiating SYN Stealth Scan at 16:41
    Scanning myRouter [1000 ports]
    Discovered open port 1111/tcp on myRouter
    Completed SYN Stealth Scan (1000 total ports)
    Not shown: 999 filtered ports
    PORT STATE SERVICE
    1111/tcp open lmsocialserver



    
    Read data files from: /usr/local/bin/../share/nmap
    Nmap done: 1 IP address (1 host up) scanned in 184.69 seconds
     Raw packets sent: 1999 (87.956KB) | Rcvd: 3 (212B)


Crap.  What's that?  Port 1111 should not be open.  It wasn't last time I checked, less than a month ago I think.

    
    ssh myRouter
    user@myRouter:user# netstat -ln
    Active Internet connections (only servers)
    Proto Recv-Q Send-Q Local Address Foreign Address State 
    tcp 0 0 0.0.0.0:ssh 0.0.0.0:* LISTEN 
    tcp 0 0 192.168.1.1:80 0.0.0.0:* LISTEN 
    tcp 0 0 0.0.0.0:53 0.0.0.0:* LISTEN 
    udp 0 0 0.0.0.0:53 0.0.0.0:* 
    Active UNIX domain sockets (only servers)
    Proto RefCnt Flags Type State I-Node Path



    
    user@myRouter:user# netstat
    Active Internet connections (w/o servers)
    Proto Recv-Q Send-Q Local Address Foreign Address State 
    tcp 0 48 myRouter:ssh coffeeShop:10493 ESTABLISHED


Well, netstat on the router doesn't show anything weird (these are cut down a bit).  SSH is listening, the webserver is listening on, domain is listening, and my current SSH connection is open.

I have to forward a port on my laptop through a computer at home to access the router's admin webpage, but when I do I don't find anything unusual.  I find nothing that suggests that port 1111 is forwarded anywhere.  Running iptables on the router doesn't show anything unusual, either.

Furthermore, netcatting to 1111 from the router yields a "connection refused", as does netcatting to it from any computer internal to the home network.  Netcatting to 1111 from the coffee shop, however, yields a completed connection but no obvious clues as to what the remote server is.

I use the router's admin webpage to forward port 1110 to a home server, on which I'm running a listening netcat.  I'm able to connect to the internal netcat from the coffee shop.  I try that again on ports from 1111 to 1113 and find that I connect to the strange remote server when 1111 is "forwarded", the connection times out on port 1112, and the connection works again when 1113 is forwarded.

So, what could it be?  Perhaps the router has a rootkit, or some strange feature I didn't know about, that listens on port 1111, blackholes 1112, and doesn't permit me to see the port configuration on the router itself or from inside the network.  Alternatively, the cable modem has some administration server set up on 1111 and blackholes 1112.  There's some evidence for this option, as other folks have noted cable modem admin software running on port 1111.  A third option is that my Internet provider has something listening on that port at some other point along the connection.  This seems least likely, but not impossible.  (I guess a fourth option is that the coffee shop's ISP had something listening there).

Both of the last two options suggest some kind of misconfiguration on my Internet provider's part.  Now I'd like to listen to the packets between my cable modem and router, but I'm at a coffee shop.  Instead, I tell the router to reboot and try to SSH into it (and a server internal to the network for good measure) and port 1111 at the same time.  I find that the port 1111 connection completes, but both SSH connections fail.  Now it's almost certain that the port 1111 connection is not to anything I own.

Unfortunately, by the time I got home later that evening the port 1111 listener had disappeared.  I used my cellphone's Internet connection and a remote server to verify the disappearance.  The trail had run dry, but at least I was fairly certain that odd connection didn't signify a rootkit on my network.
