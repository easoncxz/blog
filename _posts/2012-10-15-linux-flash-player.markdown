---
title: linux & flash player
excerpt: "今天在用ubuntu，尝试在firefox上安装flash插件。过程简直比我预想中的要简单得多，其实就三个字：『拷文件』！我这是第一次自己安装软件，所以一些过程顺便写下来，适合如我等小白翻阅。\r\n\r\n似乎<a
  href=\"http://get.adobe.com/flash\" target=\"_blank\">get.adobe.com/flash</a>上下载回来的<code>.tar.gz</code>不是源码，不用编译，拿来就用。<code>cd</code>到<code>.tar.gz</code>的目录，解压：\r\n<pre>tar
  -xvzf 那啥.tar.gz</pre>\r\n"
wordpress_id: 389
wordpress_url: http://blog.easoncxz.com/?p=389
date: '2012-10-15 20:47:38 +1300'
date_gmt: '2012-10-15 08:47:38 +1300'
categories:
- User
tags:
- Firefox
- Linux
- Ubuntu
- Flash
comments:
- id: 163
  author: Discrete
  author_email: veryczn@gmail.com
  author_url: http://blog.discrete.tk
  date: '2012-11-10 23:28:13 +1300'
  date_gmt: '2012-11-10 11:28:13 +1300'
  content: "要这么麻烦么……\r\n在archlinux里就一句话：\r\npacman -S flashplugin"
- id: 178
  author: Eason Chen
  author_email: me@easoncxz.com
  author_url: ''
  date: '2012-11-12 17:01:31 +1300'
  date_gmt: '2012-11-12 05:01:31 +1300'
  content: 我不知道。『只是复制文件』对我来说显得简单。讲来我还想向你求指导装Arch以体验下呢。
---
<p>今天在用ubuntu，尝试在firefox上安装flash插件。过程简直比我预想中的要简单得多，其实就三个字：『拷文件』！我这是第一次自己安装软件，所以一些过程顺便写下来，适合如我等小白翻阅。</p>
<p>似乎<a href="http://get.adobe.com/flash" target="_blank">get.adobe.com/flash</a>上下载回来的<code>.tar.gz</code>不是源码，不用编译，拿来就用。<code>cd</code>到<code>.tar.gz</code>的目录，解压：</p>
<pre>tar -xvzf 那啥.tar.gz</pre>
<p><a id="more"></a><a id="more-389"></a><br />
这里打『那啥』的前几个字母按tab即可自动完成。打开那个<code>readme.txt</code>看看，其中有部分如下：</p>
<pre>Installation instructions
-------------------------

Installing using the plugin tar.gz:
    o Unpack the plugin tar.gz and copy the files to the appropriate location.  
    o Save the plugin tar.gz locally and note the location the file was saved to.
    o Launch terminal and change directories to the location the file was saved to.
    o Unpack the tar.gz file.  Once unpacked you will see the following:
        + libflashplayer.so
        + /usr
    o Identify the location of the browser plugins directory, based on your Linux distribution and Firefox version
    o Copy libflashplayer.so to the appropriate browser plugins directory.  At the prompt type:
        + cp libflashlayer.so &lt;BrowserPluginsLocation&gt;
    o Copy the Flash Player Local Settings configurations files to the /usr directory.  At the prompt type:
        + sudo cp -r usr/* /usr

Installing the plugin using RPM:
   o As root, enter in terminal:
          + # rpm -Uvh &lt;rpm_package_file&gt;
          + Click Enter key and follow prompts

Installing the standalone player:
   o Unpack the tar.gz file
   o To execute the standalone player,
          + Double-click, or 
          + Enter in terminal: ./flashplayer

Uninstallation instructions
---------------------------

Manual uninstallation (for users who installed the plugin via Install script):
   o Delete libflashplayer.so binary and flashplayer.xpt file in 
   directory /home/&lt;user&gt;/.mozilla/plugins/

RPM uninstallation:
   o As root, enter in terminal:
          + # rpm -e flash-plugin
          + Click Enter key and follow prompts</pre>
<p>其中凡是说啥“RPM”的我都不管啦。按他说的做就是了。这里，我使用的所谓“<code>the appropriate browser plugins directory</code>”，对于firefox来讲，就是<code>/usr/lib/mozilla/plugins/</code>。</p>
<p>至于复制<code>usr</code>目录什么的，其实就是将解压出来的<code>usr</code>文件夹内的所有文件（"<code>usr/*</code>"）复制到<code>/usr</code>。</p>
<p>就是这样。firefox刷新下就能播flash内容了。简单到我都情何以堪了……</p>
