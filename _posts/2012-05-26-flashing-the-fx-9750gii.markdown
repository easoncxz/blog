---
title: flashing the fx-9750GII
excerpt: "UPDATE 20130111: due to some of my personal data management issues, the
  skydrive link is indefinitly unavailable. i'll try and fix it soon (as in a month
  or so...). for the time being, just ask me for the stuff.\r\n\r\nUPDATE 20130116:
  I wrote a more succinct version of the story <a title=\"2.0: flashing Casio fx-9750GII\"
  href=\"http://blog.easoncxz.com/?p=538\" target=\"_blank\">somewhere</a>.\r\n\r\nUPDATE
  20130525: I finally bothered to upload the files to box.com.\r\n\r\n<span style=\"color:
  #999999;\">context:</span>\r\n\r\n<span style=\"color: #999999;\">i bought an <code>fx-9750GII</code>
  according to school recommendations. i previously had been using th <code>fx-82es</code>,
  and expected naturla display on any higher class casio calculators. however, casio
  upset me, because i did  not find any way to show natural display. i did some searches,
  and found out that it could gain natural display by flashing in an image of the
  <code>fx-9860GII</code>. so i started learning about it.</span>\r\n\r\nthe aim is
  to give fx-9750GII more functions, mainly being natural display.\r\n\r\n<span style=\"color:
  #000000;\">the idea is to flash in an <code>fx-9860</code> image. </span>\r\n\r\n<span
  style=\"color: #000000;\">in my process, i am using windows 7 (ultimate x64).</span>\r\n<h3><span
  style=\"color: #ff0000;\">disclaimer:</span></h3>\r\n<span style=\"color: #ff0000;\">this
  procedure includes flashing a system image into a digital device's ROM. flashing
  the inappropriate ROM image COULD POTENTIALLY KILL YOUR DEVICE!! with great benefit
  comes great risk, so do this at your own choice and responsibility. I AM NOT RESPONSIBLE
  for your consequences. understand the whole process before starting.</span>\r\n<h3><span
  style=\"color: #000000;\">here is the procedure:</span></h3>\r\n<ol>\r\n\t<li>\r\n<h4><span
  style=\"color: #000000;\">install the usb driver.</span></h4>\r\n<div><span style=\"color:
  #000000;\">this step is easy.</span></div>\r\n<div><span style=\"color: #000000;\">assuming
  you are using windows, just install the <code>FA-124 </code>from the CD that came
  out of the box, or find it on the casio official websites. make sure the driver
  is working well, by pressing <code>WinKey+R</code> then typing in <code>devmgmt.msc</code>
  , then seeing if there are any <em>yellow exclaimation marks </em>. if there are,
  then the calculator is plugged in, but the driver is not working properly. if there
  are not, either the calculator is not plugged in, or (, which is good, ) the calculator
  is plugged in and the driver is working properly.</span></div></li>\r\n\t<li>\r\n<h4>check
  your calculator version</h4>\r\n<div>this step is partially tricky, but the non-tricky
  part is necessary.</div>\r\n<div>i suppose that only fx-9750GII will work (whose
  back &amp; lid is white while the front panel is blue), instead of fx-9750GI (whose
  back &amp; lid is blue while its front panel is white) or just ~G (which seem to
  have a completely different shape) to be working as well. there are two types of
  GII models, and let me just call one of them GII-1, and the other GII-2. the GII-2's
  would supposedly show \"USB Power Graphic <strong>2</strong>\", though mine is a
  GII-2 but just showed \"USB Power Graphic\"."
wordpress_id: 25
wordpress_url: http://blog.easoncxz.com/?p=25
date: '2012-05-26 23:35:28 +1200'
date_gmt: '2012-05-26 11:35:28 +1200'
categories:
- User
tags:
- Casio
- calculator
comments:
- id: 356
  author: 杜
  author_email: soopop@qq.com
  author_url: ''
  date: '2012-12-17 21:58:13 +1300'
  date_gmt: '2012-12-17 09:58:13 +1300'
  content: "我的版本os ver 02.02.0701\r\ndateo 2011.0801.1251\r\ndatea2011.0525.1010\r\n可以变成9860吗？"
