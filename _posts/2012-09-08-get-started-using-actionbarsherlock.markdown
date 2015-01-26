---
title: get started using ActionBarSherlock
excerpt: "<a title=\"Action Bar Sherlock\" href=\"http://actionbarsherlock.com/\"
  target=\"_blank\">ActionBarSherlock</a> is a third-party Android Java library introduced
  by Jake Wharton (<a href=\"http://twitter.com/JakeWharton\">@</a>/<a href=\"http://profiles.google.com/jakewharton\">+</a>),
  that enables convenient implementation of the Ice Cream Sandwich Action Bar to Android
  devices from version 1.6 (i.e. API 4) up, majorly through the use of the official
  v4 Support Library.\r\n\r\nthis post talks about how to get started using ActionBarSherlock."
wordpress_id: 140
wordpress_url: http://blog.easoncxz.com/?p=140
date: '2012-09-08 23:45:49 +1200'
date_gmt: '2012-09-08 11:45:49 +1200'
categories:
- dev
tags:
- Android
- ActionBarSherlock
comments:
- id: 41
  author: Nero
  author_email: I@lcm.im
  author_url: ''
  date: '2012-09-16 04:34:38 +1200'
  date_gmt: '2012-09-15 16:34:38 +1200'
  content: "Comment.\r\nblog.liaocm.net (AKA lcm.im)"
- id: 721
  author: 如何使用ActionBarSherlock[翻译] | 你看不到的天空
  author_email: ''
  author_url: http://archieyang.info/?p=247
  date: '2013-03-27 16:01:33 +1300'
  date_gmt: '2013-03-27 04:01:33 +1300'
  content: "[...] 原文：Get started using ActionBarSherlock [...]"
- id: 1316
  author: Maurizio
  author_email: settepijo@gmail.com
  author_url: ''
  date: '2013-07-12 04:38:47 +1200'
  date_gmt: '2013-07-11 16:38:47 +1200'
  content: "I' have done everything but I get this error:\r\ncan you help me?\r\nthanks
    in advance.\r\n\r\n<!--more-->\r\n<pre>\r\n[2013-07-11 18:36:28 - GAIA] C:\\SVILUPPO\\Project\\workspace\\ActionBarSherlock\\res\\values-v14\\abs__styles.xml:4:
    error: Error retrieving parent for item: No resource found that matches the given
    name 'android:Widget.Holo.ActionBar'.\r\n[2013-07-11 18:36:28 - GAIA] C:\\SVILUPPO\\Project\\workspace\\ActionBarSherlock\\res\\values-v14\\abs__styles.xml:6:
    error: Error retrieving parent for item: No resource found that matches the given
    name 'android:Widget.Holo.ActionBar.Solid'.\r\n[2013-07-11 18:36:28 - GAIA] C:\\SVILUPPO\\Project\\workspace\\ActionBarSherlock\\res\\values-v14\\abs__styles.xml:8:
    error: Error retrieving parent for item: No resource found that matches the given
    name 'android:Widget.Holo.Light.ActionBar'.\r\n[2013-07-11 18:36:28 - GAIA] C:\\SVILUPPO\\Project\\workspace\\ActionBarSherlock\\res\\values-v14\\abs__styles.xml:10:
    error: Error retrieving parent for item: No resource found that matches the given
    name 'android:Widget.Holo.Light.ActionBar.Solid'.\r\n[2013-07-11 18:36:28 - GAIA]
    C:\\SVILUPPO\\Project\\workspace\\ActionBarSherlock\\res\\values-v14\\abs__styles.xml:12:
    error: Error retrieving parent for item: No resource found that matches the given
    name 'android:Widget.Holo.Light.ActionBar.Solid.Inverse'.\r\n[2013-07-11 18:36:28
    - GAIA] C:\\SVILUPPO\\Project\\workspace\\ActionBarSherlock\\res\\values-v14\\abs__styles.xml:15:
    error: Error retrieving parent for item: No resource found that matches the given
    name 'android:Widget.Holo.ActionBar.TabView'.\r\n[2013-07-11 18:36:28 - GAIA]
    C:\\SVILUPPO\\Project\\workspace\\ActionBarSherlock\\res\\values-v14\\abs__styles.xml:17:
    error: Error retrieving parent for item: No resource found that matches the given
    name 'android:Widget.Holo.Light.ActionBar.TabView'.\r\n[2013-07-11 18:36:28 -
    GAIA] C:\\SVILUPPO\\Project\\workspace\\ActionBarSherlock\\res\\values-v14\\abs__styles.xml:19:
    error: Error retrieving parent for item: No resource found that matches the given
    name 'android:Widget.Holo.Light.ActionBar.TabView.Inverse'.</pre>"
- id: 1368
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2013-07-18 06:33:34 +1200'
  date_gmt: '2013-07-17 18:33:34 +1200'
  content: "I don't know... I haven't been doing Android work for a while. \r\n\r\nHowever,
    you shouldn't be asking me - this post only intends to give you the idea of how
    ABS is supposed to be used - instead of pointing out details, or solving specific
    problems.\r\n\r\nYou should go for the official ABS sites for help. For now, \"good
    luck\"."
---
<p><a title="Action Bar Sherlock" href="http://actionbarsherlock.com/" target="_blank">ActionBarSherlock</a> is a third-party Android Java library introduced by Jake Wharton (<a href="http://twitter.com/JakeWharton">@</a>/<a href="http://profiles.google.com/jakewharton">+</a>), that enables convenient implementation of the Ice Cream Sandwich Action Bar to Android devices from version 1.6 (i.e. API 4) up, majorly through the use of the official v4 Support Library.</p>
<p>this post talks about how to get started using ActionBarSherlock.<a id="more"></a><a id="more-140"></a></p>
<p>bits better to have known before reading:</p>
<ul>
<li>about ActionBar</li>
<li>about the v4 Support Library (supposedly aka Compatibility Library)</li>
<li>how to make a Hello World app</li>
</ul>
<p>the purpose is to have the native ICS behaviour, look and feel on old devices, i.e. supposedly as old as Android 1.6, i.e. API 4. i am testing on Android 2.3 Gingerbread, i.e. API 9.</p>
<ol>
<li><em>create Android application project from existing code</em> using the /library folder from the downloaded ActionBarSherlock zip/tarball.</li>
<li>make sure for this project, the <em>Build Target</em> is exactly Android 4.0, i.e. API 14.</li>
<li>make sure this project has "Is Library" ticked (under right-click, "properties" , Android).</li>
<li><em>add</em> the Compatibility Library to the ActionBarSherlock project. to do this in eclipse, right-click on this project in the project explorer panel, go to "Android Tools" -&gt; "Add Support Library". (internet connection normally needed.)</li>
<li>create your own project (e.g. "myProj"). use a <em>Build Target </em>no lower than API 14, and use a MinSDK version that suits your need - which in my case is API 9. the API levels are simply stated in the Manifest.xml file.</li>
<li><em>add </em>the ActionBarSherlock project as a library for your myProj. (under right-click, "properties" , Android)</li>
<li>in your myProj, extend all your activities with "SherlockActivity" instead of "Activity". there are also all sorts of SherlockBlablabla, just take guesses yourself.</li>
<li>modify your myProj's Manifest.xml file. for the &lt;application&gt;, add or edit so that you have the attribute
<ul>
<li>
<pre>android:theme="@style/Theme.Sherlock"</pre>
</li>
<li>here, Theme.Sherlock has a variety of alternatives, e.g. Theme.Sherlock.Dark.ForceOverflow, Theme.Sherlock.Light.DarkActionBar.</li>
</ul>
</li>
<li>done. do whatever you want as if you're in ICS altogether - just make sure you are using <em>Sherlock</em> or <em>Support-v4</em> imports instead of normal <em>Android</em> ones when you have a choice. (common ones are Activity, Fragment, Menu.)</li>
</ol>
<p>reference:</p>
<ul>
<li><a id="id-131" title="Implementing Action Bar in pre-Honeycomb devices" href="http://collegewires.com/android/2012/07/implementing-action-bar-in-pre-honeycomb-devices/" target="_top">Implementing Action Bar in pre-Honeycomb devices</a></li>
<li><a href="http://www.youtube.com/watch?v=4GJ6yY1lNNY&amp;feature=player_embedded" target="_blank">Tutorial: Getting Started with Actionbar Sherlock 4.0</a></li>
</ul>
