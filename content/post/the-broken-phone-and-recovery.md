---
author: finity
date: 2019-07-26 21:00:07+00:00
draft: false
title: The Broken Phone and Recovery
type: post
url: /2019/07/the-broken-phone-and-recovery/
categories:
- Blog
tags:
- Android
- Google
- Pixel
- tech tips
- TOTP
- two factor authentication
- uBreakIFix
---




A couple tips about getting an Android phone working again when you're on the road are down below, along with tips about TOTP codes when your phone dies.  I set those apart.  But first, the background.







Recently, my Google Pixel stopped working for phone calls.  That's a big deal when you're trying to move across the country.  Not to mention the fact that failing to work for phone calls is an existential crisis for a cell phone.







The speaker sometimes didn't work, the microphone didn't work...  Sometimes rebooting helped.  Then the problem got worse, and the speaker and microphone never worked, and sometimes it would reboot itself and still not work.







This is a known issue with the Google Pixel devices.  It's a manufacturer's defect that they announced shortly after I purchased my device in late 2017.  My warranty ran out, then a year later my phone started acting up, and about that time Google lost a lawsuit about this issue.







It was a big deal for them.  You'd think their service folks would know this, and know the way the repair/refund process work.  If they did, they didn't tell me.







They told me to go to uBreakIFix - great idea.  I've had good luck with them in the past.  "Will this repair be free?"  I expressed my concern.  "Just take it to uBreakIFix to get it fixed."  They failed to answer my concern.  "I'm moving across the country and really can't wait for it to be fixed at this time."  "Just take it to uBreakIFix to get it fixed."







I was not happy.







I manage with the phone through my trip.  Typically, I don't need to make many phone calls.  However, while moving, I need to make several.  There's out-processing at my old unit.  There's in-processing at my new unit.  There's working with the apartment complex folks, the hotel folks, the old property management company, the old insurance company, the new insurance company for the apartment, the potential new insurance companies for my property, the gas company, the electric company, interviewing and feedback with my last boss, family and friends along the way, and that 911 call I made because some old guy was walking down the highway in the wrong direction in the middle of nowhere and my god if he was my grandpa I'd hope someone would call 911 for him even if he doesn't look particularly distressed just a little confused.







I had found a workaround - the phone mostly worked on Bluetooth if I rebooted it right before making a call.







At my destination I ducked into uBreakIFix at my earliest opportunity.  They confirmed that the main board needed to be replaced, and that a new mainboard would appear the next afternoon.  They'd keep the phone until the following evening, and I could get it back before closing.







Most importantly, Google was paying for the replacement.







Awesome!  If only Google's service reps had told me this on the phone, I wouldn't have emailed three of their managers!  If only the managers had told me this by email, I wouldn't have held a grudge for two weeks!  Well, less of a grudge.







uBreakIFix fixed the phone and I went in for pickup.  At pickup they told me it was "tested, and everything worked."  The battery was so close to dead I didn't touch the phone until I got back to my room.







Back on the charger, the mobile network didn't seem to work.  I had zero bars, even outdoors where I'd had bars the day prior, and the phone wasn't able to do anything with the network.  I wasn't able to login to the hotel WiFi because uBreakIFix had left it in the initial Android setup, and that wasn't handling the hotel portal page at all.  Android told me the new WiFi adapter MAC, but my Linux MacBook wasn't letting me emulate that MAC over WiFi for some reason (trying to bypass the portal on my laptop...).







So, first tip:







> When you're stuck with no data, skip Android setup.  Don't specify an account, just let your phone be a blank slate.  Then, login to WiFi, factory reset your phone, and next time it starts up you can go through setup without being stuck at the hotel captive portal - your new MAC has already authenticated to it.
> >
> 







Alright, so, easy fix.  My first thoughts were to go much more complicated, and at one point I thought I'd have to find some open WiFi somewhere else to get things setup.  This fix simplified things, and let me setup the phone perfectly regardless.