- id: 374
  author: easoncxz
  author_email: me@easoncxz.com
  author_url: http://blog.easoncxz.com
  date: '2012-12-21 00:20:30 +1300'
  date_gmt: '2012-12-20 12:20:30 +1300'
  content: 不清楚，似乎可以。我也只是个用户。不过，要是你用fxRemote能够创建当前系统的.fls备份，并且把这个备份刷回去，那么我估计可以。这种情况下，我相信你至少不会弄坏机器。
- id: 376
  author: zhang
  author_email: 1025731048@qq.com
  author_url: ''
  date: '2012-12-21 17:58:22 +1300'
  date_gmt: '2012-12-21 05:58:22 +1300'
  content: "我的版本os ver 02.02.0701\r\ndateo 2011.0801.1251\r\ndatea2011.0525.1010\r\n可以变成9860吗？如果可以刷，请联系我！15310930163"
- id: 377
  author: zhang
  author_email: 1025731048@qq.com
  author_url: ''
  date: '2012-12-21 17:59:54 +1300'
  date_gmt: '2012-12-21 05:59:54 +1300'
  content: 朋友你的计算器：版本os ver 02.02.0701 能刷机了吗？如果可以刷了方法可以传授一下吗？我的电话15310930163
- id: 379
  author: Silence.G.H
  author_email: 550045448@qq.com
  author_url: ''
  date: '2012-12-23 01:33:57 +1300'
  date_gmt: '2012-12-22 13:33:57 +1300'
  content: 经过我的研究，似乎不可以，版本太高了，OS Ver 02.02.0201，版本号不能超过这个
- id: 385
  author: Eason Chen
  author_email: me@easoncxz.com
  author_url: ''
  date: '2012-12-26 01:48:39 +1300'
  date_gmt: '2012-12-25 13:48:39 +1300'
  content: "“版本高于02.02.0201”不是“不能刷”的充分条件。比如，我的设备就是02.02.0701的，而我就刷成了。"
- id: 417
  author: Zyz
  author_email: ljy99041@163.com
  author_url: ''
  date: '2013-01-09 02:44:10 +1300'
  date_gmt: '2013-01-08 14:44:10 +1300'
  content: 我下载不了pfxRecovery2,能发到我的邮箱吗？
- id: 418
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2013-01-09 05:31:36 +1300'
  date_gmt: '2013-01-08 17:31:36 +1300'
  content: 抱歉，最近我的 电脑/云 处于混乱状态，有待整理。我这就发给你。
- id: 423
  author: Jackson
  author_email: 516594122@qq.com
  author_url: ''
  date: '2013-01-11 22:00:40 +1300'
  date_gmt: '2013-01-11 10:00:40 +1300'
  content: "可以把工具包发给我吗？Skydrive上的好像失效了，下载不了诶。我也是02.02.0701 \r\n 非常感谢！"
- id: 424
  author: Jackson
  author_email: 516594122@qq.com
  author_url: ''
  date: '2013-01-12 01:53:22 +1300'
  date_gmt: '2013-01-11 13:53:22 +1300'
  content: Thank you very much! I succeeded following your instruction! My 9750GII
    now has natural display which is so convenient! Thanks a million!
- id: 425
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2013-01-12 01:54:11 +1300'
  date_gmt: '2013-01-11 13:54:11 +1300'
  content: 已发送。
- id: 426
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2013-01-12 01:54:36 +1300'
  date_gmt: '2013-01-11 13:54:36 +1300'
  content: I'm glad that I could be of help!
