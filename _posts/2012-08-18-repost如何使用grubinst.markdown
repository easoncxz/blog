---
title: 如何使用grubinst
excerpt: "本文抄自： <a href=\"http://103525169.blog.163.com/blog/static/109899689201001954832880/\">http://103525169.blog.163.com/blog/static/109899689201001954832880/</a>\r\n\r\n因为此文将grubinst的使用讲得比较详细，我总是想看，于是决定抄一份下来方便看，不怕弄丢。\r\n<blockquote>\r\n<h1>如何使用grubinst</h1>\r\n2010-01-19
  17:48:32"
wordpress_id: 100
wordpress_url: http://blog.easoncxz.com/?p=100
date: '2012-08-18 17:51:49 +1200'
date_gmt: '2012-08-18 05:51:49 +1200'
categories:
- User
- repost
tags:
- GRUB4DOS
- GRUB
comments:
- id: 1249
  author: GRUB4DOS &amp; Windows 7 &raquo; Eason.C&#039;s Blog
  author_email: ''
  author_url: http://blog.easoncxz.com/?p=20
  date: '2013-06-29 16:29:53 +1200'
  date_gmt: '2013-06-29 04:29:53 +1200'
  content: "[...] （&#8230;后面的暂时想不起来了。我是好一段时间前做的。我有空试试再补齐吧。就现在而言，不妨参考如何使用grubinst，估计你也能搞定的（我把该文抄了一遍在这里）。
    [...]"
