---
title: '2.0: flashing Casio fx-9750GII'
excerpt: "<h5>Disclaimer</h5>\r\nOperate your own devices at your own knowledge, responsibility
  and risk.\r\n<h5>Brief</h5>\r\nThe thing is, the system (OS, I think, ) of Casio
  fx-9860GII <a title=\"flashing the fx-9750GII\" href=\"http://blog.easoncxz.com/?p=25\"
  target=\"_blank\">could be</a> installed (\"flashed\") on fx-9750GII. As a result,
  the flashed fx-9750GII would have some new functions, among which I consider \"natural
  display\" to be of the greatest significance. This article tries to describe the
  process as succinctly as possible."
wordpress_id: 538
wordpress_url: http://blog.easoncxz.com/?p=538
date: '2013-01-16 04:39:54 +1300'
date_gmt: '2013-01-15 16:39:54 +1300'
categories:
- User
tags:
- 刷机
- Casio
comments:
- id: 438
  author: flashing the fx-9750GII &raquo; Eason.C&#039;s Blog
  author_email: ''
  author_url: http://blog.easoncxz.com/?p=25
  date: '2013-01-16 04:41:36 +1300'
  date_gmt: '2013-01-15 16:41:36 +1300'
  content: "[...] UPDATE 20130116: I wrote a more succinct version of the story somewhere.
    [...]"
- id: 495
  author: Jack
  author_email: im-not-tiger@hotmail.com
  author_url: ''
  date: '2013-01-28 06:48:12 +1300'
  date_gmt: '2013-01-27 18:48:12 +1300'
  content: I am really trying to do this but i cant seam to find fx-9860GII flashes
    anywhere, help would be greatly apreciated
- id: 786
  author: Jessiixo
  author_email: jessicaho917@hotmail.co.uk
  author_url: ''
  date: '2013-04-09 07:33:26 +1200'
  date_gmt: '2013-04-08 19:33:26 +1200'
  content: I've tried pressing the commands.. but it goes back to the normal screen
    with no mention of OS error
- id: 2347
  author: diego
  author_email: hazeexpress2@gmail.com
  author_url: ''
  date: '2013-09-17 10:59:50 +1200'
  date_gmt: '2013-09-16 22:59:50 +1200'
  content: this works with  fx 9750gii version 02.02.0701
- id: 2348
  author: diego
  author_email: hazeexpress2@gmail.com
  author_url: ''
  date: '2013-09-17 11:00:50 +1200'
  date_gmt: '2013-09-16 23:00:50 +1200'
  content: does this works with fx 9750gii version 02.02.070????******
- id: 9237
  author: mark
  author_email: markportus@hotmail.co.uk
  author_url: ''
  date: '2013-12-22 04:03:51 +1300'
  date_gmt: '2013-12-21 16:03:51 +1300'
  content: I installed both FA-124 and fx remote, however fx remote will not backup
    my casio fx-9750GII and reads Error 04:(Overwrite impossible...) every time I
    try . Could you suggest a reason and a solution to this?
- id: 64440
  author: faye
  author_email: fayesiow@hotmail.co.uk
  author_url: ''
  date: '2014-06-01 00:29:08 +1200'
  date_gmt: '2014-05-31 12:29:08 +1200'
  content: is there a video to the instructions? ive downloaded the FA-124 from casio
    website but when i plug my calculator onto the computer it cant be installed?
    why is that?? help!
---
<h5>Disclaimer</h5>
<p>Operate your own devices at your own knowledge, responsibility and risk.</p>
<h5>Brief</h5>
<p>The thing is, the system (OS, I think, ) of Casio fx-9860GII <a title="flashing the fx-9750GII" href="http://blog.easoncxz.com/?p=25" target="_blank">could be</a> installed ("flashed") on fx-9750GII. As a result, the flashed fx-9750GII would have some new functions, among which I consider "natural display" to be of the greatest significance. This article tries to describe the process as succinctly as possible.<a id="more"></a><a id="more-538"></a></p>
<h5>Tools needed</h5>
<ul>
<li><span style="font-size: 0.83em;">A Windows PC, and</span></li>
<li><span style="font-size: 0.83em;"><code>FA-124</code> from Casio installed, in order for your PC to have the drivers needed, and</span></li>
<li><span style="font-size: 0.83em;">The flashing tool "pfxRecovery" or "fxRemote", depending on the <code>version</code> of your fx-9750GII, and</span></li>
<li><span style="font-size: 11px;">Well, a MicroUSB cable.</span></li>
</ul>
<h5>Identifying the version of your fx-9750GII</h5>
<p>Find your version number under <code>MENU-&gt;system-&gt;version</code>.</p>
<p>Those starting with <code>02.00</code> or <code>02.01</code> should use the older tools and images, which is <code>pfxRecovery</code> and <code>.fls</code> files with filenames starting with corresponding numbers;<br />
Those starting with <code>02.02</code> should use the new tools and image, which comes with <code>fxRemote</code>.</p>
<h5>Operation steps</h5>
<p>Check that the driver from <code>FA-124</code> is correctly installed, e.g. by fiddling with <code>FA-124</code>.</p>
<p>Make sure that your calculator's batteries aren't run out - at least not <em>too poorly</em> run out.</p>
<p>Turn off your calculator, and have the cable unplugged. Use this key combination on the calculator:</p>
<blockquote><p>"+" means press and hold, "-" means release, brackets means at the same time, space means wait for half a second or so:</p>
<div><code>+RESET+F2+4+AC-RESET-(F2+4+AC)+×   -×+9   -9</code></div>
</blockquote>
<p>Now the screen should have a contrast error, and show the words “OS error. \Please update OS.” Now plug the cable and open pfxRecovery/fxRemote.</p>
<p>Try to backup your calculator - this ensures that the tool is working, and also to get an image of your stock system. Try restoring your stock image - this ensures that the restore function is working. At last, restore an fx-9860GII image that comes with the tool and has a filename that corresponds with your version.</p>
<p>Any time later, you can restore the image that you initially created (and which you must have kept in a safe place just in case) to reach the state before you started flashing your fx-9750GII.</p>
