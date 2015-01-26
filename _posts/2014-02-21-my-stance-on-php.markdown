---
title: My stance on PHP
wordpress_id: 1022
wordpress_url: http://blog.easoncxz.com/?p=1022
date: '2014-02-21 00:51:11 +1300'
date_gmt: '2014-02-20 12:51:11 +1300'
categories:
- dev
- jabber
tags:
- php
comments: []
---
<p>I come from Pascal, Java, and then Python. I look forward to learning Ruby, Lisp (Clojure &amp; Scheme), and C. I plan to learn Javascript too. Amongst all languages, I also decided to learn PHP.</p>
<p>I should clearly state this up front: I <em>know</em> that PHP <em>sucks</em>.</p>
<ul>
<li><a href="http://me.veekun.com/blog/2012/04/09/php-a-fractal-of-bad-design/">PHP: a fractal of bad design</a></li>
<li><a href="http://www.tnx.nl/php.html">PHP IN CONTRAST TO PERL</a></li>
<li><a href="http://weblogs.asp.net/alex_papadimoulis/archive/2005/05/25/408925.aspx">Pounding A Nail: Old Shoe or Glass Bottle?</a></li>
<li><a href="http://www.codinghorror.com/blog/2008/05/php-sucks-but-it-doesnt-matter.html">PHP Sucks, But It Doesn't Matter</a></li>
</ul>
<p>Well, the fact that a language sucks shall not - at least not directly - infer that one should not learn it. <em>(By "learn it", I mean "know about it enough so that you are capable of working in a project that uses it".)</em> I decided to learn PHP simply <strong>because it's unfortunately just too widely used</strong>. I want to be able to <strong>understand metaphors</strong> mentioning PHP, and I want to be able to <strong>understand some projects</strong> written in PHP. Of-course I won't use PHP to build anything from my inspiration, nor to teach others to program.</p>
<p>I feel, that: Learning PHP is hard, because it bends your instincts. Using PHP is also hard, because you never know where the next unexpected ridiculous gotcha, coming from the core of the language itself, will pop up.</p>
<p>I've learnt a tiny bit, and have just come across this:</p>
<pre><code>$foo = "This variable is global";

function my_func() {
    return $foo;
}

echo my_func();
// echoes empty string
</code></pre>
<p><a href="http://www.phpwtf.org/"><strong>WTF</strong></a>?</p>
<p>Turns out, that the "return" statement's operand <strong>silently created an uninitialized local variable</strong> that shadows the global one.</p>
<p>Obviously, this seems like one of the most trivial gotcha's in the fractal of PHP; but I do feel like I need at least one example in order to make a point.</p>
<p>&nbsp;</p>
<p>Take the concept "function" for example. This very concept is a mental/expressive/computational tool created for a purpose: to hide details and create an abstraction. Functions (outside of PHP!) work the way they do - e.g. being able to refer to variables defined outside itself - because such a way helps the concept of "function" suit its purpose. <em>(As for how that helps, I'd rather not explain - it doesn't belong in this article. Besides, I could've used an example other than "function" right?)</em></p>
<p>Programmers learn language-independent abstract programming/computation concepts - such as "function" - and, relying on those concepts, gain intuitive instincts of ways to think about, or solve, problems. (In jargon: those concepts provide programmers an <em>abstraction barrier</em> on top of tools for solving problems.) Such instincts - or say, mindsets - are <em>shared</em> between different programming activities. The mindset <strong>is</strong> programming.</p>
<p>&nbsp;</p>
<p>PHP doesn't seem to give a shit about those mindsets. Who cares if you expect global variables to be accessible inside functions or not? In fact who cares if they are <em>meant to be</em> accessible or not? As long as you, the unlucky programmer who needs to use PHP, can search the fucking PHP manual and see that "ah, so in order for things to <em>intuitively</em> make sense, I have to <em>artificially</em> adapt stuff", PHP is usable (<a href="http://blog.easoncxz.com/?p=794">whatever that means</a>). Thus here is the problem:</p>
<p>PHP disobeys the programming mindset.</p>
<p>As a result of this, those who know how to program would be astonished by PHP's nonsense every now and then, while those who do not yet know would subconsciously receive a set of intuition that's simply <em>bad</em> for the purpose of <em>programming</em> - a set intuition that will cause incapability to appreciate or make use of all those abstract concepts created by previous contributors to computation and programming, computer science and maths, due to being it being incompatible with them. <em>(Note, that PHP does not provide any intellectually worthy mindset, if any non-conflicting mindset at all. That would be a miracle.)</em></p>
<p>Of-course one does not simply either <em>do</em> or <em>don't</em> know how to program - one rather hold a dynamically-changing arbitrary set of conceptual knowledge instead. The amount of damage PHP does to its learner/user depends on the amount of <em>conceptual programming knowledge</em> he has: the more he already knows, the less the damage; the less he already knows, the more the damage.</p>
<p>As a conclusion, which tries to give myself and others some advice on exactly what attitude to hold towards PHP, and especially also to remind myself and keep myself aware of the consequences of learning/using PHP:</p>
<p>Learn and remember to <strong>protect yourself from potentially subconsciously learning any programming concepts from PHP</strong>.</p>
<p>If an intuition is unfortunately created through the learning or using of PHP, it would most likely need to be un-learned and properly re-learned through a different programming language. It is better to first learn the concept through a proper programming language, and subsequently applied in PHP.</p>
<blockquote><p>
  The use of COBOL cripples the mind; its teaching should, therefore, be regarded as a criminal offence.<br />
    — <a href="http://www.cs.virginia.edu/~evans/cs655-S00/readings/ewd498.html">Edsger W.Dijkstra</a>
</p></blockquote>
