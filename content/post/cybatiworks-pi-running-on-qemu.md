---
author: finity
date: 2019-11-01 20:20:33+00:00
draft: false
title: CybatiWorks PI - Running on QEMU
type: post
url: /2019/11/cybatiworks-pi-running-on-qemu/
categories:
- Blog
---




CybatiWorks is an educational and research tool for learning about Industrial Control System cyber components.  I haven't used it much, but it looks like it'll simulate a PLC controlling a process, and it'll do it on a Raspberry PI, GPIO-connected hardware, and a controlling HMI (Human-Machine Interface) desktop.  You can buy the hardware pre-setup, then use it in a course.







The person who runs the company is Matthew Luallen, and he's quite responsive over email.  I've been trying to look into the system a bit, and CybatiWorks offers the RasPI image for free through their "Community" program.  Unfortunately that's run by Google+, and is now a broken link.  Emailing the responsive founder, however, will get you a link to the necessary image.







Now that I had the RasPI image though, I needed to run it, and didn't have a PI handy.  It was time for QEMU.  [This gentleman had a great start](http://scientia3s7potentia.blogspot.com/2016/01/cybatiworks-ics-pi-image-on-windows.html), and following his instructions allowed me to investigate the system partially, but that methodology gets you only 256MB RAM total.  I needed more to start up all the services in the image, so I could see them work together.







[QEMU's documentation had a way forward](https://wiki.qemu.org/Documentation/Platforms/ARM) - use the "virt" machine instead of versatile.., but this necessitated building a new kernel.  Something I learned during this process - kernels built for one ARM machine don't seem to work well on others.  I'm not 100% why, I've definitely seen lots of binaries work interoperably, but kernels seem to be very specific (at least with QEMU).







The RasPI image comes with a kernel, f3n3s7ra's page recommended a kernel...  Unfortunately the QEMU documentation recommends installing a Debian image to get the [kernel](https://notmet.net/downloads/debian_arm_kernel/vmlinuz-3.16.0-6-armmp-lpae) and [initrd](https://notmet.net/downloads/debian_arm_kernel/initrd.img-3.16.0-6-armmp-lpae).  That took several hours - now that I extracted them I've got them available for download via the links in the previous sentence (these came from the Debian project on 1 Nov 2019).







Once you've got initrd, vmlinuz, and CybatiWorksPI.img extracted from the email Matthew can send you, the command below will startup QEMU with a working network stack and kick you to a shell as root.  You may have to switch the window view over to "serial0".






```    
sudo qemu-system-arm -M virt -m 1024 -kernel vmlinuz-3.16.0-6-armmp-lpae -initrd initrd.img-3.16.0-6-armmp-lpae -drive if=none,file=CybatiWorksPI.img,format=raw,id=hd -device virtio-blk-device,drive=hd -netdev tap,id=ethdev -device virtio-net-device,netdev=ethdev -no-reboot -append "root=/dev/vda2 rootfstype=ext4 rw init=/bin/bash"
```






You won't get the typical startup sequence via systemd, and I haven't been able to get that working yet, but you can do something similar with the command below (from the QEMU command line).  This'll kick off runlevel 3 startup scripts.






``` 
cd /etc/rc3.d
for i in S*; do ./$i restart; done
```






Now an ifconfig should reveal that eth0 is up and at 172.16.192.30/24.  Back on your host computer "sudo ip add add 172.16.192.10/24 dev tap0" will configure tap0 to communicate with the QEMU box.  You should now be able to ping 172.16.192.30 from your host.







The default services now should be:  
TCP 22 - SSH  
TCP 80 - lighttpd  
TCP 2812 - [monit](https://mmonit.com/)  
TCP 7777 - RexWSTCP  
TCP 8000 - [WebIOPi](https://webiopi.trouch.com/)  
TCP 43981 - [RexCore](https://www.rexcontrols.com/)







If you want to run the HMI VM Matthew will send you, don't set your host to 172.16.192.30, so the VM can take that address.  After starting the VM up, you may have to configure subnets more intelligently, and IP forwarding on your host (so the different network devices in your host can communicate).



