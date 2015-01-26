---
title: Syncing stuff
wordpress_id: 1304
wordpress_url: http://blog.easoncxz.com/?p=1304
date: '2015-01-17 23:50:00 +1300'
date_gmt: '2015-01-17 11:50:00 +1300'
categories:
- User
tags:
- rsync
- unison
comments: []
---
<p>There is <a href="http://sourceforge.net/projects/freefilesync/">FreeFileSync</a> which shows the idea of a bi-directional, automatically-file-watching file sync tool, and is quite nice -- apart from that it's unclear how to automate it. There is also this thing called <code>rsync</code> which people mention all the time, but seems a bit mysterious.</p>
<h2>rsync</h2>
<p>OK so I basically sat down and <a href="https://rsync.samba.org/ftp/rsync/rsync.html">RTFM</a>. Turns out that it was quite simple: it's kinda like <code>cp</code> (or rather, <code>scp</code>), except that it can work with remote machines, by default via SSH, and has smart algorithms that moves only deltas / "patches", which speeds things up a lot.</p>
<p>So basically, all <code>rsync</code> does is copy files. It seems good for backing stuff up, especially when being used as a <a href="http://en.wikipedia.org/wiki/Cron">cron job</a> -- but for bi-directional syncing, which is our goal here, that's not enough. Enter <code>unison</code>.</p>
<h2>Unison</h2>
<p><a href="http://www.cis.upenn.edu/~bcpierce/unison/download/releases/stable/unison-manual.html">Unison</a> is, as is claims, a "file synchronizer". Reading their manual a bit, this seems like the exact piece of the puzzle we want (in order to achieve bi-di sync).</p>
<p>So, trying out their simple local usage tutorial (anchor #local on <a href="http://www.cis.upenn.edu/~bcpierce/unison/download/releases/stable/unison-manual.html">the same page</a>), I got a general feeling of Unison. Although it believably seems configurable and scriptable, the default behaviour is highly interactive (i.e. to the <em>keypress</em> -- response is made before I even hit <RETURN> after a keypress).</p>
<p>Again, we can cron; but is there something that perhaps gives (at least semi-) real-time "watching" and triggers Unison (or rsync) automatically? Well, enter <code>lsyncd</code>.</p>
<h2>Lsyncd</h2>
<p><a href="https://code.google.com/p/lsyncd/">Lsyncd</a> seems to be sort of like <code>watch</code>, but calls either <code>rsync</code> or a command specified in a configuration file upon the watched files being changed.</p>
<h2>Disclaimer</h2>
<p>I was a bit too lazy to try putting Lsyncd &amp; rsync or Lsyncd &amp; Unison together; my primary use-case really is just backing up a directory from my laptop into my external hard drive -- which is quite satisfiable by manually-triggered uni-directional backup -- which currently I'm (shamefully) not actually doing in any systematic way at all. I'll probably try out those fancier setups after I've <code>rsync</code>d for a while.</p>
