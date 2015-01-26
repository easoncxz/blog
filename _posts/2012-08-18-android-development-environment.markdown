---
title: Android development environment
excerpt: "i'm a Windows user who wanted to try writing programs for my Android phone.
  to do this, i have set up an Android develop environment, i.e. a few programs that
  allow us to write programs for Android devices. this article shows the steps.\r\n\r\nmy
  system environment is (/~s are):\r\n<ul>\r\n\t<li>Window7 ultimate, both x86 and
  x64.</li>\r\n\t<li>Android, both 2.3 and 4</li>\r\n</ul>\r\nthe tools (i.e. programs)
  needed, in order of installation:\r\n\r\nnote: all these tools ought to be installed
  on the same partition. preferably C.\r\n<ol>\r\n\t<li><a title=\"Java Development
  Kit\" href=\"http://www.oracle.com/technetwork/java/javase/downloads/index.html\"
  target=\"_blank\">JDK</a>\r\ninstalled by running an installation package in windows.</li>\r\n\t<li><a
  href=\"http://www.eclipse.org/downloads/packages/eclipse-ide-java-developers/junor\"
  target=\"_blank\">eclipse</a>\r\ni used \"Eclipse IDE for Java Developers\". installed
  by extracting the zip file. (i.e. green installation)"
wordpress_id: 17
wordpress_url: http://blog.easoncxz.com/?p=17
date: '2012-08-18 14:58:21 +1200'
date_gmt: '2012-08-18 02:58:21 +1200'
categories:
- dev
tags:
- Android
comments: []
---
<p>i'm a Windows user who wanted to try writing programs for my Android phone. to do this, i have set up an Android develop environment, i.e. a few programs that allow us to write programs for Android devices. this article shows the steps.</p>
<p>my system environment is (/~s are):</p>
<ul>
<li>Window7 ultimate, both x86 and x64.</li>
<li>Android, both 2.3 and 4</li>
</ul>
<p>the tools (i.e. programs) needed, in order of installation:</p>
<p>note: all these tools ought to be installed on the same partition. preferably C.</p>
<ol>
<li><a title="Java Development Kit" href="http://www.oracle.com/technetwork/java/javase/downloads/index.html" target="_blank">JDK</a><br />
installed by running an installation package in windows.</li>
<li><a href="http://www.eclipse.org/downloads/packages/eclipse-ide-java-developers/junor" target="_blank">eclipse</a><br />
i used "Eclipse IDE for Java Developers". installed by extracting the zip file. (i.e. green installation)<a id="more"></a><a id="more-17"></a></li>
<li><a href="http://developer.android.com/sdk/installing/index.html" target="_blank">Android SDK</a><br />
installed by running an installation package in windows.<br />
prerequisite: JDK</li>
<li>Android SDK <a href="http://developer.android.com/sdk/installing/adding-packages.html" target="_blank">platforms and packages</a><br />
installed by using the "<em>SDK Manager.exe". </em>there are alternative methods that allow offline installation.</li>
<li>the eclipse plugin: <a title="Android Development Tools" href="http://developer.android.com/sdk/installing/installing-adt.html" target="_blank">ADT</a><br />
installed by using eclipse's built-in software plugin installer. there are alternative methods that allow offline installation.</li>
<li>perhaps the <a title="Android Debug Bridge" href="http://developer.android.com/tools/help/adb.html" target="_blank">ADB</a> USB driver for your device.<br />
get a hint on that on the <a href="http://developer.android.com/tools/extras/oem-usb.html" target="_blank">OEM USB Drivers</a> page of the official Android developers website. it's really just the driver for "USB debugging", as seen on: <a href="http://thedroidnation.com/wp-content/uploads/USB-Debugging1.png">http://thedroidnation.com/wp-content/uploads/USB-Debugging1.png</a></li>
</ol>
<p>and now you're off to <a href="http://developer.android.com/training/basics/firstapp/index.html" target="_blank">Hello World</a>!</p>
