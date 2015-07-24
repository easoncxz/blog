---
layout: post
title: "Top-down Learners"
---

Along a certain dimension, learning styles can be categorised into roughly two 
types: **top-down** learners and **bottom-up** learners. Today I witnessed a 
small anecdote on the distinction of the two, and thought I should write it 
down.

## Scene in class

[Someone (Linus, actually) said][linus], "Talk is cheap. Show me the code." I,
for one, would think that programmers in general, would be top-down learners,
and would *just ask* for the (preferably authorative, succinct and intuitive) 
definitions of things, stare at it for a while and understand it --- as opposed 
to, you know, *asking for examples first*.

During network defense class, we were being told some RSA stuff.

> Euler's totient function (or Euler's phi function), denoted as φ(n) or ϕ(n), 
> is an arithmetic function that counts the positive integers less than or equal 
> to n that are relatively prime to n.

(The above definition is actually copied from [Wikipedia][wikipedia] by me; the 
lecturer gave something of a similarly maths-y wording style.)

> E.g.,  
>   phi(3) = 2  
>   phi(4) = 2  
>   phi(5) = 4  
>   phi(6) = 2  
>   phi(7) = 6  
>   phi(8) = 4  

Everyone's like "Er... what?". Someone asked, "Isn't there a short, simple way 
to explain it?". After some more failed attempts at trying to explain the thing 
using only a few short phrases, the lecturer decided to go through a full 
example:

> Say we want to calculate phi(5). What are the numbers from 1 up to 5? --- 1, 
> 2, 3, 4, 5.  
> gcd(1, 5) = 1  
> gcd(2, 5) = 1  
> gcd(3, 5) = 1  
> gcd(4, 5) = 1  
> gcd(5, 5) = 5  
>
> We notice 4 "1"s, hence phi(5) is 4.

When the lecturer counted "1, 2, 3, 4" for the "1"s, half the class went 
"OOHHHH!! I GET IT NOW!"


## Commentary

During class when whoever-it-is that asked for a "short, simple" explanation, I 
turned around, pointed to the slideshow and said, "well the definition is 
written right there, and it's only, like, a sentence long." I now realise I 
must've sounded condescending or mean; perhaps I shouldn't have said that.

**People do learn differently!** When half of the class went "Oh!!!", I was 
shocked that, even among programmers, there are *so many* people who seem to be 
bottom-up learners --- to prefer *examples* over *definitions* during 
first-contact to some piece of knowledge. Personally, I paid much more attention 
to the definition than to the examples.

Perhaps my a-priori, subjective impression was very wrong in the first place. 
Perhaps this sort of "to understand it, first stare at the definition, hard" 
mindset would be more common among maths students than among programmers. Having 
just taken a maths paper (mostly about formal proof techniques too!) last 
semester, maybe I was the most maths-y one in the audience today.


## Related observations

**There's probably a common view that, specifying things succinctly, using a 
formal language, is an elegant and efficient thing to do.** I came across an 
example just this week while reading [a paper about TLS][TLS-paper] where they 
tried to specify and implement TLS using functional programming, with a goal of 
reducing ambiguity. For a given concept, say "Foo", examples and definitions can 
both tell you what sort of thing would count as a Foo, but only definitions can 
(reliably) tell you also what **would not count** as a Foo --- it's something 
examples fail miserably at.

**Sometimes/Often, clearly specifying the problem actually yields a solution.** 
This strongly reminds me of functional-style declarative programming.

> "How do you find, for some given natural number n, the number of natural 
> numbers from 1 to n inclusive that are co-prime with n?"  
>
> "Well, (duh,) you just **count** the number of numbers from 1 to n for ones 
> that are co-prime."

> "The factorial of a natural number n is the product of multiplying together 1, 
> 2, 3, ..., n."
>
> "Well then, to calculate the factorial of n, just multiply together the first 
> n natural numbers."

As I write the above two dialogues, they started to seem too tautological... I'm 
not sure how well this "solution via problem definition" works in general. It 
feels very good solving problems this way though!

[linus]: https://lkml.org/lkml/2000/8/25/132
[wikipedia]: https://en.wikipedia.org/wiki/Euler%27s_totient_function
[TLS-paper]: http://www.cl.cam.ac.uk/~pes20/nqsbtls-usenix-security15.pdf
