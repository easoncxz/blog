---
title: Anonymous recursion & the Y Combinator
excerpt: "Normally, recursion requires us to have a name that is <em>bound</em> to
  the function which is recursive, e.g. we need a name \"fact\" to be <em>bound</em>
  to the factorial function itself in order for us to be able (i.e., recursively)
  use the name \"fact\" within the definition of the factorial function.\r\n\r\nHowever
  - e.g. in lambda calculus, due to functions having no essential difference from
  data/objects e.g. literal number \"42\" - functions can be anonymous.\r\n\r\nIf
  you're reading this, you've probably read that a thing called the \"Y Combinator
  \" can help us with this task (viz. creating an anonymous recursive function, where
  \"anonymous\" means \"does not have a name bound to it\").\r\n\r\n<strong>This article
  explains \"what the Y Combinator does\", and \"how to use it\" (but not \"what it
  is\" or \"why and how it works\" etc.).</strong>\r\n\r\n"
wordpress_id: 895
wordpress_url: http://blog.easoncxz.com/?p=895
date: '2013-11-15 20:15:19 +1300'
date_gmt: '2013-11-15 08:15:19 +1300'
categories:
- study
tags: []
comments: []
---
<p>Normally, recursion requires us to have a name that is <em>bound</em> to the function which is recursive, e.g. we need a name "fact" to be <em>bound</em> to the factorial function itself in order for us to be able (i.e., recursively) use the name "fact" within the definition of the factorial function.</p>
<p>However - e.g. in lambda calculus, due to functions having no essential difference from data/objects e.g. literal number "42" - functions can be anonymous.</p>
<p>If you're reading this, you've probably read that a thing called the "Y Combinator " can help us with this task (viz. creating an anonymous recursive function, where "anonymous" means "does not have a name bound to it").</p>
<p><strong>This article explains "what the Y Combinator does", and "how to use it" (but not "what it is" or "why and how it works" etc.).</strong></p>
<p><a id="more"></a><a id="more-895"></a></p>
<p>Pseudo-spoiler: the Y Combinator is: <code>Y = \f.(\x.(f (x x)) \x.(f (x x)))</code> (well, this doesn't really answer the above questions... so not a real spoiler.)</p>
<p>We want to define a "fact" like this:</p>
<pre><code>fact = \n.((= n 0)
           1
           (* n
              (fact (- n 1)))
</code></pre>
<p>However, we don't want the word (or say, <em>name</em>) <code>fact</code> to appear in the, "expression" if you like (i.e. this thing on the right-hand side of the equals sign), of the definition of the "fact" function itself. We can move it out a bit using the reversed process of a <em>beta reduction</em>:</p>
<pre><code>fact = \f.\n.((= n 0)
            1
            (* n
               (f (- n 1)))) fact
</code></pre>
<p>Allow me to give <em>that</em> (you know what I'm pointing at!) chunk of stuff a name "H":</p>
<pre><code>fact = H fact
</code></pre>
<p>Good! <code>H</code> applied to <code>fact</code> is, again, <code>fact</code>. Clearly and intuitively, <code>fact</code> is a "fixed point" of the function H. And how do we know how to express <code>H</code> explicitly? - Well, we've already done that!</p>
<p>Now the question lies in: How do we find the "fixed point"(in this case, "fact") of a given function (in this case, "H")?</p>
<p>The answer is easy - use <code>Y</code>!</p>
<p><code>Y</code> is the "fixed point operator". It returns the fixed point for any function provided to it. We don't know or care about how the mysterious <code>Y</code> is expressed (well, we sort of do...), but by its definition, or "purpose" if you like, we know:</p>
<pre><code>fact = Y H
</code></pre>
<p>(If you substitue around, you'll see that:</p>
<pre><code>Y H = fact = H fact = H (Y H)
Y H = H (Y H) = H (H (Y H)) = H (H (H (H (...))))
</code></pre>
<p>Well, just thought the above two lines was worth pointing out.)</p>
<p>Now, we know <code>H</code>, know <code>fact = Y H</code>, so voila, we know <code>fact</code>. End of story.</p>
<pre><code>fact = Y
       \f.\n.((= n 0)
              1
              (* n
                 (f (- n 1))))
</code></pre>