Mobile network still didn't work, and uBreakIFix was closed at this point.  "We tested everything!"  No they didn't.  If they didn't test the mobile network, they didn't even test phone calls - the one reason I actually brought the phone in.







Then, I tried to login to my Google account.  The account provided multiple methods for two-factor authentication - Authenticator app code, text message, and backup code.  The first option was dead because uBreakIFix erased the app when they installed the new mainboard (I knew this would happen...).  I couldn't install a new Authenticator app because I would have to sign in to my Google account to get access to the app store (Catch-22).







Text message two-factor was dead because I had no mobile network service.  This was really the option I counted on to never be broken...  It was broken.







I had a fallback - the backup codes.  I've saved them!  I pulled them out and - all failed.  I'm not sure at which point I generated new codes, but I must have.  Bummer.







So - a couple tips here for how I got moving past this...







> Each time you setup a new Time-based One Time Password (TOTP) token, such as, with Google Authenticator, record the key in your encrypted password storage solution!
> >
> 







Hrm, I think we need a tip before that one....







> Use an encrypted password storage solution!  One you can get at without needing two-factor authentication!  One that you can get to with only a password, or a couple passwords!
> >
> 







Everyone should really be doing that at this point...  Not everyone is, I know.  I use KeePassXC in Linux, and KeePass2 on my Android.  I share the database file between both with DropBox.  This system works well for me, and is free.  I have a good password keeping these secrets safe.  I (now) put the TOTP keys in the password safe notes section, but KeePassXC also has a TOTP option.







So - how can you generate TOTP tokens now?  You can use KeePassXC's option, or you can use the Linux command line.







```
oathtool --base32 --totp "KEY HERE"
```
[https://thirld.com/blog/2016/01/16/generating-two-factor-authentication-codes-on-linux/](https://thirld.com/blog/2016/01/16/generating-two-factor-authentication-codes-on-linux/)






Install oathtool, drop the key there on the command line...  Hit enter.  This worked nicely.  Maybe stick a space before the oathtool command so your key isn't stored in command line history - or change the key again after you have to use this technique (the key was probably visible in the process list, at least to root on your box...).







Regardless - this can get you past that initial TOTP need.







My provider, GoogleFi, listed some troubleshooting procedures for this point.  Update Android as far as possible, update the Hangouts, GoogleFi, and Messages apps, try again.  uBreakIFix had left the phone at Android 7 instead of Android 9 - the update process took several hours that night and a couple the next morning.  It's not entirely labor-free, either.  I had to check it periodically, and had to stay in range of WiFi.







The GoogleFi phone tech had few new suggestions.  I was able to call him via Hangouts on my laptop...







uBreakIFix took the phone back the next day, checked connections, and told me a new mainboard would be in the following afternoon.







They'd call me when it was done!  I reminded them that my phone was broken, and an email might work better.  They agreed.







The next day I heard nothing from them.  Late in the afternoon I stopped by to determine fix status - "Oh, we didn't get the part today for some reason."  "What reason?" I asked.  "We don't know."







Ok - not the A team here.  I let them keep it another day, they thought the shipment would be in the next day.







It wasn't.  They didn't just call me to let me know, or email me, for that matter.







"Well, our parts for Pixel are delayed until Tuesday."  They told me this after letting me wait to talk to someone for 20 minutes - techs walking in and out around me, knowing me.  I'm that tall guy with the Pixel problem.







"I have to travel Tuesday guys.  I'm gonna need my phone back."







For their part, the uBreakIFix called the one in DC to let them know about my problem, and that I'd need a new mainboard.







The uBreakIFix DC location fixed my phone the day after I dropped it off, when the replacement part came in.  They were quick, and didn't leave me waiting unnecessarily.  They tested things before they gave them back to me.







I still consider uBreakIFix to be pretty great at what they do - although maybe not Idaho's...