---
<p>本文抄自： <a href="http://103525169.blog.163.com/blog/static/109899689201001954832880/">http://103525169.blog.163.com/blog/static/109899689201001954832880/</a></p>
<p>因为此文将grubinst的使用讲得比较详细，我总是想看，于是决定抄一份下来方便看，不怕弄丢。</p>
<blockquote>
<h1>如何使用grubinst</h1>
<p>2010-01-19 17:48:32<a id="more"></a><a id="more-100"></a></p>
<p>grubinst 可用于在Windows NT/2K/XP 和 Linux/FreeBSD 下把Grub4Dos启动代码安装到MBR/BS。其用法类似于bootlace.com。</p>
<p>grubinst_gui 是运行于Windows系统下的图形界面，利用它可以方便的使用grubinst的功能。</p>
<p>注意：grubinst只负责把GRLDR启动代码安装到 MBR/BS, 你还需要手动把GRLDR文件拷贝到某一FAT16/FAT32分区的根目录里。</p>
<p>1.1 grubinst_gui新手指南</p>
<p>在Windows NT/2000/XP 下，用以下的步骤可以快速地把Grub4Dos安装到MBR或分区中</p>
<p>前提：你必须拥有FAT16/FAT32的分区。如果全部分区均为NTFS，则请参考最后的部分。</p>
<p>1、下载grubinst,解压</p>
<p>2、双击grubinst_gui.exe</p>
<p>3、在"磁盘"右面的列表中选择需要安装Grub4Dos的硬盘/软盘，如果你有多个磁盘（包括USB移动硬盘&amp;），请留意[]中显示的磁盘大小，以便选择正确的磁盘。</p>
<p>4、若需要安装到分区，可点击"分区列表"右面的"刷新"按钮，然后从下拉列表中选择需要的分区（支    持FAT12/FAT16/FAT32/EXT2/EXT3）。若需要安装到MBR，这一步可省略。</p>
<p>5、若想以后能恢复原来的MBR/BS，则在"保存文件"中输入用于保存的文件名字。</p>
<p>6、点"安装"，出现命令窗口，如果看到"The MBR/BS has been successfully installer", 则说明安装成功。</p>
<p>当然，以上步骤只是安装启动代码，要能正常启动Grub4Dos，还需要以下的步骤：</p>
<p>7、从</p>
<p><a href="http://grub4dos.jot.com/WikiHome" rel="nofollow">http://grub4dos.jot.com/WikiHome</a> 或 <a href="http://download.gna.org/grub4dos/" rel="nofollow">http://download.gna.org/grub4dos/</a> 中下载最新版的Grub4Dos。</p>
<p>8、在压缩包中找到grldr，把它放到FAT16/FAT32分区的根目录中。</p>
<p>9、编辑menu.lst文件(应该放在和GRLDR一样的目录里)，以配置启动菜单。</p>
<p>若没有FAT16/FAT32分区，则不能把Grub4Dos安装到MBR/BS，而只能利用NT的启动管理器启动Grub4Dos:</p>
<p>1、下载Grub4Dos，把GRLDR解压到系统盘的根目录里(C:\)</p>
<p>2、编辑C:\boot.ini（此文件是隐藏的），在文件的最后加上</p>
<p>C:\GRLDR="Load Grub4Dos"</p>
<p>这样一行</p>
<p>3、编辑C:\menu.lst文件，以配置启动菜单。</p>
<p>4、下次启动Windows时，会增加"Load Grub4Dos"一项，选择它便能进入Grub4Dos</p>
<p>1.2 grubinst_gui使用指南</p>
<p>1、安装Grub4Dos到硬盘/软盘映像中。</p>
<p>在"文件"右面的输入框中输入映像文件名，则按"安装"时会安装到指定的映像中。</p>
<p>当修改的是软盘映像时，需要勾上选项"软盘映像"。</p>
<p>2、选项设置</p>
<p>只读模式：</p>
<p>模拟所需的操作，但不真正地把MBS/BS写到硬盘/映像中。</p>
<p>输出详细信息：</p>
<p>让后台程序grubinst输出更详细的信息，建议使用。</p>
<p>不保存原来的MBR (适用于安装到MBR时)</p>
<p>在修改原来的MBR前，grubinst会把原来的MBR保存到第二个扇区中。若选了这个选项，则屏蔽这一功能。</p>
<p>启动时不搜索软盘 (适用于安装到MBR时)</p>
<p>启动时，若在硬盘上找不到GRLDR，Grub4Dos会试图到软盘上去寻找。若选了这个选项，则屏蔽这一功能。</p>
<p>不引导原来的MBR (适用于安装到MBR时)</p>
<p>若原来的MBR保存在第二个扇区里，则当Grub4Dos找不到GRLDR时，会用原来的MBR来启动。若选了这个选项，则屏蔽这一功能。</p>
<p>优先引导原来的MBR (适用于安装到MBR时)</p>
<p>若选了这个选项，则优先使用原来的MBR来启动。</p>
<p>注意1: Grub4Dos只保留了一个扇区的空间来存储原来的MBR，若原来的MBR超过一扇区，则只有第一扇区被保存，因此不能用原来的MBR来启动。</p>
<p>注意2: 若使用了这一选项，则在启动时会有5秒的等待时间，若你在5秒内按了空格键，则启动Grub4Dos，按其他键或5秒超时的话便引导原来的MBR。等待时间和按键可以定制。</p>
<p>软盘映像</p>
<p>当你把Grub4Dos安装到软盘映像时，请勾上这一选项</p>
<p>注意1: 安装到物理软盘时，并不需要点这一选项</p>
<p>注意2：当你选择了映像文件，并刷新了分区列表时，程序会根据映像文件的类型自动设置这一参数。</p>
<p>注意3：安装到软盘映像或分区时，以上的适用于安装到MBR的各参数将不起作用</p>
<p>等待时间：</p>
<p>设置当优先引导原来的MBR时，启动的等待时间，缺省值是5</p>
<p>热键：</p>
<p>设置当优先引导原来的MBR时，启动Grub的热键，缺省值是空格。</p>
<p>注意：原来版本的grubinst(bootlace.com也一样)利用扫描码来代表按键，比如说，空格是 0x3920。但新版的grubinst允许用字符串来表示按键。比如说，a , ctrl-a , shift-a, alt-a, F1, home, end, space, key-5 (小键盘上的5键) 等等。</p>
<p>额外参数：</p>
<p>你可以在这里输入其他传给后台程序grubinst.exe的参数</p>
<p>3、恢复功能</p>
<p>保存文件：</p>
<p>指定用于保存/恢复的外部文件</p>
<p>从文件中恢复</p>
<p>没有使用了这一选项时，"安装"按钮是正常的安装操作，若保存文件框不是空，则指定用于保存原来的MBR/BS的文件</p>
<p>使用了这一选项时，"安装"按钮的操作变为从指定的保存文件中恢复原来的MBR/BS</p>
<p>从原来的MBR中恢复</p>
<p>使用了这一选项时，"安装"按钮的操作是从第二个扇区中恢复原来的MBR</p>
<p>注意1: 原来的MBR必须是单扇区，否则恢复后不能启动</p>
<p>注意2: 使用这一功能时，"保存文件"应该为空，并且不能选择"从文件中恢复"</p>
<p>4、"测试"按钮</p>
<p>用于显示传给grubinst的参数，但并不真正地调用grubinst。</p>
<p>注意: 这和"只读模式"是不同的。使用"只读模式"时调用了后台的grubinst，只是grubinst 不进行修改MBR/BS的操作。</p>
<p>特别说明：</p>
<p>1，此部分"附录：如何使用grubinst_gui"内容是应部分网友的要求增加的，全部引用自作者的说明文件。计划在官方文档中grubinst_gui相关内容发布后，删除此部分内容。</p>
<p>2，新版已增加对NTFS文件系统的支持，但目前可能仍存在不完善的地方，相关说明及使用方法可参看作者的帖子。</p></blockquote>
