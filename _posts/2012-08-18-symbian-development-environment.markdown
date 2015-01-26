---
title: Symbian development environment
excerpt: i am just in my first few steps in mobile development; and when i set up
  my Symbian development environment, Nokia hadn't yet announced giving up the Qt
  team. well, it has been a while ago when i set up my Symbian development environment,
  and i may get blurry when i come to details. however, i still wanted to write this
  article to keep a note of myself setting up the environment. therefor this article
  is just a piece of suggestive information.
wordpress_id: 15
wordpress_url: http://blog.easoncxz.com/?p=15
date: '2012-08-18 23:35:43 +1200'
date_gmt: '2012-08-18 11:35:43 +1200'
categories:
- dev
tags:
- Symbian
- S60
- Qt
comments: []
---
<p>i am just in my first few steps in mobile development; and when i set up my Symbian development environment, Nokia hadn't yet announced giving up the Qt team. well, it has been a while ago when i set up my Symbian development environment, and i may get blurry when i come to details. however, i still wanted to write this article to keep a note of myself setting up the environment. therefor this article is just a piece of suggestive information.<a id="more"></a><a id="more-15"></a></p>
<h4>my system info</h4>
<p>i supposedly had WinXP professional x86. my Symbian device was Nokia 5800XM.</p>
<h4>reference</h4>
<p>i couldn't find anything much around the web, perhaps because the platform is too out of date. however i did find a set of videos that really got me going:<br />
<a href="http://www.youtube.com/watch?v=5BgMJS3wC28">http://www.youtube.com/watch?v=5BgMJS3wC28<br />
</a><a href="http://www.youtube.com/watch?v=14Zp3reuLNY&amp;feature=channel&amp;list=UL">http://www.youtube.com/watch?v=14Zp3reuLNY&amp;feature=channel&amp;list=UL</a><br />
<a href="http://www.youtube.com/watch?v=kn37j9nhiWQ&amp;feature=channel&amp;list=UL">http://www.youtube.com/watch?v=kn37j9nhiWQ&amp;feature=channel&amp;list=UL</a></p>
<h4>process i summarized from the videos</h4>
<p>i was supposed to provide links to download these tools, but since i just mainly followed the videos,</p>
<ol>
<li>install the "Nokia Ovi Suite".<br />
(e.g. "Nokia_Ovi_Suite_webinstaller_ALL.exe")</li>
<li>install "ActivePerl_5.6.1 build 635". must be 5.6.1.635.<br />
i.e. "ActivePerl_5.6.1.635-MSWin32-x86.msi"</li>
<li>install the "S60 SDK".<br />
e.g. "S60_5th_Edition_SDK_v1_0_en.zip"</li>
<li>install IDE "Carbide C++".<br />
i.e.  "Carbide.c++_v2.0.exe"</li>
<li>install the "open C plugin".<br />
e.g. "s60_open_c_cpp_plug_in_v1_6_en.zip"</li>
<li>install "application trk" on your Symbian device.<br />
e.g. "s60_5_0_app_trk_3_1_2.sisx"</li>
<li>install the "Qt for Symbian" libraries. seems that 4.6 is preferred.<br />
i.e. "qt-symbian-opensource-4.6.0.exe"</li>
<li>install the IDE "Qt SDK".<br />
e.g. "qt-sdk-win-opensource-2009.05.exe"</li>
</ol>
<p>exoect total download size to be approx' 1.4GB.</p>
<h4>special notes</h4>
<ul>
<li>when installing Carbide C++, it's better to install v2.0, because it has out-of-the-box a GUI UI builder that can get you quickly started on constructin a native Symbian UI.</li>
<li>if you choose to use Carbide C++ v3.2, you would need to replace "application trk" with another app called CODA, e.g. "Public_CODA-1.0.5-b2-for-S60v5-Anna-Belle.sis", which could be expected to be found in your "?\QtSDK\Symbian\sis\common\" folder.</li>
<li>as you can see, there are two IDEs that could be used. use Carbide C++ to produce normal Symbian C++ programs, and use the "Qt Creator" in the Qt SDK to create apps in Qt C++.</li>
</ul>
