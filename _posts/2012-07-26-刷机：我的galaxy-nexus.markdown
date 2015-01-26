---
title: 刷机：我的Galaxy Nexus刷Jelly Bean
excerpt: "UPDATE 20130111: 这篇文章写得太差劲了。日后重新写篇能读的。\r\n<h2>背景</h2>\r\n<p style=\"padding-left:
  30px;\">我前阵子买手机，在i9100和i9250之间选择。大致基于“原生Google”的想法，入了i9250, i.e. Galaxy Nexus. 以下简称GN。</p>\r\n<p
  style=\"padding-left: 30px;\">出于炫耀，开发环境等原因，我想将自己的GN刷成Android 4.1.1 (Jelly Bean).
  <em>（基带“i9250XXLF1”）</em></p>\r\n<p style=\"padding-left: 30px;\">环境：</p>\r\n<p
  style=\"padding-left: 30px;\">刷机之前，GN的系统是“4.0.4”（p.s. 基带“i9250XXLA2”），乃是由4.0.2的i9250XXKK6经OTA系统升级而来；这4.0.4完全可以认为是官方的。GN是“欧版”的。我的电脑是Win7x64.</p>\r\n<p
  style=\"padding-left: 30px;\"><em>另，我恰好能算是个Android开发者，所以我的电脑上有一套可用的Android开发环境（虽然似乎这没太大关系），并且恰好有Git（所以能执行\".sh\"的批处理）。</em></p>\r\n<p
  style=\"padding-left: 30px;\"><em>另2，我的机器的\"/system/build.prop\"里有“ro.product.name=yakjujp”而不是“=yakju”，所以我的OTA是三星——而不是Google——推送来的。</em></p>\r\n<p
  style=\"padding-left: 30px; text-align: center;\"><strong>//此文高度目录化，不必全读，挑你关心的看。"
