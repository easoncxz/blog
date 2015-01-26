---
title: Windows 7引导故障修复(BCD和MBR)
excerpt: "meta: 转载这篇文章是因为它让我比较清楚地了解了电脑的启动过程，但是这篇文章原文打不开了。幸好google cache里还有，赶紧抄下来放在这里。\r\n\r\n原文地址：\r\n<a
  href=\"http://www.jsjgz.cn/article/20110305/1299.html\">http://www.jsjgz.cn/article/20110305/1299.html</a>\r\n<a
  href=\"http://www.jsjgz.cn/article/20110305/1299_2.html\">http://www.jsjgz.cn/article/20110305/1299_2.html\r\n</a>\r\n<blockquote>\r\n<h1>Windows
  7引导故障修复(BCD和MBR)</h1>\r\n来源:计算机故障网 时间:2011-03-05 10:34"
wordpress_id: 90
wordpress_url: http://blog.easoncxz.com/?p=90
date: '2012-08-18 17:28:13 +1200'
date_gmt: '2012-08-18 05:28:13 +1200'
categories:
- User
- repost
tags:
- BOOTMGR
- Windows
comments:
- id: 9
  author: GRUB4DOS &amp; Windows 7 &raquo; Eason.C&#039;s Blog
  author_email: ''
  author_url: http://blog.easoncxz.com/?p=20
  date: '2012-08-18 17:57:14 +1200'
  date_gmt: '2012-08-18 05:57:14 +1200'
  content: "[...] meta: 不了解启动过程的，有些字不认识的，可以先去看看我抄来的文章：Windows 7引导故障修复(BCD和MBR)。其实我懂得只是一点；不过对于懂得少的读者而言也许正是好事。
    [...]"
- id: 10
  author: 用U盘安装Win7 &raquo; Eason.C&#039;s Blog
  author_email: ''
  author_url: http://blog.easoncxz.com/?p=22
  date: '2012-08-19 00:25:27 +1200'
  date_gmt: '2012-08-18 12:25:27 +1200'
  content: "[...] 对于不懂的概念，可以翻翻[repost]Windows 7引导故障修复(BCD和MBR)。别忘了不懂还可以Google。 [...]"
