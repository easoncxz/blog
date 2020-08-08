---
layout: post
author:
    display_name: Eason Chen
    login: easoncxz
date: '2020-08-08'
title: 'Dissecting "dynamic dispatch"'
---

This is a post to describe a realisation I recently had about "dynamic 
dispatch", also known as "runtime polymorphism". I will compare:

- how object-oriented programming (OOP) and functional programming (FP) 
  paradigms each addresses the same problem related to "dynamic dispatch", and
- how each provides solutions that have similar characteristics in 
  modifiability.

In this post I will write code samples in TypeScript, because it conveniently 
supports expressing all the ideas I wanted to talk about.

# What is dynamic dispatch?

Most people writing in an OOP language should know this as their 
bread-and-butter, but let's just rehash it to establish some common ground.

Dynamic dispatch, as the name suggests, is about doing some kind of "dispatch" 
"dynamically". In this case, "dispatch" means "what does this method-call do", 
and "dynamically" means "you cannot know until the program is run". Let's see a 
simple example.

> **Notational convention**: For brevity, I will liberally write examples with 
> some fictional functions and assuming some kind of async-function context.
> Code in this post is primarily for you to read as a human, and execution is 
> only secondary. To be honest, this is also due to my lack of fluency in the 
> built-in libraries and APIs of the TypeScript/JavaScript languages.

Say you want to greet the user in different languages. So you define different 
greeters classes to each situation:

```typescript
class FrenchGreeter {
    greet(): string {
      return "Bonjour";
    }
}

class EnglishGreeter {
    greet(): string {
        return "Hello";
    }
}
```

You then define a super-type for greeters, so that you can assign different 
greeter instances into the same general greeter variable:

```typescript
type Greeter = {
  greet(): string;
}

const greeter: Greeter = new FrenchGreeter();
```

> **Sidenote on technicalities**: the above implementation uses a convenient 
> feature that TypeScript offers: structural subtyping. Right-hand-side values 
> of any type can be assigned to `Greeter` so long as the right-hand-side type 
> has a "shape that fits". If you come from Python/Ruby backgrounds, then I 
> guess you can see this as a compile-time checked "duck-typing". If you're from 
> languages like Go or Rust, this is like traits.  If you come from languages 
> like Java or C# and feel uncomfortable about this, you can also use nominal 
> subtyping like you are used to:

```typescript
interface IGreeter {
    greet(): string;
}

// Then modify the implementing classes to add the `implements` clause:
class FrenchGreeter implements IGreeter { ... }
class EnglishGreeter implements IGreeter { ... }

const greeter: IGreeter = new FrenchGreeter();
```

Now we can invoke the `.greet` method, regardless of whether you chose the 
structural subtyping approach (`type Greeter`) or the nominal subtyping approach 
(`interface IGreeter`). Indeed it works:

```typescript
console.log(greeter.greet());  // "Bonjour"
```

> Reading guide: If you want to follow along the code samples, either type the 
> lines into a `something.ts` file, run `tsc something.ts`, then run the 
> generated JavaScript file via `node something.js`. Alternatively, you can use 
> ts-node for a one-click run via `ts-node something.ts`. To install tsc and 
> ts-node, use `npm -g i typescript ts-node`.

Let's make the observation that this "dynamic" dispatch is truly dynamic: in the 
above example, I have hard-coded an assignment to my `greeter: Greeter` variable 
to be an instance of `FrenchGreeter`. However, the choice of which particular 
greeter to use can be user-provided, and hence **totally random and unknown 
until the program is run**. Consider this:

```typescript
// ??! what greeter will be run? We don't know!
const greeter: Greeter =
    Math.random() > 0.5
        ? new FrenchGreeter()
        : new EnglishGreeter();

console.log(greeter.greet()); // ??? We cannot know what will be printed out without running the program
```

Let's run the program ten times in a row. Look at this randomness!

```
$ tsc ex.ts

$ for i in $(seq 10); do node ex.js; done
Hello
Hello
Hello
Hello
Hello
Bonjour
Hello
Bonjour
Hello
Hello

$ for i in $(seq 10); do node ex.js; done
Bonjour
Bonjour
Hello
Bonjour
Hello
Bonjour
Bonjour
Bonjour
Hello
Hello
```

