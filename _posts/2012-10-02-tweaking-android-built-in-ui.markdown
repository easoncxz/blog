---
title: tweaking Android built-in UI
excerpt: "at first i thought it was a great big deal, involving <a title=\"Styles
  and Themes | Android Developers\" href=\"http://developer.android.com/guide/topics/ui/themes.html\"
  target=\"_blank\"><em>styles</em> </a>and all sorts of stuff. in the end i reckon
  that i should really have just <a title=\"KISS principle - Wikipedia, the free encyclopedia\"
  href=\"http://en.wikipedia.org/wiki/KISS_principle\" target=\"_blank\">KISS</a>.\r\n<h4>the
  aim</h4>\r\nthe built-in Android UI elements (e.g. <code>simple_spinner_dropdown_item</code>)
  aren't always satisfying. but creating *completely* custom UI elements is not what's
  wanted. the comprimise is to make changes to the built-in elements <strong>only
  where needed</strong>. e.g. i might want to just change the text color."
wordpress_id: 222
wordpress_url: http://blog.easoncxz.com/?p=222
date: '2012-10-02 16:48:09 +1300'
date_gmt: '2012-10-02 04:48:09 +1300'
categories:
- dev
tags:
- Android
comments: []
---
<p>at first i thought it was a great big deal, involving <a title="Styles and Themes | Android Developers" href="http://developer.android.com/guide/topics/ui/themes.html" target="_blank"><em>styles</em> </a>and all sorts of stuff. in the end i reckon that i should really have just <a title="KISS principle - Wikipedia, the free encyclopedia" href="http://en.wikipedia.org/wiki/KISS_principle" target="_blank">KISS</a>.</p>
<h4>the aim</h4>
<p>the built-in Android UI elements (e.g. <code>simple_spinner_dropdown_item</code>) aren't always satisfying. but creating *completely* custom UI elements is not what's wanted. the comprimise is to make changes to the built-in elements <strong>only where needed</strong>. e.g. i might want to just change the text color.<a id="more"></a><a id="more-222"></a></p>
<h4>how</h4>
<p>first, use the built-in UI elements as if that's what's wanted:</p>
<pre lang="java" line="1">SimpleCursorAdapter scaRows = new SimpleCursorAdapter(
	getApplicationContext(), <strong>android.R</strong>.layout.simple_spinner_item, rows, rowsFrom, rowsTo);
scaRows.setDropDownViewResource(<strong>android.R</strong>.layout.simple_spinner_dropdown_item);</pre>
<p>now if you are using eclipse just like me, just hold <code>CTRL</code> and click <code>android.R.layout.<em><strong>simple_spinner_item</strong></em></code>. to that, a new file would be opened, which is <code>simple_spinner_item.xml</code>. copy all its contents to a layout file in the layout folder in your project folder in your workspace, e.g. <code>/res/layout/simple_spinner_item.xml</code>, so that you can reference it in Java code like <code>R.layout.simple_spinner_item</code> , instead of using the <code>android</code> stuff anymore.</p>
<p>and then, simply add new attributes to the elements. e.g., add a <code>android:textColor</code> attribute:</p>
<pre lang="xml" line="1" escaped="true">&lt;TextView xmlns:android="http://schemas.android.com/apk/res/android"
    android:id="@android:id/text1"
    style="?android:attr/spinnerItemStyle"
    android:textColor="#000000"
    android:layout_width="match_parent"
    android:layout_height="wrap_content"
    android:ellipsize="marquee"
    android:singleLine="true" /&gt;</pre>
<p>and that does it!</p>
<h4>references,</h4>
<p>when i hadn't yet realized how simple the job was, i was looking over a whole bunch of stuff. here's some of them:</p>
<ul>
<li><a href="http://developer.android.com/guide/topics/ui/themes.html">Styles and Themes | Android Developers</a></li>
<li><a href="http://stackoverflow.com/questions/5966388/how-do-i-change-the-font-color-of-the-selection-list-in-a-spinner">android - How do I change the font color of the selection list in a spinner? - Stack Overflow</a></li>
<li><a href="https://www.google.com/search?q=android+spinner+item+text+color+override&amp;hl=en">android spinner item text color override - Google Search</a></li>
<li><a href="http://www.therealjoshua.com/2012/01/styling-android-with-defaults/">Styling Android With Defaults - Android Developer</a></li>
<li><a href="http://www.cnblogs.com/RayLee/archive/2010/12/02/1894566.html">善用Android预定义样式 - RayLee - 博客园</a></li>
<li><a href="http://stackoverflow.com/questions/1219312/android-selector-text-color">Android selector &amp; text color - Stack Overflow</a></li>
<li><a href="http://developer.android.com/guide/topics/ui/themes.html">Styles and Themes | Android Developers</a></li>
</ul>
