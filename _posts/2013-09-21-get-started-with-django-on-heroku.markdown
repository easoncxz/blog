---
title: Get started with Django on Heroku
wordpress_id: 857
wordpress_url: http://blog.easoncxz.com/?p=857
date: '2013-09-21 19:11:58 +1200'
date_gmt: '2013-09-21 07:11:58 +1200'
categories:
- dev
tags:
- Python
- Django
- Heroku
comments: []
---
<p>This post is based on some experience of mine.</p>
<p>Well, in fact there is <a title="heroku.com" href="https://devcenter.heroku.com/articles/getting-started-with-django" target="_blank">a tutorial</a> kinda thing on the Heroku documentation site already. Follow that guide, and by and large you'll be good to go. Unfortunate for me, I got stuck somewhere in the middle of that guide.</p>
<p>&nbsp;</p>
<p>The general process:</p>
<ul>
<li>Install python. This is obviously needed. Understand which version of python you are installing.</li>
<li>Install pip &amp; virtualenv. On the page to the "tutorial", there is a link to <a title="python-guide.org" href="http://docs.python-guide.org/en/latest/starting/install/win/" target="_blank">another page</a> which tells you how to do it.</li>
<li>Signup on Heroku and install the "Heroku toolbelt".</li>
<li>Follow the "tutorial".</li>
</ul>
<p>&nbsp;</p>
<p>Handy prior knowledge:</p>
<ul>
<li>python. Well, Django uses python...</li>
<li>Django. Trying to use Django locally would help with understanding which part of the process in the "tutorial" belongs to Django, which part belongs to Heroku, and which part belongs to neither.</li>
</ul>
<p>&nbsp;</p>
<p>Problems:</p>
<p style="padding-left: 30px;">Well, the main/only yet major problem I came across has got to do with python and/or pip versions.</p>
<p style="padding-left: 30px;">At first my pip was, say, python3-based (i.e. it is viz. pip3), and I didn't know it. The packages I was intending to install, which were specified in the "tutorial", are not compatible with python3. I got syntax errors when doing <code>pip install</code>.</p>
<p style="padding-left: 30px;">I solved the problem simply by installing pip2. I did that by using my linux distro's package manager.</p>