It truly is dynamic!

# What is dynamic polymorphism good for?

Basically, it's good for modifiability of your program. When you want to use
different greeting logic, perhaps by modifying one greeting, or use different 
greetings altogether, you don't need to change the consumer of the greeter.

For being clear about what I'm talking about when I say "consumer", let's wrap 
the `console.log` call into a function by changing the original...

```typescript
console.log(greeter.greet());
```

... into a function definition paired with a function call somewhere:

```typescript
function performGreeting(g: Greeter): void {
    console.log(g.greet());
}

performGreeting(greeter);
```

Now, we can think more clearly: the definition of the `performGreeting` function 
is the complicated business-logic function that we don't really want to touch 
when we want to change our greeting specifics.

> **Sidenote**: Ideally we wouldn't even want to change the signature of 
> `performGreeting` too much either, since all call-sites of it would need to be 
> updated as well, although in an application (instead of a library) implemented 
> in a statically-typed language, this is less of a problem: you just make 
> whatever changes needed, make everything type-check, and everything should be 
> good again.

Lots of people say, as a kind of slogan, that "switch-case statements are a 
code-smell and should be avoided", and they would recommend using "polymorphism" 
instead. Let's look at what that means, and how our existing code would look if 
we don't use dynamic dispatch.

If we have no dynamic dispatch aka what OOP people usually just call by the 
unqualified phrase "polymorphism" (there are actually other types of 
polymorphisms), we cannot have assignments like:

```typescript
const greeter: Greeter = new FrenchGreeter();
```

The compiler would be like, "what do you mean you're going to assign a 
`FrenchGreeter` to a variable that should hold a `Greeter`? THEY AIN'T THE SAME 
TYPE!!". Similarly, we cannot pass a value of type e.g. `FrenchGreeter` to a 
function like `performGreeting(g: Greeter)` that has a parameter of some kind of 
"super-type" like `Greeter`.

As such, we would probably need to get rid of the `Greeter` super-type, and add 
branching using an `if` or `switch` statement to _some_ part of our program. 
Perhaps something like this:

```typescript
function performGreeting(useFrench: boolean): void {
    if (useFrench) {
        console.log(new FrenchGreeter().greet());
    } else {
        console.log(new EnglishGreeter().greet());
    }
}

performGreeting(Math.random() > 0.5);
```

Or if you're trying to be smart, you might say "Aha! We should *factor out* the 
branching into some kind of unified `Greeter` layer instead of polluting the 
consumer side with the branching logic!" Ok, I hear you; so let's try this:

```typescript
// Trying to use this class to encapsulate the branching logic.
class UnifiedGreeter {
    // Hold on to some greeter instances, which never needs to change.
    //
    // TypeScript has this syntax for defining instance attributes and
    // assigning to them simultaneously:
    constructor(
        private readonly frenchGreeter: FrenchGreeter,
        private readonly englishGreeter: EnglishGreeter,
    ) {}

    // Here's the critical part that performs the branching!
    greet(useFrench: boolean): string {
        if (useFrench) {
            return this.frenchGreeter.greet();
        } else {
            return this.englishGreeter.greet();
        }
    }
}

const unifiedGreeter = new UnifiedGreeter(
    new FrenchGreeter(),
    new EnglishGreeter(),
);

// Notice that this function signature remained unchanged:
function performGreeting(useFrench: boolean): void {
    // Reaching into the outer scope to use the `unifiedGreeter` instance.
    //
    // you could also change the signature of `performGreeting` to pass the 
    // UnifiedGreeter in as a parameter; it doesn't really make much difference.
    //
    // "Look, so clean! Just one line! Delegating outwards! Nice!"
    console.log(unifiedGreeter.greet(useFrench)); 
}

performGreeting(Math.random() > 0.5);
```

It doesn't really matter where you put the `FrenchGreeter` and `EnglishGreeter` 
object instances, or whether you pass things in as params or access them as 
variables from some outer scope (e.g. global variables), **the critical bit of 
code that performs the branching is still there**, and that bit of branching is 
the source of all the problems that dynamic dispatch solves.

Let's see what you need to change if you want to e.g. change the English 
greeting to be more detailed, and add a greeting in a new language, say Spanish.