- id: 437
  author: '2.0: flashing Casio fx-9750GII &raquo; Eason.C&#039;s Blog'
  author_email: ''
  author_url: http://blog.easoncxz.com/?p=538
  date: '2013-01-16 04:39:58 +1300'
  date_gmt: '2013-01-15 16:39:58 +1300'
  content: "[...] thing is, the system (OS, I think, ) of Casio fx-9860GII could be
    installed (&#8220;flashed&#8221;) on fx-9750GII. As a result, the flashed fx-9750GII
    would have [...]"
- id: 497
  author: Jack
  author_email: im-not-tiger@hotmail.com
  author_url: ''
  date: '2013-01-28 11:39:42 +1300'
  date_gmt: '2013-01-27 23:39:42 +1300'
  content: this is almost 100% safe if you make a backup before doing any work, as
    the software has build in low level safety features to prevent it from writing
    or reading certain parts of the flash, specifically the basic bits that allow
    you to restore an OS, so as long as you have a backup, and something very weird
    doesn't happen, your safe. but it is very important to have a valid backup
- id: 523
  author: ausshir
  author_email: ausshir@gmail.com
  author_url: ''
  date: '2013-01-31 18:15:30 +1300'
  date_gmt: '2013-01-31 06:15:30 +1300'
  content: "I can't seem to find the files I need to flash my 2.02 9750gII anywhere.
    \ Any help?\r\n\r\nYou can email me if you wish! :)\r\n\r\nThanks"
- id: 566
  author: Varma
  author_email: access.vbox@gmail.com
  author_url: ''
  date: '2013-02-08 13:08:32 +1300'
  date_gmt: '2013-02-08 01:08:32 +1300'
  content: Can I have the files to flash a fx-9750gii with os version 2.02?
- id: 568
  author: Ian
  author_email: ian.smith98@btinternet.com
  author_url: ''
  date: '2013-02-09 09:07:55 +1300'
  date_gmt: '2013-02-08 21:07:55 +1300'
  content: I'm looking for 2_02_0201_sh4.fls.... any pointers would be appreciated...
    Thanks
- id: 571
  author: apollo
  author_email: tim.struppi1@gmx.de
  author_url: ''
  date: '2013-02-12 11:11:22 +1300'
  date_gmt: '2013-02-11 23:11:22 +1300'
  content: "When i try to flash a new OS it always say image mismatch.\r\nI need the
    2_02_0201_sh4.fls, too.\r\nMy actually Version is 02.02.0701."
- id: 690
  author: jacob
  author_email: parallaxparadox@gmail.com
  author_url: ''
  date: '2013-03-20 07:30:47 +1300'
  date_gmt: '2013-03-19 19:30:47 +1300'
  content: "Thanks for the help, but could you send me the flash file, I can't find
    it anywhere!\r\nThanks again!"
- id: 785
  author: Jessiixo
  author_email: jessicaho917@hotmail.co.uk
  author_url: ''
  date: '2013-04-09 07:08:53 +1200'
  date_gmt: '2013-04-08 19:08:53 +1200'
  content: "please can you send me the tools please . I am using 02.02.0701 also.\r\nBy
    RESET you mean the reset button on the back?"
- id: 803
  author: Cait Rob
  author_email: smite@hotmail.co.nz
  author_url: ''
  date: '2013-04-13 10:53:34 +1200'
  date_gmt: '2013-04-12 22:53:34 +1200'
  content: hey can you send me the link to the flash files i cannot find it anywhere
    it would be great if you could send me them through email.
- id: 991
  author: Xia
  author_email: typical-g-01@hotmail.co.uk
  author_url: ''
  date: '2013-05-16 18:02:26 +1200'
  date_gmt: '2013-05-16 06:02:26 +1200'
  content: Hi this looks awesome and i have been wanted to have these facilities on
    my calculator can you please email me the file to download the pfxremote that
    does all the (backing up and restoring the OS) I would really appreciate at least
    some advice on where to get it
- id: 998
  author: Victor
  author_email: victor.davidsson@gmail.com
  author_url: ''
  date: '2013-05-17 09:20:40 +1200'
  date_gmt: '2013-05-16 21:20:40 +1200'
  content: Hi! Would you be so kind and send me a mail with the required files? I
    have a 02.02 fx-9750GII and I therefore need the fxRemote and the appropriate
    image. Thanks in advance!
- id: 1038
  author: johndj73
  author_email: johandj73@gmail.com
  author_url: ''
  date: '2013-05-24 09:07:09 +1200'
  date_gmt: '2013-05-23 21:07:09 +1200'
  content: "Hi\r\n\r\nI have os 02.02.0701. I got to the point of backing up my current
    os but I need the os file that I need to fash this with to upgrade to the 9860.
    Where will I find that? Searched the net but no luck.\r\n\r\nThanks so much for
    a great tutorial"
