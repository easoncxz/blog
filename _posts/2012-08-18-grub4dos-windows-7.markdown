---
title: GRUB4DOS & Windows 7
excerpt: "meta: 不了解启动过程的，有些字不认识的，可以先去看看我抄来的文章：<a title=\"Windows 7引导故障修复(BCD和MBR)\"
  rel=\"bookmark\" href=\"http://blog.easoncxz.com/?p=90\">Windows 7引导故障修复(BCD和MBR)</a>。其实我懂得只是一点；不过对于懂得少的读者而言也许正是好事。\r\n\r\nmeta:本文不完整，请先看最尾。\r\n\r\n<a
  title=\"from gna.org\" href=\"https://gna.org/projects/grub4dos\" target=\"_blank\">GRUB4DOS</a>是一个引导器（就像BOOTMGR）。它被安装在一般的硬盘（i.e.
  MBR硬盘）的MBR上（或者在某分区的PBR上），作用是将开机过程从BIOS接过来，然后启动某媒体（e.g. 某硬盘）上的某一个可引导的操作系统；或者作为一个“可引导的操作系统”被别的引导器引导（其被装在PBR上的时候往往是这样）。由于GRUB4DOS的安装方便、可以引导各种操作系统，我把它用作我一块硬盘在MBR上的引导器。这篇文章简介如何用GRUB4DOS。"
wordpress_id: 20
wordpress_url: http://blog.easoncxz.com/?p=20
date: '2012-08-18 17:56:08 +1200'
date_gmt: '2012-08-18 05:56:08 +1200'
categories:
- User
tags:
- GRUB4DOS
- GRUB
comments: []
---
<p>meta: 不了解启动过程的，有些字不认识的，可以先去看看我抄来的文章：<a title="Windows 7引导故障修复(BCD和MBR)" rel="bookmark" href="http://blog.easoncxz.com/?p=90">Windows 7引导故障修复(BCD和MBR)</a>。其实我懂得只是一点；不过对于懂得少的读者而言也许正是好事。</p>
<p>meta:本文不完整，请先看最尾。</p>
<p><a title="from gna.org" href="https://gna.org/projects/grub4dos" target="_blank">GRUB4DOS</a>是一个引导器（就像BOOTMGR）。它被安装在一般的硬盘（i.e. MBR硬盘）的MBR上（或者在某分区的PBR上），作用是将开机过程从BIOS接过来，然后启动某媒体（e.g. 某硬盘）上的某一个可引导的操作系统；或者作为一个“可引导的操作系统”被别的引导器引导（其被装在PBR上的时候往往是这样）。由于GRUB4DOS的安装方便、可以引导各种操作系统，我把它用作我一块硬盘在MBR上的引导器。这篇文章简介如何用GRUB4DOS。<a id="more"></a><a id="more-20"></a></p>
<p>GRUB4DOS似乎由两部分组成。其中，一部分在MBR里，这部分是在Windows Explorer里见不到的，并且特别小；另一部分（包括"grldr"这个文件）在某个分区里，貌似是用来被MBR那部分调用的。所以说白了，GRUB4DOS的安装过程可以很简单地完成：</p>
<ol>
<li>将MBR那部分写进MBR</li>
<li>将grldr那部分复制到某分区根目录</li>
</ol>
<p>就这样。= =</p>
<p>要做到这两点，需要：</p>
<ol>
<li>下载<a title="from gna.org" href="http://download.gna.org/grub4dos/" target="_blank">GRUB4DOS</a></li>
<li>把那个zip（e.g. "grub4dos-0.4.3-2007-03-10.zip"）里面文件夹里的文件解压到C:\。（使得存在"c:\grldr"等文件）</li>
<li>下载grubinst。比如从<a title="from sourceforge.net" href="http://sourceforge.net/projects/grub4dos/files/grubinst/grubinst%201.0.1/" target="_blank">sourceforge这里</a>。这grubinst到处都是，搜搜就能找到。</li>
<li>解压出来用管理员身份运行grubinst_gui.exe。</li>
<li>（...后面的暂时想不起来了。我是好一段时间前做的。我有空试试再补齐吧。就现在而言，不妨参考<a title="from 163.com" href="http://103525169.blog.163.com/blog/static/109899689201001954832880/">如何使用grubinst</a>，估计你也能搞定的（我把该文抄了一遍在<a title="from easoncxz.com" href="http://blog.easoncxz.com/?p=100">这里</a>）。</li>
</ol>