## Modify the greeting for English

The English part is trivial: you just modify the definition for `class 
EnglishGreeter`. There is no getting around this, and there's nothing that needs 
to be done beyond this. Easy:

```typescript
class EnglishGreeter {
    greet(): string {
        return "Hey there!"; // Ok, some kind of change to our English greeting
    }
}
```

No interface changes; all the rest of the code remains unchanged.

## Adding a greeting in Spanish

This is way more tricky. Let's think about what we need to do:

- Define some `SpanishGreeter`, and
- Add a branch into our existing branching statement.

So we define some new constructs:

```typescript
// Adding a class; easy
class SpanishGreeter {
    greet(): string {
        return "Hola";
    }
}

// We have THREE cases now: EN, ES, FR! A boolean isn't enough!
// "Let's write clean code and define an enum!!"
enum Language {
    English,
    French,
    Spanish,
}
```

... and change some existing code:

```diff
 class UnifiedGreeter {
     constructor(
         private readonly frenchGreeter: FrenchGreeter,
         private readonly englishGreeter: EnglishGreeter,
+        private readonly spanishGreeter: SpanishGreeter,
     ) {}
 
-    greet(useFrench: boolean): string {
+    greet(language: Language): string {
-        if (useFrench) {
-            return this.frenchGreeter.greet();
-        } else {
-            return this.englishGreeter.greet();
-        }
+        switch (language) {
+           case Language.English:
+               return this.englishGreeter.greet();
+           case Language.French:
+               return this.frenchGreeter.greet();
+           case Language.Spanish:
+               return this.spanishGreeter.greet();
+        }
     }
 }

 const unifiedGreeter = new UnifiedGreeter(
     new FrenchGreeter(),
     new EnglishGreeter(),
+    new SpanishGreeter(),
 );
```

Since we are doing a three-way branching here, the consumer function side also 
necessarily need to be updated to handle more than the two cases than a 
`boolean` can distinguish:

```diff
-function performGreeting(useFrench: boolean): void {
-    console.log(unifiedGreeter.greet(useFrench)); 
-}
+function performGreeting(lang: Language): void {
+    console.log(unifiedGreeter.greet(lang)); 
+}
```

Finally, we can convert the dynamic user-input (here represented by 
`Math.random()`) into our enum, before passing it inwards into our system:

```diff
-performGreeting(Math.random() > 0.5);
+const choice: number = Math.random();
+const language: Language =    // Just some arbitrary three-way split
+    choice > 0.8
+        ? Language.Spanish
+        : ( choice > 0.5
+          ? Language.French
+          : Language.English
+          );
+performGreeting(language);
```

Indeed, finally our new, tri-lingual program is working as intended:

```
$ tsc ex.ts

$ for i in $(seq 10); do node ex.js; done
Bonjour
Bonjour
Bonjour
Hello
Hello
Bonjour
Hello
Hola
Hello
Hello

$ for i in $(seq 10); do node ex.js; done
Hello
Hola
Hello
Hello
Hola
Hola
Bonjour
Hola
Hello
Hola
```

## If we had dynamic dispatch instead...

... it would have been a much easier change: the changes are _exactly_ an analog 
of how you would describe the changes in spoken language (i.e. here in English). 
Instead of adding a case to some branching somewhere, and adding a branch to 
some enum-like datatype somewhere, we just add a new candidate that "fits the 
same shape" of what the consumer expects, then pass in an instance of a 
candidate we choose. Let me explain that explicitly.

We need to define the same new greeter. This is of course something you can't 
avoid:

```typescript
// Adding a class; easy
class SpanishGreeter {
    greet(): string {
        return "Hola";
    }
}
```

Then, we choose and instantiate the candidate we want:

```diff
+// Move the choice to a standalone binding so that we can
+// look at it more than once.
+const choice = Math.random();

 const greeter: Greeter =
-    Math.random() > 0.5
+    choice > 0.8
+        ? new SpanishGreeter() // Novelty!
+        : choice > 0.5
         ? new FrenchGreeter()
         : new EnglishGreeter();
 
 // Complete unchanged:
 function performGreeting(g: Greeter): void { ... }
 
 // Also completely unchanged!
 performGreeting(greeter);
```

