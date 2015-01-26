---
title: Microsoft Exchange, Android & QQ
excerpt: "我最近遇到一个需求：将一堆新联系人投入同步。我没有成功做到。\r\n\r\n这堆联系人一开始来自于一个<code>.vcf</code>文件；我将这个<code>.vcf</code>导入到了一台Android设备上的一个使用Microsoft
  Exchange协议的QQ邮箱帐号中。在我在设备上见到联系人被成功导入之后，我发现似乎 设备-服务器 不愿意开始对这些新的联系人进行同步。"
wordpress_id: 492
wordpress_url: http://blog.easoncxz.com/?p=492
date: '2012-12-16 15:22:46 +1300'
date_gmt: '2012-12-16 03:22:46 +1300'
categories:
- User
tags:
- Microsoft_Exchange
comments: []
---
<p>我最近遇到一个需求：将一堆新联系人投入同步。我没有成功做到。</p>
<p>这堆联系人一开始来自于一个<code>.vcf</code>文件；我将这个<code>.vcf</code>导入到了一台Android设备上的一个使用Microsoft Exchange协议的QQ邮箱帐号中。在我在设备上见到联系人被成功导入之后，我发现似乎 设备-服务器 不愿意开始对这些新的联系人进行同步。<a id="more"></a><a id="more-492"></a></p>
<p>我尝试了使用一个iOS设备通过Microsoft Exchange和一个QQ邮箱帐户同步联系人，成功将云端的1000+个联系人同步了下来。没有在iOS上作进一步的尝试。</p>
<p>我尝试了使用我的Android通过Microsoft Exchange和一个QQ邮箱帐户同步 邮件/日历/联系人 。结果成功将~100个联系人同步了下来。可是我随后在设备上手动新建了的几个联系人都没有在即使是「立即同步」的时候被同步上去。类似地，我在QQ邮箱的web界面手动新建了的几个联系人也没有被同步下来。由于看起来像是「只有首次同步能成功」，于是我在Android上删除了那个Exchange帐号，在QQ的web界面里上传了那个<code>.vcf</code>，通过翻阅列表确认联系人被成功创建之后，在Android上重新登录Exchange帐号。不幸的是，这次首次同步也没有成功：有很多联系人没有同步下来；换句话说，就是同步到一半就停了。</p>
<p>经尝试，我发现使用Gmail帐户同步联系人却反而没有问题：无论是首次同步，还是 在设备上/在云端直接 创建新的联系人，都能够立即完成同步。</p>
<p>现在打算进行的新的尝试是 用iOS/Symbian进行如同我已使用Android进行了的「到处新建几个联系人」的测试，以便排除QQ作为一个Microsoft Exchange服务提供商的问题。</p>