- id: 1039
  author: Xia
  author_email: typical-g-01@hotmail.co.uk
  author_url: ''
  date: '2013-05-24 09:49:43 +1200'
  date_gmt: '2013-05-23 21:49:43 +1200'
  content: have you found the files yet, I would appreciate if you pointed me in the
    right direction
- id: 1041
  author: johndj73
  author_email: johandj73@gmail.com
  author_url: ''
  date: '2013-05-24 11:22:09 +1200'
  date_gmt: '2013-05-23 23:22:09 +1200'
  content: "Yea\r\n\r\nJust flashed but I am still not sure what the differences are
    after the upgrade.\r\n\r\nhttps://dl.dropboxusercontent.com/u/27920157/fx_mod.zip
    \r\n\r\nJust go through the readme file again. It has fxremote app as well as
    the updated os's and the backups of the originals. No FA124 but thats not difficult
    to find."
- id: 1049
  author: johndj73
  author_email: johandj73@gmail.com
  author_url: ''
  date: '2013-05-26 05:19:45 +1200'
  date_gmt: '2013-05-25 17:19:45 +1200'
  content: "Checked out my 9750GII after the update and it's awesome! Thanks for the
    tutorial!\r\nThe Natural display makes a huge difference."
- id: 1051
  author: johndj73
  author_email: johandj73@gmail.com
  author_url: ''
  date: '2013-05-26 06:12:37 +1200'
  date_gmt: '2013-05-25 18:12:37 +1200'
  content: "Hi \r\nI flashed my 9750 without any problems. Now I am trying to flash
    a friends but he has the older GII-1. Using pfxrecover that I downloaded here
    I get an error \"wrong answer on: 000\". Any ideas guys?\r\n\r\nThe calc is detected
    by the os and FA124."
- id: 1786
  author: ToJa92
  author_email: toja92@gmail.com
  author_url: ''
  date: '2013-08-14 02:50:20 +1200'
  date_gmt: '2013-08-13 14:50:20 +1200'
  content: I had the same error, and after waiting a couple of minutes it turned itself
    off. When I turned it on it still worked as usual. To back up, instead open 'Link'[C],
    and press 'Receive'[F2]. You should then be able to backup the flash. As the flash
    memory is quite big and the transfer speed slow, it'll take some time for it to
    backup.
- id: 1787
  author: ToJa92
  author_email: toja92@gmail.com
  author_url: ''
  date: '2013-08-14 03:04:15 +1200'
  date_gmt: '2013-08-13 15:04:15 +1200'
  content: "Also, after restoring the upgraded rom, you'll be asked if you want to
    continue[F1] or initialize[F6]. Choose initialize, and it'll clear everything
    and then start up the upgraded OS. If you press continue, I think you'll be stuck
    at the flashing screen.\r\n\r\nMy fx-9750GII is now running the upgraded OS: http://i.imgur.com/DRB6mKu.jpg"
- id: 2479
  author: ztc
  author_email: einheriar.zz@hotmail.com
  author_url: ''
  date: '2013-09-25 02:32:56 +1200'
  date_gmt: '2013-09-24 14:32:56 +1200'
  content: 你好，我实在是找不到2_02_0201_sh4.fls哪里有下。。麻烦发给我好么 谢谢
- id: 2728
  author: Emilio
  author_email: ebm31416@yahoo.es
  author_url: ''
  date: '2013-10-09 20:06:10 +1300'
  date_gmt: '2013-10-09 08:06:10 +1300'
  content: "I've been to in point 4.\r\n\r\nThe reset button is located on the back
    of the calculator.\r\n\r\npressed + RESET + 4 + F2 + AC\r\n\r\ni relase -RESET\r\n
    \ \r\nthen release simultaneously (F2 + 4 + AC)\r\nI press X\r\nI release X\r\nI
    press 9\r\nI release 9\r\n\r\nWhat am I doing wrong???\r\n\r\nI Have FX9750 GII
    ( front blue and white rear) OS 02.00.0700  \r\n\r\nOne question: Language is
    lost? Currently I have installed Spanish\r\n\r\nThank's"