To be more clear about the weird associativity of the ternary `?:` operator, 
let's be a bit more explicit and use some parentheses:

```diff
+const choice = Math.random();

 const greeter: Greeter =
-    Math.random() > 0.5
-        ? new FrenchGreeter()
-        : new EnglishGreeter();
+    choice > 0.8
+        ? new SpanishGreeter() // Novelty!
+        : ( choice > 0.5
+          ? new FrenchGreeter()
+          : new EnglishGreeter()
+          );
```

You get the idea; the precedence rules do do what you think.

# Reflections: what did dynamic dispatch _really_ do?

Let's slow down a bit, and think about what we have achieved by using dynamic 
dispatch:

- We can add more "candidate ducks" to our program (reusing the analogy of "duck typing").
- Instead of scrutinising a plain scalar value (in our case, `boolean` or `enum Language`) using 
  an `if` or `switch` statement/expression, we pass in a somehow "smarter" and more 
  sophisticated value (in our case, a `Greeter`).
- Parts of the program that depend only on the unifying `Greeter` super-type 
  never needs to be changed.

**"But you're a liar! You still have branching in your program!"**

You're right, astute reader. Instead of using `if` or `switch`, I have indeed 
used the ternary operator in those `choice ? foo : bar` expressions. However, 
think about it: **there is no getting around it; you MUST have branching 
somewhere in your program**, because the semantics of the program includes some 
branching:

> **If** the user chooses Spanish, show a Spanish greeting; **else if** the user 
> chooses French, show a French greeting; **else if** ...

So what really happened with all of the smokes and mirrors of this "dynamic 
dispatch" thing? In particular:

- How did we miraculously achieved better modifiability just by using this 
    benign, yet curious-looking, super-type `type Greeter` (or `interface 
    IGreeter`)?
- What did assigning a `FrenchGreeter` value to a `Greeter` variable _really_ 
    achieve?

# Squint and look...

If you step back, glance over the details of exactly what programming constructs
are used (e.g. classes, interfaces, functions, variables), and focus on the 
abstract program logic (e.g. looping, branching, effects, terminating), you 
might realise one thing:

**The branching moved outwards.**

What do I mean by this? Well, "outwards" as in the sense of the call-stack, the 
"main function", the entry-point to your program. The branching moved from deep 
inside your program towards the integration points of your program and the outer 
execution context, which in this case is the `tsc`/`node`/`ts-node` commands. We 
defined sophisticated structures like `class FrenchGreeter` and `type Greeter` 
to facilitate defining things, passing them around, and just generally "making 
things line up", but ultimately, the big idea is to move the logic (in this 
case, the branching) outwards.

If you twist your mind a little bit, you might find that this is kind of like 
turning the `UnifiedGreeter` idea "inside-out", somehow. `UnifiedGreeter` tries 
to encapsulate the branching inside the depths of the program, and tries to 
communicate with the rest of the program (and indeed the rest of the world) by 
the use of some plain, passive, dumb, scalar, and serialisable datatypes like 
`boolean` or some plain `enum`. Dynamic dispatch, on the other hand, does not 
communicate; it simply receives some "duck-like" thing, and makes it "quack".

# Is dynamic dispatch unique and necessary?

So we get it now. "Push logic outwards; pass things in." Big deal. But is 
"dynamic polymorphism" really necessary for achieving this? Is there any way to 
achieve similar modifiability properties by using different programming 
constructs, and achieve an outcome that performs similarly under demands of 
making "business-level" changes to the requirements on our program's semantics?

In earlier sections in this article, there is nothing new or novel. OOP 
programmers already know all of the facts and observations that I described. 
**This is the part of this article where things start to get interesting**, as I 
compare the different paradigms of OOP and FP, analysing how ideas and 
constructs correspond and translate to and from each other.

## A foray into the functional programming world

In the FP world, there are no objects or classes. "What?", you say. Well yes, we 
do everything using standalone functions and plain datatypes.

So instead of code like this:

```typescript
// Interface, data + behaviour together, in OOP style
type Greeter = {
    greet(): string;
}

// Implementation
class FrenchGreeter {
    greet(): string {
        return "Bonjour";
    }
}

// Composition
function performGreeting(g: Greeter): void {
    console.log(g.greet());
}

// Invocation
// (This uses "runtime polymorphism", since here we assign a FrenchGreeter to a Greeter)
performGreeting(new FrenchGreeter());
```