wordpress_id: 50
wordpress_url: http://blog.easoncxz.com/?p=50
date: '2012-07-26 22:29:28 +1200'
date_gmt: '2012-07-26 10:29:28 +1200'
categories:
- User
tags:
- 刷机
- Android
comments: []
---
<p>UPDATE 20130111: 这篇文章写得太差劲了。日后重新写篇能读的。</p>
<h2>背景</h2>
<p style="padding-left: 30px;">我前阵子买手机，在i9100和i9250之间选择。大致基于“原生Google”的想法，入了i9250, i.e. Galaxy Nexus. 以下简称GN。</p>
<p style="padding-left: 30px;">出于炫耀，开发环境等原因，我想将自己的GN刷成Android 4.1.1 (Jelly Bean). <em>（基带“i9250XXLF1”）</em></p>
<p style="padding-left: 30px;">环境：</p>
<p style="padding-left: 30px;">刷机之前，GN的系统是“4.0.4”（p.s. 基带“i9250XXLA2”），乃是由4.0.2的i9250XXKK6经OTA系统升级而来；这4.0.4完全可以认为是官方的。GN是“欧版”的。我的电脑是Win7x64.</p>
<p style="padding-left: 30px;"><em>另，我恰好能算是个Android开发者，所以我的电脑上有一套可用的Android开发环境（虽然似乎这没太大关系），并且恰好有Git（所以能执行".sh"的批处理）。</em></p>
<p style="padding-left: 30px;"><em>另2，我的机器的"/system/build.prop"里有“ro.product.name=yakjujp”而不是“=yakju”，所以我的OTA是三星——而不是Google——推送来的。</em></p>
<p style="padding-left: 30px; text-align: center;"><strong>//此文高度目录化，不必全读，挑你关心的看。<a id="more"></a><a id="more-50"></a></strong></p>
<h2>参考资料</h2>
<h3 style="padding-left: 30px;">流程概括</h3>
<div style="padding-left: 60px;">Android4.1.1最详细完整刷机教程 含4.1.1完美Root与安装全屏助手 - 三星 Galaxy Nexus 论坛 - <a href="http://gfan.com/" target="_blank">gfan.com</a></div>
<div style="padding-left: 60px;"><a href="http://bbs.gfan.com/android-4605843-1-1.html" target="_blank">http://bbs.gfan.com/android-4605843-1-1.html</a></div>
<h3 style="padding-left: 30px;">关于原装Google固件</h3>
<div style="padding-left: 60px;">【申精】『傻瓜教程』一步一步教你刷官方4.1.1（更新ROOT） - 三星 Galaxy Nexus 论坛 - <a href="http://gfan.com/" target="_blank">gfan.com</a></div>
<div style="padding-left: 60px;"><a href="http://bbs.gfan.com/android-4580148-1-1.html" target="_blank">http://bbs.gfan.com/android-4580148-1-1.html</a></div>
<div style="padding-left: 60px;">【更新】GN 解锁+刷yakju版4.0.4 ROM [更新刷Radio] - Galaxy Nexus 教程/资源 - 三星 Galaxy Nexus 论坛 - <a href="http://gfan.com/" target="_blank">gfan.com</a></div>
<div style="padding-left: 60px;"><a href="http://bbs.gfan.com/android-3337214-1-1.html" target="_blank">http://bbs.gfan.com/android-3337214-1-1.html</a></div>
<h3 style="padding-left: 30px;">只求驱动</h3>
<div style="padding-left: 60px;">GN root 方法超简单 7月15日更新可以root 4.1.1最新更新 - Galaxy Nexus 教程/资源 - 三星 Galaxy Nexus 论坛 - <a href="http://gfan.com/" target="_blank">gfan.com</a></div>
<div style="padding-left: 60px;"><a href="http://bbs.gfan.com/android-3866765-1-1.html" target="_blank">http://bbs.gfan.com/android-3866765-1-1.html</a></div>
<h3 style="padding-left: 30px;">小痨贴：无关紧要，聊胜于无的参考</h3>
<div style="padding-left: 60px;">【新手必读】详解recovery，真正弄懂recovery - Galaxy Nexus 教程/资源 - 三星 Galaxy Nexus 论坛 - <a href="http://gfan.com/" target="_blank">gfan.com</a></div>
<div style="padding-left: 60px;"><a href="http://bbs.gfan.com/android-3421554-1-1.html" target="_blank">http://bbs.gfan.com/android-3421554-1-1.html</a></div>
<div style="padding-left: 60px;">解锁，root，刷recovery，刷基带，刷内核刷BL，刷系统（更新） - Galaxy Nexus 教程/资源 - 三星 Galaxy Nexus 论坛 - <a href="http://gfan.com/" target="_blank">gfan.com</a></div>
<div style="padding-left: 60px;"><a href="http://bbs.gfan.com/android-3421434-1-1.html" target="_blank">http://bbs.gfan.com/android-3421434-1-1.html</a></div>
<div style="padding-left: 60px;">亲测可用！7.11更新！官方正式Android 4.1.1 ！ROOT！全屏！ - 三星 Galaxy Nexus 论坛 - <a href="http://gfan.com/" target="_blank">gfan.com</a></div>
<div style="padding-left: 60px;"><a href="http://bbs.gfan.com/android-4495566-1-1.html" target="_blank">http://bbs.gfan.com/android-4495566-1-1.html</a></div>
<h3 style="padding-left: 30px;">大老贴：比较老，非常多样复杂的大帖子，不过同样无关紧要</h3>
<div style="padding-left: 60px;">◆◆◆Galaxy Nexus◆◆◆最详刷机方法大讲解，无忧刷机！ - 三星 Galaxy Nexus 论坛 - <a href="http://gfan.com/" target="_blank">gfan.com</a></div>
<div style="padding-left: 60px;"><a href="http://bbs.gfan.com/android-3529397-1-1.html" target="_blank">http://bbs.gfan.com/android-3529397-1-1.html</a></div>
<h2>概念解释</h2>
<p style="padding-left: 30px;">相关概念：bootloader, fastboot (fastboot mode), ADB, recovery, ROM, lock（锁）, radio（基带）。</p>
<h3 style="padding-left: 30px;">bootloader</h3>
<p style="padding-left: 60px;">bootloader是一个环境；这个环境似乎又叫做fastboot mode。它位于手机开机进入（我理解中的）Android之前，充当引导器的作用。有一个按键组合可以使手机从关机状态进入fastboot mode（我理解中的bootloader的图形界面）。bootloader不但用于引导，而且在bootloader这个环境中，还可以通过usb连接，用电脑来（使用ADB命令行）操作手机，进行诸如“刷机”（就是“写入ROM”的意思）。bootloader图形界面里，最大的字是当前选项，音量键选上下，电源键是确定。</p>
<h3 style="padding-left: 30px;">fastboot</h3>
<p style="padding-left: 60px;">fastboot是Android SDK的一个cmd命令行工具，设计用于，呃……刷系统。= =</p>
<h3 style="padding-left: 30px;">ADB</h3>
<p style="padding-left: 60px;">ADB全称是Android Debugging Bridge，本用途是给开发者调试程序。但是ADB命令可以在电脑上达到“操作手机本身系统的命令行”的效果。ADB这个词的出现主要跟驱动有关。</p>
<h3 style="padding-left: 30px;">recovery</h3>
<p style="padding-left: 60px;">reocvery，似乎是手机闪存上的另一个分区，可以装进小工具系统（类似“DOS工具箱”）。著名的“小工具系统”有CWM, 或者说ClockWork Mod. 比方说CWM这个recovery, 可以进行刷ROM，刷基带，root，备份/恢复ROM等诸如此类。CWM图形界面里，高亮的字是当前选项，音量键选上下，电源键是确定。</p>
<h3 style="padding-left: 30px;">ROM</h3>
<p style="padding-left: 60px;">ROM本来是Read Only Memory, 只读储存，但是出于我不知道的原因，这个词就是指将要写到手机里的（不妨说是）“系统映像”。</p>
<h3 style="padding-left: 30px;">OTA</h3>
<p style="padding-left: 60px;">OTA (Over The Air) 是Android“官方”的系统升级方法。手机向Google服务器发送自己的系统版本（以及一些别的系统信息），Google服务器则给出你手里那个机器“现在可以用了”的系统升级包。这个包，根据我个人的理解，不是一个完整的系统；它需要你现行系统的一些信息才能完成安装（i.e. 升级），因此OTA升级包的大小要比完整的系统要小不少，并且OTA包的版本似乎都是“从<span style="text-decoration: underline;">某版本</span>升到<span style="text-decoration: underline;">某版本</span>”这样明确的。版本不是指什么4.0.4，而是<span style="text-decoration: underline;">发布先后不同</span>的“4.0.4”；这个版本看起来形如“IMM76I”.</p>
<h3 style="padding-left: 30px;">lock</h3>
<p style="padding-left: 60px;">lock, 或者说“解锁”中的“锁”，指的不是什么网络锁（就是运营商限制），而是刷机锁。这个"lock"的状态会限制某些刷机操作（具体的我忘了）。但是由于解锁和重新上锁都是非常容易的事（虽然据说跟保修有点关系），所以我想都没想就解了，后来也加回去了。</p>
<h3 style="padding-left: 30px;">radio</h3>
<p style="padding-left: 60px;">radio，基带，大概就是什么电话模块啊，wifi模块啊，这些各种硬件在手机上的驱动。刷入错误的radio会导致什么电话/wifi不可用。（——现在这是废话了。驱动装错了，硬件能用么？）</p>
<h3 style="padding-left: 30px;">takju/yakju/yakjujp或yakju**</h3>
<p style="padding-left: 60px;">这是Google开发Android系统的时候为不同的受众分别开发的系统。大概上，yakjujp/yakjuzw等“yakju**”系统的机器的OTA升级是Samsung负责的，而takju和yakju是Google亲自维护的。takju/yakju中，似乎takju又是比yakju更“亲Google”的，因为“所有takju系统的机器都是从Google Play售出的”。takju据说也是接受OTA升级最快的。综上，就“亲Google”程度而言，大概有：takju&gt;yakju&gt;yakju**。</p>
<h2>素材收集</h2>
<h3 style="padding-left: 30px;">硬件</h3>
<p style="padding-left: 60px;">Samsung Galaxy Nexus GT-i9250, OS 4.0.4. （我感觉用我这个方法，似乎凡是欧版的机都行。）</p>
<p style="padding-left: 60px;">电脑。我的是win7 x64. （我感觉是个win7/winXP都行。）</p>
<h3 style="padding-left: 30px;">驱动</h3>
<p style="padding-left: 60px;">我是使用上面“只求驱动”那个帖子里的附件链接下载回来的。</p>
<p style="padding-left: 60px;">找<a href="http://bbs.gfan.com/android-3866765-1-1.html">http://bbs.gfan.com/android-3866765-1-1.html</a>中的 "GN-tools.part1.rar", "GN-tools-part2.rar".</p>
<h3 style="padding-left: 30px;">ROM</h3>
<p style="padding-left: 60px;">网上u存在很多修改过的ROM，但是我个人认为只有原厂的才是最可贵的。我用的是Google某官网上的 4.0.4 ROM。（随后再用“OTA包”“升级”到4.1.1。）</p>
<p style="padding-left: 60px;">找<a href="https://developers.google.com/android/nexus/images">https://developers.google.com/android/nexus/images</a>中"takju"那个（准确地说，是“takju-imm76i-factory-e8c33767.tgz”）。</p>
<p style="padding-left: 60px;">其实“yakju”应该也适用于同样的设备。</p>
<h3 style="padding-left: 30px;">OTA</h3>
<p style="padding-left: 60px;">由于官方那个4.0.4系统镜像的“版本”是"IMM76I", 所以找来是“从IMM76I”升级的OTA包。至于“到”，就当然是任意的4.1.1了。给出官方下载如下（虽然不是从Google的网页上点某条连接下载的，而是从论坛见到的；但是地址毕竟是google.com的，所以我相信是官方的。</p>
<p style="padding-left: 60px;">takju版系统（我刷了这个） <a title="http://android.clients.google.com/packages/ota/google_takju/5c416e9cf57f.signed-takju-JRO03C-from-IMM76I.5c416e9c.zip" href="http://android.clients.google.com/packages/ota/google_takju/5c416e9cf57f.signed-takju-JRO03C-from-IMM76I.5c416e9c.zip">http://android.clients.google.com/packages/ota/google_takju/5c416e9cf57f.signed-takju-JRO03C-from-IMM76I.5c416e9c.zip</a></p>
<p style="padding-left: 60px;">yakju版系统 <a title="http://android.clients.google.com/packages/ota/google_maguro/f946a4120eb1.signed-yakju-JRO03C-from-IMM76I.f946a412.zip" href="http://android.clients.google.com/packages/ota/google_maguro/f946a4120eb1.signed-yakju-JRO03C-from-IMM76I.f946a412.zip">http://android.clients.google.com/packages/ota/google_maguro/f946a4120eb1.signed-yakju-JRO03C-from-IMM76I.f946a412.zip</a></p>
<h3 style="padding-left: 30px;">recovery（及其工具）</h3>
<p style="padding-left: 60px;">现在想来，既然是CWM的recovery, 本来当然到CWM的网站下载了；不过稳定起见，还是给出我用过的工具。这条链接是从上面【素材】那里“流程概括”那个帖子里获得的。</p>
<p style="padding-left: 60px;">在<a href="http://bbs.gfan.com/android-4605843-1-1.html">http://bbs.gfan.com/android-4605843-1-1.html</a>中找"android_4.1-recovery.zip"。</p>
<h3 style="padding-left: 30px;">小工具</h3>
<p style="padding-left: 60px;">这些是代替你手打命令的小工具。看起来这些是哪里来的都一样；都最好自己稍微看看再执行。</p>
<p style="padding-left: 60px;">在<a href="http://bbs.gfan.com/android-4605843-1-1.html">http://bbs.gfan.com/android-4605843-1-1.html</a>中找"Galaxy Nexus fastboot v2.0.zip"</p>
<p style="padding-left: 60px;">在<a href="http://bbs.gfan.com/android-3337214-1-1.html">http://bbs.gfan.com/android-3337214-1-1.html</a>中找“flash404.zip”</p>
<h3 style="padding-left: 30px;">root相关</h3>
<p style="padding-left: 60px;">我并没有多少root经验；只是经过这次，我知道可以用如同CWM的东西来刷入一个什么"superuser_什么鬼.zip"来完成root. 则给出这样的zip一个。</p>
<p style="padding-left: 60px;">在<a href="http://bbs.gfan.com/android-4580148-1-1.html">http://bbs.gfan.com/android-4580148-1-1.html</a>中找"Superuser-3.1.2-arm-signed.zip"</p>
<h3 style="padding-left: 30px;">手机备份</h3>
<p style="padding-left: 60px;">在我看来，手机需要备份的内容有：联系人，短信，通话记录，自己的文件，程序列表（以便重新安装），大体积数据（音乐/照片等）。强烈推荐的同步软件是"SMS Backup +"，如下；剩下的同步内容，我就不出主意了。</p>
<p style="padding-left: 60px;"><a href="https://play.google.com/store/apps/details?id=com.zegoggles.smssync">https://play.google.com/store/apps/details?id=com.zegoggles.smssync</a></p>
<h2>操作流程概述</h2>
<ol>
<li>装、检验fastboot mode驱动</li>
<li>备份手机所有数据。记录原系统信息，以备不测。拔SIM卡。</li>
<li>解锁</li>
<li>笼统地讲——“刷机”。（实质上是执行了包括“写入ROM”在内的几条fastboot命令）</li>
<li>刷入recovery</li>
<li>在recovery中刷入OTA包、重刷recovery</li>
<li>*root</li>
<li>上锁</li>
<li>检查：看是否有问题</li>
<li>恢复备份</li>
</ol>
<h2>操作方法</h2>
<ol>
<li>驱动：使用设备管理器，照一般驱动的方法安装。用【素材.小工具】里的Galaxy Nexus fastboot v2.0.bat检测是否成功</li>
<li>备份：自便。拔SIM卡。</li>
<li>解锁：用【素材.小工具】里的Galaxy Nexus fastboot v2.0.bat解锁。</li>
<li>刷机：我需要细述。请看下面细节。用到“takju-imm76i-factory-e8c33767.tgz”和“flash404.bat”。</li>
<li>写入recovery：在【素材.小工具】里的Galaxy Nexus fastboot v2.0.bat里选写入recovery. 注意，在.bat文件的相同目录那个recovery.img文件是会被调用到的；recovery.img大约有几个m大。搞定后，手机别关机/重启。</li>
<li>在recovery中刷入OTA包、重刷recovery：把“5c416e9cf57f.signed-<span style="text-decoration: underline;"><strong>takju-JRO03C-from-IMM76I</strong></span>.5c416e9c.zip”这个文件用自己的方法复制到GN“储存卡”上（我知道，其实是没有储存卡的；实际上去到了GN的"/mnt/sdcard"这个目录。）。进入recovery，选择从sd卡安装那个“5c416e9cf57f.signed-<strong><span style="text-decoration: underline;">takju-JRO03C-from-IMM76I</span></strong>.5c416e9c.zip”。若不需要root则可选：然后再跟之前那样再刷一次recovery。</li>
<li>*root: 把“Superuser-3.1.2-arm-signed.zip”这个文件用自己的方法复制到GN“储存卡”上（我知道，其实是没有储存卡的；实际上去到了GN的"/mnt/sdcard"这个目录。）。进入rocovery，选择从sd卡安装那个superuser什么的zip。</li>
<li>上锁：用【素材.小工具】里的Galaxy Nexus fastboot v2.0.bat上锁。</li>
<li>检查：尝试重启，恢复出厂设置等。注意recovery有没有失效（就是无法进入，见不到CWM图案etc），有没有什么异常变化。其实这时有什么问题，自己没所谓就都行的啦。</li>
<li>恢复：自便。</li>
</ol>
<h2>操作细节注释</h2>
<ol>
<li>驱动：安装GN在windows上的fastboot mode驱动，需要先使手机进入fastboot mode，然后将其与电脑usb链接，准备安装驱动。Android手机在电脑上似乎有三种驱动：“usb文件复制”的驱动；“ADB程序调试”的驱动；“fastboot mode刷机”的驱动。现在要的是fastboot mode的驱动。同时按住【音量+】【音量-】键不松开的同时按住【电源键】开机，震动后可松手。插上电脑后，设备管理器中要找的未驱动设备（有黄色小感叹号）叫做“Android 1.0”。为这个设备安装驱动。用的是右键单击方法，不细述。</li>
<li>备份：由于我是忠实的Google用户，所以我的联系人是和Google服务器保持同步的，所以我只需要同步短信，通话记录和别的那几个好办的。至于短信和通话记录，我这里<strong>强烈</strong>推荐"SMS Backup +"，通过使用gmail标签，以邮件形式将短信、通话记录存在gmail服务器上，可以原样恢复。就是有点慢。</li>
<li>解锁：解锁是为了允许某项刷机功能，具体的我忘了/不清楚。解锁似乎会失保，但是可以重新锁上。解锁和加锁，分别都只是单单一条fastboot命令。不解锁我就不知道该怎么做了。那个"Galaxy Nexus fastboot v2.0.bat"是很一般的cmd批处理；每执行完一个选项都会自动关掉。需要执行下一条选项的话就要重新双击打开。</li>
<li>刷机：这里我要详细说下。从Google下载回来的是一个.tgz压缩包，里面的"flash-all.sh"是Google给我们配备的刷机命令，只不过不是windows配备的cmd命令，而是linux/unix的bash命令；简而言之，这个"flash-all.sh"就是一个刷机的bash批处理文件。"flash-all.sh", 用写字板（write.exe）打开，可以见到，其内容是“刷入bootloader; 刷入radio; 刷入ROM”。但是由于是bash不是cmd，一般在windows下是执行不了的。这个时候，这寥寥数行命令就被翻译除了cmd版本，“flash404.bat”就是。不过注意，flash404.bat既然是代替flash-all.sh，就要跟它功能一样：位置相同、命令参数相同。你需要确认flash404.bat里面命令提及的文件名（一个什么bootloader的img文件，一个什么radio的img文件，一个什么takju或者yakju的zip文件）跟从code.google.com下载回来那个.tgz压缩包解压出来的三个文件的文件名一样。请右键点这个.bat,选“编辑”，就可以看其中的命令，以确使那三个文件的文件名跟『原来的flash-all.sh』所在目录的三个对应的文件的文件名相同。然后保存；将这个.bat文件复制到和原来"flash-all.sh"所在的同一个目录。注意整个完整路径（从“c:\”开始）都不能有中文。确认『.tgz解压出来的那三个文件』、『原来的flash-all.sh』、『修改后的flash404.bat』在同一个完整路径的目录；当然，手机要有充足的电（你有信心就行；反正刷到一半（尤其是bootloader）没电的话，手机八成就变成一块砖头开不了机了）；而且注意usb连接不会断、电脑不会忽然关机。然后就可以双击.bat刷机了。刷完之后就是4.0.4(IMM76I)了，可以玩会儿。其实这个时候，手机就是<span style="text-decoration: underline;"><strong>整个一个</strong></span>新的——所以这时，recovery，root等等，什么都没了。玩够了之后，把“IMM76I到JRO03C”的OTA升级包复制到“储存卡”（手机的“/mnt/sdcard”）你能找到的地方。然后可以关机了。<br />
<em>这里，我自己比较幸运的是，我第一次用flash404.bat失败了，出了个忘记什么的错误；但是由于我自己机器上有Git，所以<strong>能够</strong>执行bash命令行——我直接双击了Google那个.tgz解压出来的"flash-all.sh"就刷好机了，就接着我这里的步骤5了！</em></li>
<li>刷入recovery：上一个紧张的操作完成之后，你可以先拿4.0.4系统玩玩。玩够了之后，关机，进fastboot mode，把GN连上电脑，在“Galaxy Nexus fastboot v2.0.bat”里选“刷recovery”。注意，.bat需要和recovery.img同目录（只要没动这些文件过都没问题的）。成功后手机屏幕底部会出现蓝色消息栏提示。注意这个时候不要关机或重启——否则代价是你这才刷完的recovery白刷了——recovery-from-boot.p使得recovery又被抹掉了。不关机，而是选择fastboot mode界面里的“进recovery”。</li>
<li>在recovery中刷入OTA包、重刷recovery：上一步选了“进recovery”之后，就见到Google开机字样（以及一个小白锁），然后就是蓝色的CWM界面。用音量键和电源键，找到个什么鬼“update from sdcard”的选项，反正就是要“从sd卡”“刷（flash）刚才放进去的OTA那个zip”。刷要一会儿；刷完之后就是4.1.1了，而且应该和刚才新刷的4.0.4玩够了的时候状态一样。到此为止，你手里的已经是完全官方出厂原版的、经过了上一个系统轻度使用的Android 4.1.1 Jelly Bean了；并且没有recovery，没有Root。你要是满意，就可以开始用了。不过既然到这了，不妨再『锁回刷机锁』、『刷个recovery』、『root机』。先别关机，见下一步。</li>
<li>*root：刚才玩完4.1.1之后，将“Superuser-3.1.2-arm-signed.zip”复制到“储存卡”，关机，进fastboot，用第5步的方法再刷一次recovery，不要关机/重启，直接在fastboot mode里选择进recovery, 选一个从SD卡安装的选项，找到刚才放进去的“Superuser-3.1.2-arm-signed.zip”，选择安装。很快就会装完，这时重启/开机就好了。不过由于手机上“/system/recovery-from-boot.p”这个文件的存在，会使得每次开机时系统都会抹除recovery（就是CWM就用不了了）。怎么办呢？没事，root权限还是在的。想办法弄个什么root explorer之类的文件浏览器，使用root权限，进入"/system/"删除那个“recovery-from-boot.p”，就不会再发生了。不过recovery在刚刚在recovery里root完之后开机的时候就没了，所以需要重新关机，进fastboot, 用第5步的方法再刷一遍recovery就行了（所以貌似一共要刷recovery刷4遍 = =）。</li>
<li>上锁：简单，不解释。上锁成功的标志：普通开机的时候，屏幕上没有白色的小锁，只有白色Google字样（白色小锁又消失了）。</li>
<li>检查：就是看看recovery会不会还是“一重启就又没了”；恢复出厂设置会不会导致问题，诸如此类。没有问题就好。然后——</li>
<li>恢复：就恢复之前的备份吧。不用解释了。</li>
</ol>
<h2>后话</h2>
<ul>
<li></li>
<li>我看什么时候往我自己的skydrive传一套必需品材料。</li>
<li>还有各种截图。</li>
</ul>