---
<p>meta: 转载这篇文章是因为它让我比较清楚地了解了电脑的启动过程，但是这篇文章原文打不开了。幸好google cache里还有，赶紧抄下来放在这里。</p>
<p>原文地址：<br />
<a href="http://www.jsjgz.cn/article/20110305/1299.html">http://www.jsjgz.cn/article/20110305/1299.html</a><br />
<a href="http://www.jsjgz.cn/article/20110305/1299_2.html">http://www.jsjgz.cn/article/20110305/1299_2.html<br />
</a></p>
<blockquote>
<h1>Windows 7引导故障修复(BCD和MBR)</h1>
<p>来源:计算机故障网 时间:2011-03-05 10:34<a id="more"></a><a id="more-90"></a></p>
<p>电脑加电后，首先是启动BIOS程序，BIOS自检完毕后，找到硬盘上的主引导记录MBR，MBR读取DPT(分区表)，从中找出活动的主分区，然后读取活动主分区的PBR(分区引导记录，也叫dbr，究竟该叫什么，网络上争论未休，我们姑且叫它pbr吧)，PBR再搜寻分区内的启动管理器文件 BOOTMGR，在BOOTMGR被找到后，控制权就交给了BOOTMGR。BOOTMGR读取bootbcd文件(BCD=Boot Configuration Data ,也就是“启动配置数据”，简单地说，windwows7下的bcd文件就相当于xp下的boot.ini文件)，如果存在着多个操作系统并且选择操作系统的等待时间不为0的话，这时就会在显示器上显示操作系统的选择界面。在我们选择启动WINDOWS7后，BOOTMGR就会去启动盘寻找 WINDOWSsystem32winload.exe，然后通过winload.exe加载windows7内核，从而启动整个windows7系统。</p>
<p>可以把这个过程简单地概括为：BIOS--&gt;MBR--&gt;DPT--&gt;pbr--&gt; Bootmgr--&gt;bcd--&gt;Winload.exe--&gt;内核加载 --&gt;整个windows7系统</p>
<p>本文就来说一说MBR--&gt;DPT--&gt;pbr--&gt; Bootmgr--&gt;bcd这一段可能出现的故障的解决。</p>
<p>mbr出现问题，主要是mbr代码被改写，因为被改写的代码不同，所以出错信息也各不相同。比如我们装了windows7与ubuntu双系统，ubuntu改写了mbr，在我们把ubuntu所在的分区格式化后，既进不了windows7，也进不了ubuntu，开机的时候会出现如图的错误提示：</p>
<p>解决的办法就是重写mbr。对于重写mbr，我们所熟知的是在dos下用fdisk /mbr命令进行重写。fdisk /mbr所重写的mbr与xp是兼容的，但是，与windows7已经不那么兼容了。实践表明：用fdisk /mbr命令重写windows7的mbr后，需要重建bcd，否则不能正常启动windows7。有网友指出，这里面的原因是fdisk /mbr命令改写了mbr中的硬盘签名。一般的分区工具都是可以重写mbr的，比如diskgenius，它所重写的mbr与windows7是兼容的。也可以用bootrec /fixmbr命令重写。要运行 Bootrec.exe 工具，必须启动 Windows RE。为此，请按照下列步骤操作：</p>
<p>插入windows 7安装光盘，从光盘启动电脑，在光盘启动完成后，按下shift f10键，调出cmd命令提示符。在cmd命令提示符中输入：bootrec /fixmbr 回车。这样也就重写了mbr。</p>
<p>分区表存在问题，对于这个问题，限于篇幅，不做详细探讨。</p>
<p>系统盘不是活动的主分区，这种情形只要用分区工具(比如diskgenius)把系统盘设为活动的主分区即可。</p>
<p>pbr出现问题，主要是pbr代码被改写，因为被改写的代码不同，所以出错信息也不相同。比如WINDOWS7系统的活动分区，却被写入了适合于XP的pbr，简单的解决办法就是用bootrec /fixboot命令重写pbr:</p>
<p>插入windows7安装光盘，从光盘启动，在光盘启动完成后，按下shift f10键，调出cmd命令提示符。在命令提示符中输入：bootrec /fixboot 回车。这样也就重建了活动分区的pbr。</p>
<p>这里面还有一个常用的命令也要提一下，这就是bootsect：</p>
<p>插入windows7安装光盘，从光盘启动，在光盘启动完成后，按下shift f10键，调出cmd命令提示符。在cmd命令提示符中输入：bootsect /nt60 sys /mbr</p>
<p>回车。这个命令会改写活动分区的pbr，并同时会改写mbr，使得mbr和pbr适合于windows7和vista。</p>
<p>bootsect.exe程序位于windows7安装光盘的boot目录下，可以把这个文件提取出来，在xp下的命令行可以运行这个程序，也可以在 winpe下的命令行运行这个程序，因而这个程序在使用时很方便。而bootrec.exe命令的使用就没这么方便了。所以BOOTSECT命令被应用得更为广泛一些。</p>
<p>另外有一个要点需要指出，vista的安装光盘里面的boot文件夹也存在着这个小工具，但vista的bootsect命令没有/mbr参数，因而它只能改写pbr，而不能改写mbr，这是必须要注意的。实践表明：把一个硬盘的mbr清零，然后运行windows7的bootsect命令，确实可以发现 mbr被恢复正常。这也就表明了windows7的bootsect命令的确能够重写mbr。</p>
<p>另外，bootsect命令也可以重写xp的mbr和pbr，而这也是bootrec命令所做不到的。xp的恢复控制台用fixmbr命令改写mbr,用 fixboot命令改写pbr。</p>
<p>如果是引导文件的问题，一般可以用bcdboot命令重新写入引导文件：</p>
<p>插入windows7安装光盘，从光盘启动，在光盘启动完成后，按下shift f10键，调出cmd命令提示符。在命令提示符中输入：</p>
<p>bcdboot x:windows /s x:</p>
<p>注意，这前一个x:是windows7的windows文件夹所在的盘，一般是c:，如果你的不是c盘，请改为对应的盘符。这后一个x:是活动主分区的盘符所在，一般也是c盘。所以这个命令一般的写法是：</p>
<p>bcdboot c:windows /s c:</p>
<p>但需要注意，在windows re环境下所看到的盘符与你在windows7下所看到的盘符未必一样。所以需要首先用dir /a命令确认各盘是否正确。</p>
<p>比如：</p>
<p>cd /d c:</p>
<p>dir /a</p>
<p>这两个命令的作用是，首先进入c:盘的根目录，然后显示c盘根目录下的所有文件和文件夹，根据所显示的文件或者文件夹，可以判断这个盘具体是你在 windows7下所看到的哪一个盘。</p>
<p>windows7的引导文件主要是bootmgr和boot文件夹里面的文件，而boot文件夹里面的文件主要是bcd文件。bcdboot命令会在指定的分区内重新写入全部windows7的引导文件。</p>
<p>如果只是bcd文件有问题，则可以用bootrec命令重建bcd:</p>
<p>插入windows7安装光盘，从光盘启动，在光盘启动完成后，按下shift f10键，调出cmd命令提示符。在命令提示符中输入：</p>
<p>bootrec /RebuildBcd</p>
<p>这个命令如果搜到没有写入bcd的windows7或者vista的操作系统，会提示你是否写入，按提示输入Y也就会写入了的。</p>
<p>或者用bcdedit命令手动改写bcd，但操作要复杂得多。</p></blockquote>