You might have code like this:

```typescript
// Interface, data part
type Greeting = {
    phrase: string;
}

// Interface, behaviour part
function greet(g: Greeting): string {
    return g.phrase;
}

// Implementation
const frenchGreeting: Greeting = {
    phrase: "Bonjour"
};

// Composition
function performGreeting(g: Greeting): void {
    console.log(greet(g));
}

// Invocation
// (No polymorphism; just plain data-passing)
performGreeting(frenchGreeting);
```

Again, if you squint, you'll realise that under the superficial differences in 
what programming constructs are used, the basic semantic backbone of the program 
is exactly the same: things get defined; some interface get established; things 
get passed in to some consumer-code to be composed together.

In particular, I want to bring your close attention to the composition site:

```typescript
function performGreetingOOP(g: Greeter): void {
    console.log(g.greet());
}

function performGreetingFP(g: Greeting): void {
    console.log(greet(g));
}
```

These functions are almost syntactically identical, and they certainly are 
expressing the exact same idea! You just "move the dot around": instead of 
writing...

```
data.behaviour(x, y)
```

... you instead write:

```
behaviour(data, x, y)
```

This is entirely and absolutely superficial, and indeed actually provided as 
syntactic sugar in some languages, like [extension methods][ext-methods] in C#. 
I'll show you an example.

[ext-methods]: https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/extension-methods

Save this to a file called `WhateverJustAFilename.cs`:

```cs
using System;

class Greeter
{
    // Probably needs to be public, otherwise
    // the extension method class can't see it?
    public String phrase;

    public Greeter(String phrase)
    {
        this.phrase = phrase;
    }
}

// Must be static, as demanded by extension methods mechanism.
// Doesn't need to be public, since we're in the same source file.
static class ArbitraryClassName679
{
    // Must be `public static`, as demanded by extension methods mechanism.
    // Notice the `this` in the param list!
    public static String greet(this Greeter g, String suffix)
    {
        return g.phrase + suffix;
    }
}

public class ProgramClassNameWhatever
{
    public static void Main(String[] args)
    {
        Greeter g = new Greeter("Bonjour, mon ami");

        // Notice how the method `.greet()` does not exist
        // in the `Greeter` class, and yet:
        Console.WriteLine(g.greet("."));
        // The same method also works like an ordinary static method:
        Console.WriteLine(ArbitraryClassName679.greet(g, "!!"));
    }
}
```

And by using the Mono C# compiler on Mac OS via Homebrew we can compile and run 
it:

```
$ uname
Darwin

$ brew install mono
    ( ... busy brewing ...)

$ which csc mono
/usr/local/bin/csc
/usr/local/bin/mono

$ vim WhateverJustAFilename.cs
    ( ... copy the above snippet ... )

$ mcs WhateverJustAFilename.cs && mono WhateverJustAFilename.exe
Bonjour, mon ami.
Bonjour, mon ami!!
```

As you can see, there is literally no difference between `g.greet(".")` and 
`ArbitraryClassName679.greet(g, ".")`.

My point of working through this C# example is that there is nothing "magical" 
or extraterrestially weird about the way things can be done in functional 
programming; it is merely a different way to think about, talk about, and 
implement the same ideas as appeared in the OOP version.

## "Dynamic dispatch", the FP way

Let me show you how I would implement the same program in the simplest way I 
know. In FP, functions are data, so let's pass them around:

```typescript
// Interface: a function type, straight-up
type Greeter = () => string;

// Implementation: a function, of course
const frenchGreeter: Greeter = () => "Bonjour";

// Composition
function performGreeting(g: Greeter): void {
    console.log(g());
}

// Invocation
performGreeting(frenchGreeter);
```

Same idea if you have multiple implementations of the same interface that you 
dyndynamically choose:

```typescript
const englishGreeter: Greeter = () => "Hello";

function performGreeting(...) { ... } // unchanged

performGreeting(Math.random() > 0.5 ? frenchGreeter : englishGreeter);
```

And since sometimes, the interface type is so trivial (like in this case), you 
might as well just inline the interface type definition everywhere:

