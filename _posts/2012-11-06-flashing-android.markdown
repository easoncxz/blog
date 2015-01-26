---
title: flashing Android
excerpt: "the device i used is my phone, Galaxy Nexus. i started with something like
  4.1.1, but that doesn't really matter. in this post, i am trying to note down only
  certain keywords. those who know about them may find it useful, as you might not
  be able to recite some operations. those who haven't known about them, can Google
  them as well.\r\n<ul>\r\n\t<li><code>/system/recovery_from_boot.p</code></li>\r\n\t<li><code>/system/media/bootanimation.zip</code>
  -&gt; <code>/data/local/bootanimation.zip</code></li>\r\n\t<li><code>/system/etc/security/otacerts.zip.bak</code></li>\r\n\t<li><code>adb
  get-state</code></li>\r\n\t<li><code>fastboot devices</code></li>\r\n\t<li><code>adb
  reboot-bootloader"
wordpress_id: 412
wordpress_url: http://blog.easoncxz.com/?p=412
date: '2012-11-06 01:06:41 +1300'
date_gmt: '2012-11-05 13:06:41 +1300'
categories:
- User
tags:
- Android
- Fastboot
- Nexus
comments:
- id: 214
  author: Easoncxz
  author_email: me@easoncxz.com
  author_url: http://easoncxz.com
  date: '2012-11-18 09:41:38 +1300'
  date_gmt: '2012-11-17 21:41:38 +1300'
  content: "/etc/security"
---
<p>the device i used is my phone, Galaxy Nexus. i started with something like 4.1.1, but that doesn't really matter. in this post, i am trying to note down only certain keywords. those who know about them may find it useful, as you might not be able to recite some operations. those who haven't known about them, can Google them as well.</p>
<ul>
<li><code>/system/recovery_from_boot.p</code></li>
<li><code>/system/media/bootanimation.zip</code> -&gt; <code>/data/local/bootanimation.zip</code></li>
<li><code>/system/etc/security/otacerts.zip.bak</code></li>
<li><code>adb get-state</code></li>
<li><code>fastboot devices</code></li>
<li><code>adb reboot-bootloader<a id="more"></a><a id="more-412"></a></code></li>
<li><code>adb reboot bootloader</code></li>
<li><code>fastboot reboot-bootloader</code></li>
<li><code>adb reboot recovery</code></li>
<li><code>adb reboot</code></li>
<li><code>fastboot reboot</code></li>
<li><code>fastboot oem unlock</code></li>
<li><code>fastboot oem lock</code></li>
<li><code>fastboot flash recovery CWM-6-blah.img</code></li>
<li><code>fastboot update -w takju-blah.zip</code></li>
<li><code>fastboot update takju-blah.zip</code></li>
</ul>
<div>reference:</div>
<div>
<ul>
<li><a href="https://developers.google.com/android/nexus/images">Factory Images for Nexus Devices - Android — Google Developers</a></li>
<li><a href="http://wiki.cyanogenmod.com/wiki/Fastboot">Fastboot - CyanogenMod Wiki</a></li>
<li><a href="http://www.tabletroms.com/forums/xoom-general-development/2677-disabling-system-updates-ota.html">Disabling System Updates (OTA)</a></li>
</ul>
</div>
