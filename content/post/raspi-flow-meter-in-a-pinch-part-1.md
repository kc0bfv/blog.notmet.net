---
author: finity
date: 2016-08-19 23:16:50+00:00
draft: false
title: RasPi Flow Meter In A Pinch - Part 1
type: post
url: /2016/08/raspi-flow-meter-in-a-pinch-part-1/
categories:
- Blog
tags:
- engineering
- programming
---

META: This first part is about the problem that caused me to build the solution.  [Part 2](https://blog.notmet.net/2016/08/raspi-flow-meter-in-a-pinch-part-2/) is about the solution.

My new place has an awesome feature that was disabled when I moved in - a reverse osmosis water filter!  It's not a whole-house hookup, it's just for the refrigerator and a dedicated tap on the sink.  We definitely wanted to use this thing!  At first, I just turned it on and it seemed to work fine.  However, with a little time, I noticed that the output water from the filter never seemed to stop, and there was a small leak on the "filtered water" side...

[![A marketing image of a reverse osmosis filter.  There's a storage tank that holds about four gallons on the left, there's a five stage filtering system on the right.  The first three stages are long tubes along the bottom, they filter out sediment and shit.  The fourth stage is the reverse osmosis membrane.  It's the branes of the operation, but it's hidden behind the fifth stage and sitting on a small platform just above those first three cylinders.  Stage four and five are squat horizontal cylinders.  Stage five modifies water flavor.](https://static.notmet.net/wp-content/uploads/2016/08/RO-Filter.jpg)
](https://static.notmet.net/wp-content/uploads/2016/08/RO-Filter.jpg)

So - reverse osmosis filtering - it uses water flowing past a membrane to pull impurities out of the water on the other side of the membrane...  It uses water to filter water...  Pretty crazy.  That water that did the pulling, however, has to get dumped down the drain.  The filtering system wastes about 5 times as much water as we drink.  Not great, I know, but maybe I'll rig the thing up to water the plants later, or something.  It's not like the waste water got very dirty.

Anyway - that waste water never stopped running.  It was very wasteful.  The parts didn't really have numbers on them so I couldn't lookup the system to figure out what was wrong...  I just called some dude who knew.

And he wanted $340 to fix the thing!  Crazy.  I can figure this out.

I decided to start by fixing the small leak.  Start small!  I figured out how the hoses worked, then figured out how to look the system and spare parts up online, then rejiggered the output hose, and the leak stopped.  Score!

The waste water output is controlled by two valves.  One valve prevents backflow - when this is broken it frequently causes the waste water output to never stop.  The other valve is a pressure balance thing, so when the filtered water side pressure is close-enough to the input water pressure the valve closes off and it stops water from flowing through the filter.  Pretty slick!  When the pressure balance is broken it frequently causes the waste water output to never stop.  A little troubleshooting indicated that the pressure-balance valve was the real culprit.  Perhaps it was broken, or dirty, or just out of balance?

It was at about this point in the troubleshooting that I realized the output water was not continuously running anymore - the entire system seemed to be working properly.  I think solving the small output leak caused the pressure on the filtered size to raise enough that it closed the pressure-balance valve.

Problem solved!  Maybe...  I'm never very confident when problems with systems I don't understand very well seem to solve themselves...  It's nice, but not ideal.  Plus, it's hard to tell if the output water is really running a sensible amount.  The system has this tank built in to store up water, so even after we dispense a normal amount, the pressure in the filtered side is still pretty high - it's still high enough that the system doesn't need to filter more water right away.  That sets up this very nice natural hysteresis, which is great for the system but not great for troubleshooting.

To be confident everything is working, I need to monitor the waste water output for several days.  I do not want to watch the output valve for several days.  I need a data-recording flow meter.  Time to get nerdy!

---
### Comments:
####
[RasPi Flow Meter In A Pinch &#8211; Part 2 | blog.notmet.net](https://blog.notmet.net/2016/08/raspi-flow-meter-in-a-pinch-part-2/ "") - Aug 5, 2016

\[…\] ← Previous \[…\]