```diff
-type Greeter = () => string;
 
 const frenchGreeter = () => "Bonjour";
 const englishGreeter = () => "Hello";
 
-function performGreeting(g: Greeter): void {
+function performGreeting(greeter: () => string): void {
-    console.log(g());
+    // Since the type is anonymouse now,
+    // we better give the parameter a longer name.
+    console.log(greeter()); 
 }
 
 performGreeting(Math.random() > 0.5 ? frenchGreeter : englishGreeter);
```

## "Dynamic dispatch" is everywhere in FP

If you again step back, you'll realise that... "hang on a minute, **function 
types are naturally polymorphic!**"

And you'd be right. Function-types are naturally interfaces --- clearly any 
function that has the right type ("interface") can be passed into a param that 
expects that type. Dynamic dispatch!

This is probably why programmers from a functional programming background might 
feel rather perplexed at the usage of phrases like "dynamic dispatch" or 
"runtime polymorphism" in the cultural context of OOP:

> Huh? What is the big idea behind such a technical-sounding term?

As it turned out, there was indeed no "big idea"; from a FP programmer's 
perspective, "dynamic dispatch" just means "factoring out a function".

> **Triviality**: Ok sure, sometimes the OOP-style interface type has multiple 
> fields. However, it is trivial to put several functions into a record and pass 
> a value of that record type around. A kind of OOP-style FP. There are no 
> blockers; they are all the same ideas.

This FP implementation gives us inspiration on many potential ways to refactor 
our programs to achieve various goals. For the problem at hand, we seem to want 
to "move the branching outwards". Well, we can just factor the branching out as 
a parameter --- or in other words, we can "parameterise the branching". Let's 
try this idea out.

# Refactoring the ugly UnifiedGreeter

If the original implementation of UnifiedGreeter is causing us problem due to it 
performing some branching internally, we can just mechanically factor it out 
without actually thinking about what we're doing. This does not change the 
semantics of the program because all objects involved are immutable (the 
`FrenchGreeter`/`EnglishGreeter` etc instances), and all functions are pure 
(e.g. the `.greet()` method).

```diff
 class UnifiedGreeter {
     constructor(
-        private readonly frenchGreeter: FrenchGreeter,
-        private readonly englishGreeter: EnglishGreeter,
-        private readonly spanishGreeter: SpanishGreeter,
+        private readonly branch: (l: Language) => Greeter, // Parameterise the branching!
     ) {}
 
     greet(lang: Language): string {
-        switch (language) {
-           case Language.English:
-               return this.englishGreeter.greet();
-           case Language.French:
-               return this.frenchGreeter.greet();
-           case Language.Spanish:
-               return this.spanishGreeter.greet();
-        }
+        this.branch(lang).greet();
     }
 }

+
+const frenchGreeter = new FrenchGreeter();
+const spanishGreeter = new SpanishGreeter();
+const englishGreeter = new EnglishGreeter();
+
+function branch(lang: Language) {
+    switch (lang) {
+        case Language.Spanish:
+            return spanishGreeter;
+        case Language.French:
+            return frenchGreeter;
+        case Language.English:
+            return englishGreeter;
+    }
+}

 const unifiedGreeter = new UnifiedGreeter(
-    new FrenchGreeter(),
-    new EnglishGreeter(),
-    new SpanishGreeter(),
+    branch,
 );

 function performGreeting(lang: Language): void {
     console.log(unifiedGreeter.greet(lang)); 
 }
```

Look at what the `UnifiedGreeter` class is doing: it keeps track of one function 
(namely `branch`), and always directly calls that function. If we try to inline 
everything into the body of `performGreeting`:

```
// original:
console.log(unifiedGreeter.greet(lang))

// inlining the `unifiedGreeter.greet` method definition:
==> console.log(unifiedGreeter.branch(lang).greet())

// inlining the `unifiedGreeter` variable definition:
==> console.log((new UnifiedGreeter(branch)).branch(lang).greet())

// collapsing the attribute-write and attribute-read over the same `branch` attribute:
==> console.log(branch(lang).greet())
```

You'll realise that the need for the `UnifiedGreeter` class can be eliminated 
entirely: we just pass the `branch` function around instead. So now we have 
this:

