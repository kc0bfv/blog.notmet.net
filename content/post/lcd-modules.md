---
author: finity
date: 2011-04-01 15:38:00+00:00
draft: false
title: LCD Modules
type: post
url: /2011/04/lcd-modules/
categories:
- Blog
---

I've never built anything with an LCD on it before, but it seems like it'd be useful.  Here's some good info on creating an project with an LCD and an Arduino:  
  
[http://arduino.cc/en/Reference/LiquidCrystal](http://arduino.cc/en/Reference/LiquidCrystal)  
  
It's a library of functions that make it very easy to work with the LCD controller.  The controller has to be compatible with the HD44780 controller's instruction set, but that's basically an industry standard.  Mouser has a selection of 20x4 character displays:  
  
[http://www.mouser.com/Optoelectronics/Displays/LCD-Displays/LCD-Character-Display-Modules/_/N-6j737?P=1z0wula&Ns;=Pricing|0](http://www.mouser.com/Optoelectronics/Displays/LCD-Displays/LCD-Character-Display-Modules/_/N-6j737?P=1z0wula&Ns=Pricing%7C0)  
  
Probably most of these are compatible with HD44780, but one brand that I've seen a couple good comments on is Newhaven Displays.  Here are two of their products which people say are compatible with HD44780:  
  
[http://www.mouser.com/ProductDetail/Newhaven-Display/NHD-0420H1Z-FL-GBW-3V3/?qs=sGAEpiMZZMt7dcPGmvnkBkF%252b4jg01Mq8pANutZBT3Fk%3d](http://www.mouser.com/ProductDetail/Newhaven-Display/NHD-0420H1Z-FL-GBW-3V3/?qs=sGAEpiMZZMt7dcPGmvnkBkF%252b4jg01Mq8pANutZBT3Fk%3D)  
[http://www.mouser.com/ProductDetail/Newhaven-Display/NHD-0420H1Z-FSW-GBW/?qs=sGAEpiMZZMt7dcPGmvnkBq9RSAvEJGmR8NQyR9CrIfw%3d](http://www.mouser.com/ProductDetail/Newhaven-Display/NHD-0420H1Z-FSW-GBW/?qs=sGAEpiMZZMt7dcPGmvnkBq9RSAvEJGmR8NQyR9CrIfw%3D)  
  
The difference seems to be in the background color and input voltage: the first link is 3.3V, the second is 5V.  Here's some more info from Wikipedia:  
  
[http://en.wikipedia.org/wiki/HD44780_Character_LCD](http://en.wikipedia.org/wiki/HD44780_Character_LCD)  
  
And here is Hitachi's info on the command set for their oh-so-popular chip:  
  
[http://lcd-linux.sourceforge.net/pdfdocs/hd44780.pdf](http://lcd-linux.sourceforge.net/pdfdocs/hd44780.pdf)  
  
One thing I'm motivated to build with these guys is a computer-controlled thermostat.  I'll have to have a temperature sensor (thermistor maybe?), perhaps a wireless connection (XBee?), maybe one of these LCDs to describe the current settings, and if there's an LCD then definitely some buttons to allow setting the temp without firing up a web browser.