- id: 2754
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2013-10-10 11:03:28 +1300'
  date_gmt: '2013-10-09 23:03:28 +1300'
  content: I had uploaded it; it's all in the cloud now.
- id: 2755
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2013-10-10 11:03:53 +1300'
  date_gmt: '2013-10-09 23:03:53 +1300'
  content: I had uploaded it; it's all in the cloud now.
- id: 2756
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2013-10-10 11:04:07 +1300'
  date_gmt: '2013-10-09 23:04:07 +1300'
  content: I had uploaded it; it's all in the cloud now.
- id: 2757
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2013-10-10 11:04:16 +1300'
  date_gmt: '2013-10-09 23:04:16 +1300'
  content: I had uploaded it; it's all in the cloud now.
- id: 2758
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2013-10-10 11:04:36 +1300'
  date_gmt: '2013-10-09 23:04:36 +1300'
  content: "I had uploaded it; it's all in the cloud now.\r\n\r\nYep, RESET on the
    back."
- id: 2759
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2013-10-10 11:04:52 +1300'
  date_gmt: '2013-10-09 23:04:52 +1300'
  content: I had uploaded it; it's all in the cloud now.
- id: 2760
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2013-10-10 11:06:45 +1300'
  date_gmt: '2013-10-09 23:06:45 +1300'
  content: "I had uploaded it; it's all in the cloud now.\r\n\r\nYeah it seems quite
    hard to find, those system images."
- id: 2761
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2013-10-10 11:06:54 +1300'
  date_gmt: '2013-10-09 23:06:54 +1300'
  content: I had uploaded it; it's all in the cloud now.
- id: 4782
  author: John
  author_email: saltyjohn1@hotmail.co.uk
  author_url: ''
  date: '2013-12-01 06:12:20 +1300'
  date_gmt: '2013-11-30 18:12:20 +1300'
  content: Emilo, are you pressing the multiply button or the X button? It is the
    multiply button you press
- id: 4783
  author: John
  author_email: saltyjohn1@hotmail.co.uk
  author_url: ''
  date: '2013-12-01 06:14:17 +1300'
  date_gmt: '2013-11-30 18:14:17 +1300'
  content: "Dear anybody. Please Please Please help me. I have installed sh3 instead
    of sh4 on my casio fx9750gii and now there is a blank screen from which I can
    access nothing; but even using the computer.\r\n\r\nWhat can I do? If it is beyond
    repair, does it have any use to anyone?\r\n\r\nThanks for your time"
- id: 4784
  author: John
  author_email: saltyjohn1@hotmail.co.uk
  author_url: ''
  date: '2013-12-01 06:16:25 +1300'
  date_gmt: '2013-11-30 18:16:25 +1300'
  content: "Hey: I accidently installed the Sh3 instead of the Sh4 and now it won't
    even turn on. is there any hope for it? \r\n\r\nCheers, \r\n\r\nJohn"
- id: 12373
  author: videolante
  author_email: videolante@yahoo.com
  author_url: ''
  date: '2014-01-09 00:30:50 +1300'
  date_gmt: '2014-01-08 12:30:50 +1300'
  content: can i update my Casio Graph 35+ to Casio FX-9860GII?
- id: 13302
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2014-01-12 19:10:07 +1300'
  date_gmt: '2014-01-12 07:10:07 +1300'
  content: Try entering the "bios" screen of your calculator, as per step 4.
- id: 13304
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2014-01-12 19:13:40 +1300'
  date_gmt: '2014-01-12 07:13:40 +1300'
  content: I guess only the fx-9750GII works - not even the ~GI nor ~G. The key point,
    I believe, is that the chip has to be the same in order for this crack to work.
- id: 13358
  author: Rerk
  author_email: amt_l64adkn@hotmail.com
  author_url: ''
  date: '2014-01-13 01:02:35 +1300'
  date_gmt: '2014-01-12 13:02:35 +1300'
  content: "I absolutely did as your procedure. But, it doesn't work. When I click
    recover after that it stop working and\r\nIt said \"Zugriltsverletzung bei Adresse
    004738EO in Module 'fxRemote' schreiben von Adress 0000010\" \r\nI don't understand
    it.\r\n\r\nI used \"fx-9750GII\" vers. 2.02.071,  and selected 2_02_0201_sh4.fls
    as flashing.\r\n\r\nAnyone help me? I really need Natural Display."
