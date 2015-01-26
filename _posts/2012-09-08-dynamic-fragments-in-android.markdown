---
title: dynamic Fragments in Android
excerpt: "this post talks about how to dynamically show Fragments at runtime.\r\n\r\ndependencies
  for this post:\r\n<ul>\r\n\t<li>those in <a title=\"getting started with Fragments
  in Android\" href=\"http://blog.easoncxz.com/?p=123\" rel=\"bookmark\">getting started
  with Fragments in Android\r\n</a></li>\r\n</ul>\r\nlast time, the Fragment was statically
  called in an XML layout file. this time, it will be created at runtime in the Activity
  in which the Fragment is located."
wordpress_id: 129
wordpress_url: http://blog.easoncxz.com/?p=129
date: '2012-09-08 18:31:52 +1200'
date_gmt: '2012-09-08 06:31:52 +1200'
categories:
- dev
tags:
- Android
- Fragment
comments: []
---
<p>this post talks about how to dynamically show Fragments at runtime.</p>
<p>dependencies for this post:</p>
<ul>
<li>those in <a title="getting started with Fragments in Android" href="http://blog.easoncxz.com/?p=123" rel="bookmark">getting started with Fragments in Android<br />
</a></li>
</ul>
<p>last time, the Fragment was statically called in an XML layout file. this time, it will be created at runtime in the Activity in which the Fragment is located.<a id="more"></a><a id="more-129"></a></p>
<ol>
<ol>
<li>create the subclass of Fragment, e.g. to be  "Frag1", and the XML layout file that it should use, e.g. to be "frag1.xml".</li>
<li>modify the XML layout (e.g. "main.xml") for the main Activity, so that there is an empty ViewGroup in which the Fragment should be located. give this ViewGroup an id. as an example, just define an empty &lt;FrameLayout /&gt; as the root element of this XML layout:</li>
</ol>
</ol>
<pre>&lt;!-- in main.xml --&gt;
&lt;FrameLayout xmlns:android="http://schemas.android.com/apk/res/android"
    android:id="@+id/my_fragment_container"
    android:layout_width="match_parent"
    android:layout_height="match_parent" /&gt;</pre>
<ol>
<ol>
<li>load the XML layout in the main Activity class's method as usual. after that, use a few lines of code to have the Fragment displayed:</li>
</ol>
</ol>
<pre>//some method e.g. onCreate in the MainActivity class
Fragment f1=new Frag1();
f1.setArguments(mBundle);
FragmentManager fmgr=getFragmentManager();
FragmentTransaction trans=fmgr.beginTransaction();
trans.add(R.id.my_fragment_container, f1);
trans.commit();</pre>
<p>here,"mBundle" is a Bundle of key-values pairs as the parameters for the Fragment to use, and it can be null.</p>
<ol>
<li>done.</li>
</ol>
<p>reference:</p>
<ul>
<li><a href="http://developer.android.com/training/basics/fragments/fragment-ui.html">Building a Flexible UI | Android Developers</a></li>
</ul>
