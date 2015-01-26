---
title: 在Galaxy Nexus上用自定铃声
excerpt: "Android弱爆了！连铃声都不给我选！这点上Android连S40都不如！就是不知道是否跟4.2的新时钟app有关？\r\n\r\n一共有3种想调调不了的铃声：\r\n<ul>\r\n\t<li>alarm:
  闹钟</li>\r\n\t<li>notification: 提示消息</li>\r\n\t<li>ringtone: 铃声"
wordpress_id: 455
wordpress_url: http://blog.easoncxz.com/?p=455
date: '2012-11-16 22:23:05 +1300'
date_gmt: '2012-11-16 10:23:05 +1300'
categories:
- User
tags:
- Android
- alarm
- notification
- ringtone
comments: []
---
<p>Android弱爆了！连铃声都不给我选！这点上Android连S40都不如！就是不知道是否跟4.2的新时钟app有关？</p>
<p>一共有3种想调调不了的铃声：</p>
<ul>
<li>alarm: 闹钟</li>
<li>notification: 提示消息</li>
<li>ringtone: 铃声<a id="more"></a><a id="more-455"></a></li>
</ul>
<p>我的尝试：在放置文件到每个目录后我都进行了重启。</p>
<ul>
<li>为了调ringtone
<ul>
<li>.mp3放到…
<ul>
<li><code>/sdcard/ringtones</code>，失败！</li>
<li><code>/sdcard/media/ringtones</code>，失败！</li>
<li><code>/sdcard/media/audio/ringtones</code>，成功！！</li>
</ul>
</li>
</ul>
<p>那我赶紧试试吧.mp3放到<code>/sdcard/media/audio/ringtones</code>和<code>/sdcard/media/audio/alarms</code>看行不行！</li>
<li>为了调alarm
<ul>
<ul>
<li>把.mp3放到…
<ul>
<li><code>/sdcard/media/audio/alarms</code>，失败！</li>
<li><code>/sdcard/media/alarms</code>，失败！</li>
<li><code>/sdcard/alarms</code>——更加失败了……</li>
</ul>
</li>
</ul>
</ul>
<p>于是我想，应该是文件大小或者编码格式的问题吧。于是，我从<code>/system/media/audio/alarms</code>复制出来一个内置铃声的.ogg文件到电脑上。然后，我用Adobe Audition裁了一段我的.mp3另存成.ogg。</p>
<ul>
<li>把.ogg放到…
<ul>
<li><code>/system/media/audio/alarms</code>，成功！</li>
<li><code>/sdcard/media/alarms</code>：待试。</li>
<li><code>/sdcard/alarms</code>：<del>待试。</del> 成功！</li>
</ul>
</li>
</ul>
</li>
<li>还有notifications没有试……</li>
</ul>
<p>参考：</p>
<ul>
<li><a href="https://play.google.com/store/apps/details?id=com.ringdroid">Ringdroid - Android Apps on Google Play</a></li>
<li><a href="http://productforums.google.com/forum/#!topic/mobile/4YbkFhwb9ow">Galaxy Nexus: problem uploading ringtones - Google Groups</a></li>
<li><a href="http://hi.baidu.com/odqrwfzhaqbcevq/item/1df5bb7d47d89b2ed7a89cd2">android 铃声设置文件夹_===_百度空间</a></li>
</ul>