- id: 17609
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2014-02-01 16:17:51 +1300'
  date_gmt: '2014-02-01 04:17:51 +1300'
  content: I don't know what you did wrong (assuming you did somethign wrong), but
    definitely try to use the "backup" button before using the "restore" one.
- id: 22005
  author: Bruno
  author_email: brleoal@gmail.com
  author_url: ''
  date: '2014-03-14 13:10:20 +1300'
  date_gmt: '2014-03-14 01:10:20 +1300'
  content: "Hi, I NEED this image file (.fls) for my calculator fx-9750GII.\r\nAny
    help o coment to my email:\r\nbrleoal@gmail.com\r\n\r\nOS Ver 02.02.0701\r\nDate
    O 2011.0801.1251\r\nDate A 2011.0525.1010"
- id: 23559
  author: meee
  author_email: lukemccurdy@hotmail.co.uk
  author_url: ''
  date: '2014-03-22 08:49:46 +1300'
  date_gmt: '2014-03-21 20:49:46 +1300'
  content: Worked perfectly thank you :)
- id: 24141
  author: Panda1996
  author_email: panda1996@gmx.de
  author_url: ''
  date: '2014-03-24 23:55:20 +1300'
  date_gmt: '2014-03-24 11:55:20 +1300'
  content: "HI! \r\nWorked perfectly, thanks :)\r\nBut what if i ant to downgrade
    and forgot to make an backup?\r\nCan anyome give me an backupfile?\r\nTHX :)"
- id: 25164
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2014-03-28 13:02:21 +1300'
  date_gmt: '2014-03-28 01:02:21 +1300'
  content: It's already provided in the post.
- id: 26867
  author: bruno
  author_email: brleoal@gmail.com
  author_url: ''
  date: '2014-04-03 10:37:32 +1300'
  date_gmt: '2014-04-02 22:37:32 +1300'
  content: please, where is it. In the link box.com I downloaded the fx-9750 tools.zip,
    but it doesn't appears (only 2_02 &amp; 2_01)
- id: 27202
  author: Eason Chen
  author_email: easoncxz@gmail.com
  author_url: ''
  date: '2014-04-04 17:06:35 +1300'
  date_gmt: '2014-04-04 05:06:35 +1300'
  content: It seems like you've already got what you need.
- id: 43131
  author: Mike
  author_email: mike.savill@dongwha.co.nz
  author_url: ''
  date: '2014-04-28 20:56:44 +1200'
  date_gmt: '2014-04-28 08:56:44 +1200'
  content: "Brilliant, instructions were easy to follow and very comprehensive.  I
    wouldn't say it's for the novice though.  Took a couple of goes to get some items
    (USB connection) working correctly.\r\n\r\nThank you very much"
