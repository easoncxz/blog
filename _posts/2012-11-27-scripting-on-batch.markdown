---
title: scripting on batch
excerpt: "batch脚本，在我看来就是<code>cmd.exe</code>命令。这种脚本存在<code>.bat</code>或<code>.cmd</code>中，可以双击运行。今天我需要做一个来帮小白改<code>hosts</code>。\r\n\r\n目标：用户提供一个IP。抹除原<code>hosts</code>，然后将大量的Google域名绑到那个IP上。"
wordpress_id: 477
wordpress_url: http://blog.easoncxz.com/?p=477
date: '2012-11-27 22:25:13 +1300'
date_gmt: '2012-11-27 10:25:13 +1300'
categories:
- User
tags:
- CMD
- Batch
- Hosts
comments:
- id: 348
  author: 富二代
  author_email: chaoji2046@qq.com
  author_url: http://www.f2dys.com/
  date: '2012-12-12 19:16:42 +1300'
  date_gmt: '2012-12-12 07:16:42 +1300'
  content: 嘿嘿  这个收了，比手动改方便多了
---
<p>batch脚本，在我看来就是<code>cmd.exe</code>命令。这种脚本存在<code>.bat</code>或<code>.cmd</code>中，可以双击运行。今天我需要做一个来帮小白改<code>hosts</code>。</p>
<p>目标：用户提供一个IP。抹除原<code>hosts</code>，然后将大量的Google域名绑到那个IP上。<a id="more"></a><a id="more-477"></a></p>
<p>尝试：</p>
<pre>@echo off
set /p var=please provide a Google IP
echo %var% tse 32.334.23.32 &gt; %windir%\system32\drivers\etc\test.txt
set /p test=some aet ad;[
pause</pre>
<p>尝试成功。投入使用：</p>
<pre>@echo off
echo WARNING: your current hosts file WILL BE OVERWRITTEN.
set /p ipval=please provide a Google IP, or close the window: 
echo #http://OpenGG.me/geek/generate-hosts-for-google/ &gt; %windir%\system32\drivers\etc\hosts
@echo on

echo %ipval% v15.nonxt4.c.android.clients.google.com &gt;&gt; %windir%\system32\drivers\etc\hosts
echo #a shit lot of other lines like the one above

pause</pre>
<p>行了，就是这样。哦对了，这当然需要以管理员权限运行才有用。</p>
<p>参考：<a href="http://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file"><br />
</a></p>
<ul>
<li><a href="http://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file">command line - How to request Administrator access inside a batch file - Stack Overflow</a></li>
<li><a href="http://blog.csdn.net/flyingstarwb/article/details/6262117">BAT脚本编写要点(1)_特殊字符 - 小兵的专栏 - 博客频道 - CSDN.NET</a></li>
<li><a href="https://www.google.com/search?q=windows+batch+prompt+user+input+set+p&amp;oq=windows+batch+prompt+user+input+set+p&amp;aqs=chrome.0.57j62l3.9962&amp;sugexp=chrome,mod=10&amp;sourceid=chrome&amp;ie=UTF-8">windows batch prompt user input set p - Google Search</a></li>
<li><a href="http://stackoverflow.com/questions/1223721/in-windows-cmd-how-do-i-prompt-for-user-input-and-use-the-result-in-another-com">batch file - In Windows cmd, how do I prompt for user input and use the result in another command? - Stack Overflow</a></li>
</ul>
<p>&nbsp;</p>
<p>&nbsp;</p>
<p>&nbsp;</p>
