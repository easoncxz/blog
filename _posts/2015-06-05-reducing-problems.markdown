---
layout: post
status: published
title: "\"Reducing\" problems"
author:
    display_name: easoncxz
    url: 'http://blog.easoncxz.com/'
tags:
- language
- maths
- algorithms
---

In algorithms class, when talking about computational complexity and stuff like 
(whether) "P = NP", at some point, the lecturer must have mentioned something 
like this:

> We say a problem can be "reduced" to another iff any instance of the problem 
> can be formulated as an instance of the other. In other words, the given 
> problem can be thought of as a special case of the other problem.

Ok, it all sounds good and well. Until he/she mentions:

> For example, the problem of solving single-variable degree-one polynomial 
> equations can be reduced to the problem of solving single-variable 
> degree-**two** polynomial equations. E.g.,
> 
>       2x + 5 = 0
>
> can be thought of as a special-case of an equation of the form
>
>       ax^2 + bx + c = 0
>
> where a = 0.

Well, when I first came across the idea of "reducing" problems, it doesn't 
occur to me to be too weird to do such thing as "formulating a problem in terms 
of another" --- because afterall, wasn't that exactly [how mathematicians solve 
problems][maths]?

What I *did* get really confused about, was *which direction is the phrase used 
in?* Do we say "the degree-two problem reduced to the degree-one one", or do we 
say "the degree-one reduced to the degree-two one"? More importantly, how 
could/should I *remember* which direction it goes?

# "Reduce"?

Of course then, the point here is --- which the guy (/u/menuitem) in the thread 
already pointed out --- that using the phrase "reduce" seems a bit misleading. 
Why "reduce"? Does it mean "if we reduce a problem, it somehow gets *simpler*, 
in terms of the effort required to solve it"? --- because taken at face value, 
perhaps that's what the phrase "to reduce a problem" might mean.

But on the other hand, being ones who *actually understand* what the phrase 
means (since we read and understood its definition, right?), we can see that the 
above, face-valued interpretation is actually giving exactly the opposite of the 
correct interpretation. The problem with questions with exactly two answers, is 
that if you get it wrong, you get it *completely* wrong, by getting the *exact 
opposite*. Meaning the exact opposite of what you *thought* you meant, well, may 
be unhelpful.

We can see that the `ax^2 + bx + c = 0` problem, which the arguably "simpler" 
`ax + b = 0` can be reduced to, is arguably "more difficult to solve". Indeed, 
there are kids who know how to solve the degree-one case but not the degree-two 
case. In other words, after "reducing" a problem (to a new one), we've somehow 
ended up with a more difficult problem than what we started off with.

Back in the "P = NP" (and of course, "NPC") context, such apparently 
counterintuitive naming (to say the least) should be even more obvious --- NPC 
problems are surely difficult to solve (i.e. efficiently), but people reduce 
lots of simple-looking problems to known NPC problems, and say "well if you want 
to solve this simple-looking problem (again, i.e. efficiently), you could first 
try solving any of this pile of really hard NPC problems". Wouldn't it seem 
weird that we say we're "reducing" problems, but we're ending up with the pile 
of hard NPC problems after doing the "reduction"?

So what exactly is being "reduced"?

# Reduce.

So, here you go --- this is my way of interpreting and remembering which 
direction "reduce" means:

> perhaps what's being (literally speaking) reduced, is "the number of problems 
> we need to care about how to solve".

If we knew how to solve (i.e. in the sense of "having an algorithm for" or 
"having a general formula for") *any* (single-variable) polynomial equation, 
then we wouldn't care so much about how to solve say, 7th-order polynomial 
equations, because they would merely be a special case which the formula can 
handle. And I think we can all agree that this is nice. Such an act of 
"summarising solutions into a general form" is a way to save dull-work, avoid 
mistakes, and focus our attention on higher-level (i.e. "of abstraction") 
things.

In a software engineering point of view, I'd also say that it's one of the 
motivations of writing reusable code --- each problem should be solve exactly 
once; write once, use everywhere. If you haven't noticed, the idea of "reducing" 
a problem is nicely analogous to the idea of "making a call into a library 
function". You can find the minimal element in a list by calling some library 
function `sort` to sort your list and then taking the first element --- that 
way, you would have reduced "finding the minimal element" into "sorting the 
list" by calling the `sort` function. (Let's focus on "reduction" instead of 
"efficiency" here!) (Also, BTW, notice how "sorting a list" is a more 
difficult-seeming problem than "finding the min" is.) I guess I've given a 
not-really-good example here; but the idea is that you can write e.g. functions 
that are, in some way, very general, so that it can handle various use-cases.


[maths]: http://www.reddit.com/r/Jokes/comments/1kid90/the_mathematicians_interview/