- id: 52134
  author: Ricardo
  author_email: ricardoalfon2@hotmail.com
  author_url: ''
  date: '2014-05-10 19:47:40 +1200'
  date_gmt: '2014-05-10 07:47:40 +1200'
  content: Don`t work, I did all paces and the calculator is equal, I did the procress
    for 4 times, and never changed, what can I do???
- id: 55913
  author: Antonio
  author_email: anton.bluer50@gmail.com
  author_url: ''
  date: '2014-05-16 09:13:17 +1200'
  date_gmt: '2014-05-15 21:13:17 +1200'
  content: "Hola, no consigo flashear mi fx9750 sII versión 02.02.0701.\r\nSigo los
    pasos de abrir la fxremote y darle al Recover, busco el archivo 2_02_0201_sh4.fls
    que tengo y me deja la pantalla de la calculadora en OS NOT IDENTIFICABLE..."
- id: 67986
  author: Kevin
  author_email: kevinsolorzano@hotmail.com
  author_url: ''
  date: '2014-06-17 01:41:49 +1200'
  date_gmt: '2014-06-16 13:41:49 +1200'
  content: Buenos días amigo, primero quiero agradecer por la ayuda que nos ha brindado
    con su tutorial, me gustaría saber si usted puede ayudarme con un problema, compre
    una calculadora fx-9750gii, la que es blanca con el frente azul, segui todos los
    pasos del tutorial, pero cada vez que trato de restaurar el sistema operativo
    me da un error que dice," checksum of the selected image NOT OK! recovery is not
    posible!" la versión de mi calculadora es OS 02.02.0701 Date0 2011.0801.1251,
    DateA 2011.0525.1010. aprovecho la oportunidad para decirle que he probado con
    windows 8, windows 7, y windows xp para ver si ese era el error, pero nada, también
    he probado con otro cable usb para ver si era falla de comunicación y tampoco,
    intente hacer backup con el pfxrecover y si hace el backup pero luego ese mismo
    no lo puedo restaurar porque sale el mismo error, podría usted ayudarme por favor,
    se lo agradezco de antemano.
---
<p>UPDATE 20130111: due to some of my personal data management issues, the skydrive link is indefinitly unavailable. i'll try and fix it soon (as in a month or so...). for the time being, just ask me for the stuff.</p>
<p>UPDATE 20130116: I wrote a more succinct version of the story <a title="2.0: flashing Casio fx-9750GII" href="http://blog.easoncxz.com/?p=538" target="_blank">somewhere</a>.</p>
<p>UPDATE 20130525: I finally bothered to upload the files to box.com.</p>
<p><span style="color: #999999;">context:</span></p>
<p><span style="color: #999999;">i bought an <code>fx-9750GII</code> according to school recommendations. i previously had been using th <code>fx-82es</code>, and expected naturla display on any higher class casio calculators. however, casio upset me, because i did  not find any way to show natural display. i did some searches, and found out that it could gain natural display by flashing in an image of the <code>fx-9860GII</code>. so i started learning about it.</span></p>
<p>the aim is to give fx-9750GII more functions, mainly being natural display.</p>
<p><span style="color: #000000;">the idea is to flash in an <code>fx-9860</code> image. </span></p>
<p><span style="color: #000000;">in my process, i am using windows 7 (ultimate x64).</span></p>
<h3><span style="color: #ff0000;">disclaimer:</span></h3>
<p><span style="color: #ff0000;">this procedure includes flashing a system image into a digital device's ROM. flashing the inappropriate ROM image COULD POTENTIALLY KILL YOUR DEVICE!! with great benefit comes great risk, so do this at your own choice and responsibility. I AM NOT RESPONSIBLE for your consequences. understand the whole process before starting.</span></p>
<h3><span style="color: #000000;">here is the procedure:</span></h3>
<ol>
<li>
<h4><span style="color: #000000;">install the usb driver.</span></h4>
<div><span style="color: #000000;">this step is easy.</span></div>
<div><span style="color: #000000;">assuming you are using windows, just install the <code>FA-124 </code>from the CD that came out of the box, or find it on the casio official websites. make sure the driver is working well, by pressing <code>WinKey+R</code> then typing in <code>devmgmt.msc</code> , then seeing if there are any <em>yellow exclaimation marks </em>. if there are, then the calculator is plugged in, but the driver is not working properly. if there are not, either the calculator is not plugged in, or (, which is good, ) the calculator is plugged in and the driver is working properly.</span></div>
</li>
<li>
<h4>check your calculator version</h4>
<div>this step is partially tricky, but the non-tricky part is necessary.</div>
<div>i suppose that only fx-9750GII will work (whose back &amp; lid is white while the front panel is blue), instead of fx-9750GI (whose back &amp; lid is blue while its front panel is white) or just ~G (which seem to have a completely different shape) to be working as well. there are two types of GII models, and let me just call one of them GII-1, and the other GII-2. the GII-2's would supposedly show "USB Power Graphic <strong>2</strong>", though mine is a GII-2 but just showed "USB Power Graphic".<a id="more"></a><a id="more-25"></a></div>
<div>first look in your system menu of the calculator (by pressing the MENU button), and see the "version". versions 2.00.* and 2.01.* means a GII-1, and version 2.02.* means a GII-2.</div>
<div>then, for the sake of finding help elsewhere, turn the calculator off and press and hold the key combination<code>[OPTN+EXP+AC]</code> to show a factory menu. press F1, then choose "delete all data" (in fact i don't find anything deleted), then find "version". expect something like</div>
<div><code>OS Ver 02.02.0201<br />
DateO 2011.0801.1932<br />
DateA 2011.0525.1010</code></div>
<div>these numbers can help you identify help on other places e.g. forums.</div>
</li>
<li>
<h4>download the tool</h4>
<div>this step is easy.</div>
<div>though i have put them in the same zip, slightly different tools are needed for GII-1 and GII-2. the tool for GII-1 is called "pfxRecovery"; the tool for GII-2 is called "fxRemote". both tools are contributions by cfxm and Simon Lothar at <a title="casiocalc.org" href="http://casiocalc.org" target="_blank">casiocalc.org</a>. download the tools from my <del><a title="skydrive" href="https://skydrive.live.com/#cid=A01EC64167A3698D&amp;id=A01EC64167A3698D%21108" target="_blank">skydrive</a></del> <a href="https://www.box.com/s/coiy605de4eiuc7otid8" target="_blank">box.com</a> .</div>
</li>
<li>
<h4>enter "BIOS" of the calculator</h4>
<div>this step is both tricky and necessary.</div>
<div>in order to let the tool acccess the flash memory of the calculator which stores the system, sort of a BIOS screen is to be entered. check that the RESET button is functioning before proceeding. turn off the calculator, and press the following key sequence. "+" means press and hold, "-" means release, "()" means at the same time, "     " means wait for half a second or so:</div>
<div>+RESET+F2+4+AC-RESET-(F2+4+AC)+×   -×+9   -9</div>
<div>now the screen should have a contrast error, and show the words "OS error. Please update OS.". this is the "BIOS" screen. with this screen showing, and with the calculator being connected to a computer with the usb driver properly installed, and with the tool run as administrator, the tool can read or write the calculator's flash storage in which the system lies.</div>
</li>
<li>
<h4>flash images</h4>
<div>this step is important, and decides whether your calculator lives or dies. there may be sorts of error prompts.</div>
<div>enter "BIOS" screen for the calculator; connect the calculator to a PC with the usb driver; better kill the FA_124 process (or close FA-124); run the tool.</div>
<div>"backup" means saving the current system as a file on your computer, for restoration later. "restore" means to flash a system image into the flash storage of the calculator. i suggest to first backup your current system, then flash your own system image back. if everything goes fine, and your calculator (hopefully - ) did not die, carry on and flash an appropriate fx-9860 system image. choose the .fls file, whose name corresponds with your calculator's version. for example, my calculator has the version 02.02.0701, which starts with 02.02, i simply choose the tool "fxRemote", and eventually flash the "2_02_0201_sh4.fls"</div>
</li>
<li>
<h4>have fun!</h4>
<div>hopefully, your calculator lived, and lives better than before!</div>
</li>
<li>
<h4>notes</h4>
<div>
<p>credit should be redirected to cfxm and Simon Lothar.</p>
</div>
<div>related resoures:</div>
<div><a title="Fx-9750GII to fx-9860GII tutorial" href="http://prizmwiki.omnimaga.org/wiki/Fx-9750GII_to_fx-9860GII_tutorial" target="_blank">Fx-9750GII to fx-9860GII tutorial</a></div>
<div><a href="http://www.omnimaga.org/index.php?topic=6187.msg110364#msg110364">Turn your Casio FX-9750GII into a FX-9860GII</a></div>
<div>a place to continue learning:</div>
<div><a title="Show the link to this post" href="http://www.casiocalc.org/index.php?showtopic=6661&amp;view=findpost&amp;p=53798">Upgrade Fx-9750gii to 9760gii, upgrading</a></div>
<div>a highly relevant video:</div>
<div><a href="http://www.youtube.com/watch?v=ZupCFtsI0Qw">Casio fx-9750gii to fx-9860gii OS upgrade</a></div>
</li>
</ol>