```typescript
enum Language { ... }

const spanishGreeter = ...
const frenchGreeter = ...
const englishGreeter = ...

function branch(lang: Language) {
    switch (lang) {
        case Language.Spanish:
            return spanishGreeter;
        case Language.French:
            return frenchGreeter;
        case Language.English:
            return englishGreeter;
    }
}

const choice: number = Math.random();
const language: Language =
    choice > 0.8
        ? Language.Spanish
        : ( choice > 0.5
          ? Language.French
          : Language.English
          );

function performGreeting(lang: Language): void {
    console.log(branch(lang).greet()); 
}

performGreeting(language);
```

Let's do a little refactor so that it's easier for me to refer to things:

```diff
-const choice: number = Math.random();
-const language: Language =
-    choice > 0.8
-        ? Language.Spanish
-        : ( choice > 0.5
-          ? Language.French
-          : Language.English
-          );
+function parseLanguage(choice: number): Language {
+    return choice > 0.8
+        ? Language.Spanish
+        : choice > 0.5
+        ? Language.French
+        : Language.English;
+}
+const language: Language = parseLanguage(Math.random());
```

Now the code looks like this:

```typescript
enum Language { ... }

const spanishGreeter = ...
const frenchGreeter = ...
const englishGreeter = ...

function branch(lang: Language) {
    switch (lang) {
        case Language.Spanish:
            return spanishGreeter;
        case Language.French:
            return frenchGreeter;
        case Language.English:
            return englishGreeter;
    }
}

function performGreeting(lang: Language): void {
    console.log(branch(lang).greet()); 
}

function parseLanguage(choice: number): Language {
    return choice > 0.8
        ? Language.Spanish
        : choice > 0.5
        ? Language.French
        : Language.English;
}

// Instead of `performGreeting(parseLanguage(Math.random()))`,
// we're using this variable to isolate the random-number-generation effect.
const choice: number = Math.random();

const language: Language = parseLanguage(choice);
performGreeting(language);
```

So, again if we look at the top-level expression and try inlining things:

```
// original
performGreeting(language)

// inline the `const language` variable definition:
==> performGreeting(parseLanguage(choice)) // const language: Language = parseLanguage(choice);

// inline the `performGreeting` function definition:
==> console.log(branch(parseLanguage(choice)).greet());
```

Now we see this expression `branch(parseLanguage(...))` appear. Let's give this 
hidden function a name, `parseGreeter`:

```typescript
const parseGreeter = (choice: number): Greeter => branch(parseLanguage(choice))
```

or, using TypeScript's `function` keyword syntax instead:

```typescript
function parseGreeter(choice: number): Greeter {
    return branch(parseLanguage(choice));
}
```

What does this `parseGreeter` function do? It seems like it's first parsing some 
number into a data structure, then immediately scrutinising the data structure 
by branching. Intuitively, it seems like it's doing some duplicate work that can 
be cancelled out. Let's slowly work through the logic and see what's going on.

Since both `branch` and `parseLanguage` are pure, we can inline both of them 
without changing our program's behaviour. Let's do `parseLanguage` first:

```typescript
// Just a reminder of how `parseLanguage` is defined:
function parseLanguage(choice: number): Language {
    return choice > 0.8
        ? Language.Spanish
        : choice > 0.5
        ? Language.French
        : Language.English;
}

// Using a shorter param name, `c` for choice:
function parseGreeter(c: number): Greeter {
    return branch(c > 0.8 ? Language.Spanish : c > 0.5 ? Language.French : Language.English);
}
```

Now let's inline `branch`:

```typescript
// Again, reminder of how `branch` is defined:
function branch(lang: Language) {
    switch (lang) {
        case Language.Spanish:
            return spanishGreeter;
        case Language.French:
            return frenchGreeter;
        case Language.English:
            return englishGreeter;
    }
}

function parseGreeter(c: number): Greeter {
    switch (c > 0.8 ? Language.Spanish : c > 0.5 ? Language.French : Language.English) {
        case Language.Spanish:
            return spanishGreeter;
        case Language.French:
            return frenchGreeter;
        case Language.English:
            return englishGreeter;
    }
}
```

Changing the switch statement into a nested `?:` ternary expression so that the 
whole thing is one expression:

