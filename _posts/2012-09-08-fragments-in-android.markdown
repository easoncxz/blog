---
title: getting started with Fragments in Android
excerpt: "This article talks about how to get started using Fragments. dependencies
  for this post:\r\n<ul>\r\n\t<li>setting up an Android development environment</li>\r\n\t<li>creating
  a first application, e.g. hello world</li>\r\n\t<li>using XML files to define layout</li>\r\n\t<li>*using
  the Support Library (if build target is under API 11)</li>\r\n</ul>\r\nin order
  to use Fragments, either your build target have to be API 11 or above, or you have
  to use the Support Library. my example is given using eclipse as the IDE. this post
  implements Fragments statically in XML layouts, since it is for the purpose of just
  'getting started using Fragments\"."
wordpress_id: 123
wordpress_url: http://blog.easoncxz.com/?p=123
date: '2012-09-08 17:55:33 +1200'
date_gmt: '2012-09-08 05:55:33 +1200'
categories:
- dev
tags:
- Android
- Fragment
comments:
- id: 28
  author: dynamic Fragments in Android &raquo; Eason.C&#039;s Blog
  author_email: ''
  author_url: http://blog.easoncxz.com/?p=129
  date: '2012-09-08 18:31:55 +1200'
  date_gmt: '2012-09-08 06:31:55 +1200'
  content: "[...] getting started with Fragments in Android [...]"
---
<p>This article talks about how to get started using Fragments. dependencies for this post:</p>
<ul>
<li>setting up an Android development environment</li>
<li>creating a first application, e.g. hello world</li>
<li>using XML files to define layout</li>
<li>*using the Support Library (if build target is under API 11)</li>
</ul>
<p>in order to use Fragments, either your build target have to be API 11 or above, or you have to use the Support Library. my example is given using eclipse as the IDE. this post implements Fragments statically in XML layouts, since it is for the purpose of just 'getting started using Fragments".<a id="more"></a><a id="more-123"></a></p>
<ol>
<li>create an Android application project (e.g. "HelloFragment_r1").</li>
<li>in the package (e.g. "com.easoncxz.hellofragment_r1"), create a class (e.g. "Frag1", i.e. "com.easoncxz.hellofragment_r1.Frag1", aka the subclass of the Fragment class) that extends the Fragment class, so that a corresponding java file (e.g. "Frag1.java") is created in this package.</li>
<li>in the "res/layout/" folder, create an XML layout (e.g. "frag.xml") for the Fragment - with contents you like.</li>
<li><em>inflate</em>this layout in an appropriate method (e.g. "onCreateView") of  class "Frag1":
<ul>
<li>
<pre>//in the Frag1 class
public View onCreateView(LayoutInflater myInflater,ViewGroup myContainer,Bundle savedInstanceState){
    myInflater.inflate(R.layout.frag, myContainer,false);
}</pre>
</li>
</ul>
</li>
<li>as for the main Activity, load its XML layout file (e.g. main.xml) as usual.</li>
<li>modify "main.xml": add a &lt;fragment&gt; element where you want. this &lt;fragment&gt; element should have an attribute like:
<ul>
<li>
<pre>android:name="com.easoncxz.hellofragment_r1.Frag1"</pre>
</li>
</ul>
</li>
<li>done.</li>
</ol>
<p>reference:</p>
<ul>
<li><a href="http://www.tellittotheblog.com/post/2011/03/25/Super-Simple-Fragments">Super Simple Fragments - Tell It To The Blog</a></li>
<li><a href="http://developer.android.com/training/basics/fragments/index.html">Building a Dynamic UI with Fragments | Android Developers</a></li>
<li><a href="http://developer.android.com/guide/components/fragments.html">Fragments | Android Developers</a></li>
</ul>
<p>&nbsp;</p>
