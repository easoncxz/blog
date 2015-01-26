---
title: Get started on Git
excerpt: "<a title=\"Git\" href=\"http://git-scm.com/\" target=\"_blank\">Git</a>
  is a what's called \"version control system\"; its name is pronounced as \"Git\"
  instead of \"Jit\" (G as in G for goat, not G for general). it can allow you to
  manually record the changes of files.\r\n\r\nfor me, i simple use it to revert files
  to a previous state. in other words, i simply use the powerful Git as sort of a
  multi-version super file-saver.\r\n\r\nGit is useful to anyone who wants to keep
  track and have control over changes of his files. in order to help you learn about
  Git, below i will state the most important things in terms of starting learning
  Git."
wordpress_id: 3
wordpress_url: http://easoncxz.com/blog/?p=3
date: '2012-08-18 14:26:58 +1200'
date_gmt: '2012-08-18 02:26:58 +1200'
categories:
- dev
tags:
- Git
comments: []
---
<p><a title="Git" href="http://git-scm.com/" target="_blank">Git</a> is a what's called "version control system"; its name is pronounced as "Git" instead of "Jit" (G as in G for goat, not G for general). it can allow you to manually record the changes of files.</p>
<p>for me, i simple use it to revert files to a previous state. in other words, i simply use the powerful Git as sort of a multi-version super file-saver.</p>
<p>Git is useful to anyone who wants to keep track and have control over changes of his files. in order to help you learn about Git, below i will state the most important things in terms of starting learning Git.<a id="more"></a><a id="more-3"></a></p>
<ul>
<li>Git originally doesn't have a <abbr title="Graphics User Interface">GUI</abbr>, and is run from <a title="the Unix shell" href="http://en.wikipedia.org/wiki/Bash_(Unix_shell)" target="_blank">Bash</a>.</li>
<li>Git stores the information in a hidden folder normally named ".git".</li>
<li>the collection of data regarding the certain set of files you desire to track is called a "repository", or "repo".</li>
<li>each saved version of the repo is called a "commit". "commit" is also a verb, meaning to save the current state of the files into a commit.</li>
<li>the action of restoring the tracked files back to the status of one of the commits is called "checkout".</li>
<li>as Git sees it, there are <a href="http://git-scm.com/book/en/Getting-Started-Git-Basics#The-Three-States" target="_blank">three different states</a>/statuses a tracked file could be in: working, staged, committed.</li>
<li>you may find <a href="http://git-scm.com/book/en/Git-Basics-Tips-and-Tricks#Git-Aliases" target="_blank">aliases</a> helpful in terms of typing Git commands.</li>
</ul>
<p>in my case where i just use Git as an approach to accessing different versions of  a file, my most used commands are:</p>
<ul>
<li>git init<br />
creates a Git repo, which is stored in the ".git" directory. the first command to run. repo would be created in the location where the command is run.</li>
<li>git add<br />
start tracking files i desire to track</li>
<li>git  commit<br />
save the current status of the track files (or say repo) into a commit</li>
<li>git branch</li>
<li>git checkout<br />
restore the status of the repo (or say tracked files) (back) to how they are like during they're once committed.</li>
<li>gitk<br />
a simple built in GUI tool for Git on the Windows platform.</li>
</ul>
<p>further reading:</p>
<ul>
<li>git-scm.com recommend book list:<br />
<a href="http://git-scm.com/doc/ext">http://git-scm.com/doc/ext</a></li>
<li>...which includes<br />
<em><a title="a link to amazon" href="http://www.amazon.com/gp/product/0596520123/" target="_blank">Version Control with Git: Powerful Tools and Techniques for Collaborative Software Development</a></em> (O'Reilly)</li>
<li>...and<br />
<em><a href="http://git-scm.com/book" target="_blank">Pro Git</a></em> - Scott Chacon (Apress)</li>
</ul>