```typescript
function parseGreeter(c: number): Greeter {
    return
          ( c > 0.8 ? Language.Spanish
          : c > 0.5 ? Language.French
          : Language.English
          ) === Language.Spanish    // spanish?
        ? spanishGreeter
        : ( c > 0.8 ? Language.Spanish
          : c > 0.5 ? Language.French
          : Language.English
          ) === Language.French     // french?
        ? frenchGreeter
        : englishGreeter;
}
```

Ok I apologise since that is basically a wall of gibberish now. However, if you 
ignore the rest and just look at the sub-expression where I put the `// 
spanish?` comment:

```typescript
( c > 0.8 ? Language.Spanish
: c > 0.5 ? Language.French
: Language.English
) === Language.Spanish    // spanish?
```

This looks interesting. We know this expression will evaluate to `true` if and 
only if the left-hand-side of that `===` evaluates to `Language.Spanish`.

If you think about it, that will happen if and only if `c > 0.8` is true, 
because otherwise you get `Language.French` or `Language.English` instead. That 
means the above sub-expression marked `// spanish?` is always equivalent to this 
one:

```typescript
c > 0.8
```

It makes sense. Try considering the same expression but with different numbers 
and labels:

```typescript
(foo > 100 ? 'large' : foo > 50 ? 'medium' : 'small') === 'large'
```

Now, hopefully, it's entirely clear that the above expression is always 
equivalent to the following:

```typescript
foo > 100
```

Wow, that's a whole layer of crust cancelled out!

If we do the same thing for the sub-expression marked `// french?`, we can 
transform the `parseGreeter` function into this much simpler form:

```typescript
function parseGreeter(c: number): Greeter {
    return
          c > 0.8   // spanish!
        ? spanishGreeter
        : c > 0.5   // french!
        ? frenchGreeter
        : englishGreeter;
}
```

Switching back to the longer parameter name, and reformatting the code:

```typescript
function parseGreeter(choice: number): Greeter {
    return choice > 0.8
        ? spanishGreeter
        : choice > 0.5
        ? frenchGreeter
        : englishGreeter;
}
```

and compare it to the `parseLanguage` function we had earlier:

```typescript
function parseLanguage(choice: number): Language {
    return choice > 0.8
        ? Language.Spanish
        : choice > 0.5
        ? Language.French
        : Language.English;
}
```

You realise that these two functions are nearly identical! The differences are 
almost syntactic:

- Where `parseLanguage` says `Language.Spanish`, `parseGreeter` says `spanishGreeter`.
- Where `parseLanguage` returns a `Language`, `parseGreeter` returns a `Greeter`.

Our intuition was correct!

What this means now, is we can entirely cut out the `enum Language` data 
structure, and directly work with `Greeter` objects instead! The updated code 
looks like this:

```diff
+// The enum is totally gone!
-enum Language { ... } 

 type Greeter = {
     greet: (): string;
 }

 class SpanishGreeter { ... }
 class FrenchGreeter { ... }
 class EnglishGreeter { ... }

 const spanishGreeter = new SpanishGreeter();
 const frenchGreeter = new FrenchGreeter();
 const englishGreeter = new EnglishGreeter();

+// The branch function is also totally removed!
-function branch(lang: Language) {
-    switch (lang) {
-        case Language.Spanish:
-            return spanishGreeter;
-        case Language.French:
-            return frenchGreeter;
-        case Language.English:
-            return englishGreeter;
-    }
-}

-function performGreeting(lang: Language): void {
-    console.log(branch(lang).greet()); 
-}
+// We switch the argument type from the passive `Language` to the active `Greeter`:
+function performGreeting(g: Greeter): void {
+    console.log(g.greet()); // Then use the gree
+}

-function parseLanguage(choice: number): Language {
+// And we apply the insight from our gibberish-unmangling!
+function parseGreeter(choice: number): Greeter {
     return choice > 0.8
-        ? Language.Spanish
+        ? spanishGreeter
         : choice > 0.5
-        ? Language.French
+        ? frenchGreeter
-        : Language.English;
+        : englishGreeter;
 }

 const choice: number = Math.random();

-const language: Language = parseLanguage(choice);
-performGreeting(language);
+performGreeting(parseGreeter(choice));
```

All done!

## 

