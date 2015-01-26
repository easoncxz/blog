---
title: Installing and Using pip
excerpt: "Figuring out how to <a title=\"stackoverflow.com\" href=\"http://stackoverflow.com/questions/4324558/whats-the-proper-way-to-install-pip-virtualenv-and-distribute-for-python/21456786\"
  target=\"_blank\">properly</a> install and use pip took me a heck of a lot longer
  than it should. This post makes a note of the hassle.\r\n<h2>What could/should have
  been done:</h2>\r\n<pre>sudo pacman -S python-pip\r\nsudo pip install virtualenv</pre>\r\nIt's
  really that simple - these steps can give me a \"vitualenv\" command."
wordpress_id: 979
wordpress_url: http://blog.easoncxz.com/?p=979
date: '2014-02-03 15:25:32 +1300'
date_gmt: '2014-02-03 03:25:32 +1300'
categories:
- dev
tags:
- Python
- Linux
- pip
- archlinux
comments: []
---
<p>Figuring out how to <a title="stackoverflow.com" href="http://stackoverflow.com/questions/4324558/whats-the-proper-way-to-install-pip-virtualenv-and-distribute-for-python/21456786" target="_blank">properly</a> install and use pip took me a heck of a lot longer than it should. This post makes a note of the hassle.</p>
<h2>What could/should have been done:</h2>
<pre>sudo pacman -S python-pip
sudo pip install virtualenv</pre>
<p>It's really that simple - these steps can give me a "vitualenv" command.<a id="more"></a><a id="more-979"></a>What I was concerned about - which led me <em>away</em> from doing the above, is the effect of using <span style="font-family: Monaco, Consolas, 'Andale Mono', 'DejaVu Sans Mono', monospace; font-size: small;"><span style="line-height: normal;"><code>sudo</code>. Because of the way <code><a href="http://jekyllrb.com/" target="_blank">gem install jekyll</a></code> simply works, I was thinking that using <code>sudo</code> might do unpleasant things with my global python environment.</span></span></p>
<p>I think using <code>sudo pip install something</code> <em>indeed does</em> install packages into the global environment - but indeed that's what I was <em>meant to do</em> in the first place.</p>
<h3>Background</h3>
<p>I was following this <a title="heroku.com" href="https://devcenter.heroku.com/articles/getting-started-with-django" target="_blank">Getting Started with Django on Heroku</a> tutorial. I failed at <a title="python-guide.org" href="http://docs.python-guide.org/en/latest/starting/install/linux/" target="_blank">installing</a> virtualenv: <code>pip install virtualenv</code> returned python stacktraces saying that permission is denied for <code>/usr/lib/python3.3/site-packages/</code>.</p>
<p>I somehow thought that this error showing up is a sign of my global environment not properly set up (instead of missing the <code>sudo</code> in front of the <code>pip</code>).</p>
