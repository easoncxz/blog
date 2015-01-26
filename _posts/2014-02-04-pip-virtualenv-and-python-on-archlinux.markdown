---
title: "[obsolete] pip, virtualenv, and Python on Archlinux"
excerpt: |-
  <del>This article is to make a note of confusing phenomena when dealing with Python, virtualenv, pip, and Archlinux.</del>

  <h2><del>Background</del></h2>

  <del>The background isn't important here (- though what <strong>is</strong> important, is to <em>always read the date</em> of writing of an article that talks about Python!). What I was trying to figure out, was really what happens if one attempts to require specific versions of python, or pip, within a specific virtualenv environment. And I set off to trial and error.</del>

  <del>
wordpress_id: 984
wordpress_url: http://blog.easoncxz.com/?p=984
date: '2014-02-04 14:53:09 +1300'
date_gmt: '2014-02-04 02:53:09 +1300'
categories:
- dev
tags:
- Python
- Linux
- pip
- archlinux
comments: []
---
<p><del>This article is to make a note of confusing phenomena when dealing with Python, virtualenv, pip, and Archlinux.</del></p>
<h2><del>Background</del></h2>
<p><del>The background isn't important here (- though what <strong>is</strong> important, is to <em>always read the date</em> of writing of an article that talks about Python!). What I was trying to figure out, was really what happens if one attempts to require specific versions of python, or pip, within a specific virtualenv environment. And I set off to trial and error.</del></p>
<p><del><a id="more"></a><a id="more-984"></a></del></p>
<h2><del>Naive first tries</del></h2>
<p><del>First, I need to at least get <em>one</em> verison of everything going.</del></p>
<pre><del><code>sudo pacman -S python python-pip
sudo pip install virtualenv
cd some/path/somewhere
virtualenv venv
</code></del></pre>
<p><del>Now, seems like virtualenv would be working fine. And it is. In this state, the versions of the stuff would be:</del></p>
<ul>
<li><del>python: 3</del></li>
<li><del>pip: 3</del></li>
<li><del>virtualenv: <code>python</code> inside the virtual environment gives python3.</del></li>
</ul>
<h2><del>Different pip's install "different" virtualenv's</del></h2>
<p><del>What happens if I have multiple versions of different things?</del></p>
<pre><del><code>sudo pacman -S python2 python2-pip
</code></del></pre>
<p><del>Now things starts to get weird. We now have:</del></p>
<ul>
<li><del>python,</del></li>
<li><del>python2,</del></li>
<li><del>pip,</del></li>
<li><del>pip2,</del></li>
</ul>
<p><del>but no virtualenv yet. What would be the difference between using</del></p>
<pre><del><code>sudo pip install virtualenv
</code></del></pre>
<p><del>and using</del></p>
<pre><del><code>sudo pip2 install virtualenv
</code></del></pre>
<p><del>? Well, I gave both a few tries. As it turns out:</del></p>
<ul>
<li><del>If I use <code>pip install</code>, then some stuff gets installed into <code>/usr/lib/python3.3/site-packages</code>;</del></li>
<li><del>If I use <code>pip2 install</code>, then some stuff gets installed into <code>/usr/lib/python2.7/site-packages</code>.</del></li>
</ul>
<p><del>In both cases, I always get a <code>virtualenv</code> command (which is always /usr/bin/virtualenv).</del></p>
<ul>
<li><del>If I use <code>pip2 install</code>, if I use <code>virtualenv venv</code> then activate, then <code>which python</code> gives me <code>venv/bin/python</code>, which is a python2.</del></li>
<li><del>If I use <code>pip install</code>, I get python3 in the venv instead.</del></li>
</ul>
<p style="padding-left: 30px;"><del><strong>update:</strong> <code>pip2 install</code> gives all of python, python2, python3, pip, pip2, pip3 in the virtual environment, while <code>pip install</code> only gives python, python3, pip, pip3.</del></p>
<pre><del>$ sudo pip2 install virtualenv
$ virtualenv venv/
New python executable in venv/bin/python2
Not overwriting existing python script venv/bin/python (you must use venv/bin/python2)
Installing setuptools, pip...done.

