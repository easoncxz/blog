---
title: Manual Booting with GRUB2!
wordpress_id: 605
wordpress_url: http://blog.easoncxz.com/?p=605
date: '2013-05-15 00:14:50 +1200'
date_gmt: '2013-05-14 12:14:50 +1200'
categories:
- User
tags:
- GRUB
- Windows
comments: []
---
<p>I'm glad I got this done, now I'd better write it down to share and reference.</p>
<h4>Install GRUB/GRUB2</h4>
<p>Had a Ubuntu Live CD booted up, I ran something like <a href="http://www.howtogeek.com/114884/how-to-repair-grub2-when-ubuntu-wont-boot/" target="_blank">this</a>:</p>
<pre>$ sudo mount /dev/sdb3 /mnt
$ sudo grub-install --boot-directory /mnt /dev/sdb</pre>
<p>And GRUB or GRUB2 would be installed. The command is identical for the 2 versions of GRUB, I don't know how to distinguish between which GRUB is actually installed.</p>
<h4>Boot Linux</h4>
<p>So I am now in the GRUB* on my internal hard drive. This GRUB came with Fedora 18. To manually boot Ubuntu on my external hard drive, I used something like <a href="http://forums.justlinux.com/showthread.php?152790-How-to-use-Grub2-to-boot-Linux-manually" target="_blank">this</a>:</p>
<pre>grub &gt; set root=(hd1,sda3)
grub &gt; linux /vmlinuz-blahblah root=/dev/sdn9
grub &gt; initrd /initrd-blahblah
grub &gt; boot</pre>
<p>And Ubuntu from my external drive should have booted up.</p>
<h4>Boot Windows 8</h4>
<p><em>Note: When I installed this copy of Windows 8, my CMOS hardware was based on BIOS instead of UEFI, and my hard drive was partitioned with MBR instead of GPT.</em></p>
<p>I plugged my external hard drive onto a SATA port, and unplugged my original internal hard drive (for the sake of making the case simple). I tried booting Windows 8 like <a href="https://wiki.archlinux.org/index.php/GRUB#Multiboot" target="_blank">this</a>:</p>
<pre>grub &gt; set root=(hd0,sda6)
grub &gt; ntldr /bootmgr
grub &gt; boot</pre>
<p>And Windows 8 booted up perfectly! Seems like even if the Windows 8 copy was installed on UEFI hardward it should <a href="http://askubuntu.com/questions/211339/windows-8-wont-boot-after-installation-of-12-10" target="_blank">still work</a>.</p>
<p>This is nice; I am excited about it!</p>