...
$ sudo pip2 uninstall virtualenv
...

$ sudo pip install virtualenv
$ virtualenv venv
Using base prefix '/usr'
New python executable in venv/bin/python
Installing setuptools, pip...done.</del></pre>
<p><del>I learned from <a href="http://stackoverflow.com/q/1534210/1349048">Stackoverflow</a> that on creation of the virtual environment, one of the versions of python installed on the computer can be specified to be used in this virtual environment. Because it's confusing enough, I didn't care much about it. I tried it, and it worked; that's all I cared about it at this point.</del></p>
<p><del>I've noticed that the output of <code>virtualenv</code> installed by different pip's are different. If installed with pip2, the output will contain</del></p>
<pre><del><code>  -p PYTHON_EXE, --python=PYTHON_EXE
                        The Python interpreter to use, e.g.,
                        --python=python2.5 will use the python2.5 interpreter
                        to create the new environment.  The default is the
                        interpreter that virtualenv was installed with
                        (/usr/bin/python2)
</code></del></pre>
<p><del>Notice the "/usr/bin/python2" there. If I installed virtualenv with <code>pip install</code>, that text will be "/usr/bin/python".</del></p>
<p><del><strong>However</strong>, if I first did <code>pip2 install</code>, then did <code>pip install</code>, I guess the latter command didn't overwrite the <code>virtualenv</code> command in /usr/bin, because the output of <code>virtualenv</code> still contained "/use/bin/python2" rather than without the "2". (<strong>update:</strong> - and the two virtualenv command behave differently as well. See the "update" above.)</del></p>
<p><del>However again, I do think that virtualenv is installed twice, because <code>pip list</code> and <code>pip2 list</code> gives results that correspond reasonably with the state of whether and from where I have installed virtualenv.</del></p>
<p><del>I also think that "the" virtualenv that was installed twice, is indeed the same virtualenv, because I tried using the <a href="http://stackoverflow.com/a/5338383/1349048">"--download-cache"</a> command line option to point both pip and pip2 to the same cache directory when installing virtualenv, and they both worked. (<strong>update:</strong> They're the same virtualenv, but some configuration is different - so they behave differently. See previous "update".)</del></p>
<p><del>As extra info: I realised that Archlinux provided two virtualenv packages, one for python2 and the other for python3, named <code>python-virtualenv</code> and <code>python2-virtualenv</code>:</del></p>
<pre><del><code>$ pacman -Ss virtualenv
extra/python-virtualenv 1.11.2-1
    Virtual Python Environment builder
extra/python2-virtualenv 1.11.2-1
    Virtual Python Environment builder
</code></del></pre>
<p><del>I didn't even bother.</del></p>
<h2><del>"Different" virtualenv's generate the same pip</del></h2>
<p><del>Seen above, the same virtualenv (1.11.2) installed by different pip's (into different locations) will have different default values of which python each generated virtual environment will give you. (<strong>update:</strong> - and they behave differently. See "update" above.)</del></p>
<p><del>However, the <code>pip</code> command inside the virtual environment is always the same one: <strong>not pip2</strong> - regardless of whether virtualenv has been installed using pip or pip2. Inside the virtual environment, <code>pip</code> and <code>pip3</code> always gave the same thing, which is inside the <code>venv/</code> directory, while <code>pip2</code> always gives the system's global environment. In other words, <code>pip list</code> always gives two clean lines (pip and setuptools), and <code>pip2 list</code> always gives a long list (full of packages installed in the system environment).</del></p>
<h2><del>Conclusion</del></h2>
<p><del>There is no conceptal conclusion.</del></p>
<p><del>The factual conclusion is:</del></p>
<ul>
<li><del>Different pip's give you <em>the same</em> virtualenv installed in different locations and which uses different default values for the <code>python</code> command inside the virtual environment.</del></li>
<li><del>Regardless of which version of python you get inside the virtual environment, the pip in there is <strong>never pip2</strong>.</del></li>
</ul>
<p><del>Just use <code>sudo pip2 install virtualenv</code>, and never use <code>pip install</code>. Both version 2 &amp; 3 of both Python and pip works inside there.</del></p>
