---
title: "JavaScript: The Hard Parts"
author:
    display_name: Eason Chen
    login: easoncxz
---

JavaScript is a special language. It was designed in a hurry in its early days;
it is an embedded scripting language --- the language itself doesn't even have a
standard module system or standard I/O constructs. On the other hand, it
supports both the object-oriented programming and functional programming
paradigms, is the only language reliably available in web browsers, and got
hugely popular over the last several years.

The unusual thing about JavaScript is that, unlike most if not all of the other
currently-popular OOP-friendly languages, JavaScript uses prototype-based
inheritance, instead of class-based ("classical") inheritance.  JavaScript's
`this` and `new` keywords also mean completely different things as compared to
the same keywords in, say, Java.  For me, when I started learning JavaScript,
these were the hardest parts of JavaScript, so I decided to write this article
to explain how JavaScript's prototypes, `this`, and `new` works.

I'm assuming you are a programmer and know a classical OOP language like Java,
C++, or Python. The version of JavaScript I'm using is [ECMAScript 5][ES5];
however, I am mostly using NodeJS v5.6.0 to check the validity of my examples.

First, in case you haven't used JavaScript much, let's look at a few things you
can (or can't) do in JavaScript.

{% highlight javascript %}
var left = { prop: 'value' };
var right = { prop: 'value' };
var leftRef = left;
console.log(left == right);
// false
console.log(left == leftRef);
// true
console.log(left === leftRef);
// true

var a = [1, 2, 3];
a.forEach(function(e) {
    console.log(e);
});
// 1
// 2
// 3
a.push(4);
console.log(a);
// [1, 2, 3, 4]
[5, 6].forEach(a.push);
// TypeError: Array.prototype.push called on null or undefined
console.log(a);
// [1, 2, 3, 4]

function MyClass(s) {
    this.state = s;
}
MyClass.prototype.tellState = function() {
    console.log("My state is:", this.state);
};
var o = new MyClass(42);
console.log(o.state);
// 42
console.log(o instanceof MyClass);
// true
console.log(o instanceof Object);
// true
o.tellState();
// My state is: 42
{% endhighlight %}

## Prototypes

Ok, so you've already heard about JavaScript's "prototype chain", and how name 
look-up traverses the chain. But how does everything work in concrete terms?

Here are a few prototype-related phrases or keywords:

- "The `[[Prototype]]` property", e.g. as used in the ES5 [spec][Prototype];
- the `__proto__` property on objects, e.g. in [`__proto__` vs. `prototype` in 
  JavaScript (StackOverflow)](http://stackoverflow.com/questions/9959727/proto-vs-prototype-in-javascript);
- the `prototype` property on constructor functions, where
  - "constructor functions" are those functions written to be used with `new`.

It turns out that among the above, `[[Prototype]]` and `__proto__` actually 
refer to the same concept --- the "prototype" of an object, where you can try to 
look properties up in case the object itself doesn't have that property. The 
`prototype` property (of constructor functions, usually), on the other hand, is 
**not** the "prototype" of the object holding that property.

We say an object "has a property" if that property can be found in that object 
or anywhere on that object's prototype chain. We say an object "has an **own** 
property" if we can find that property without traversing the object's prototype 
chain.

To check whether a given object "has a property", we can use `in`:

{% highlight javascript %}
var o = {};
console.log('toString' in o);
// true
console.log(o.toString);
// [Function: toString]
console.log(o.toString());
// [object Object]
{% endhighlight %}

To check whether a given object "has an **own** property", we can use 
`.hasOwnProperty`:

{% highlight javascript %}
var o = {};
console.log(o.hasOwnProperty('toString'));
// false
o.name = "Just A. Object";
console.log(o.hasOwnProperty('name'));
// true
console.log(o.hasOwnProperty('hasOwnProperty'));
// false
{% endhighlight %}

As an aside, `.hasOwnProperty` is available on a fresh, default object because 
`hasOwnProperty` is actually a property of `Object.prototype`, which the 
prototypes of all usual objects are set to.

Since ES5, there are a few nice "meta-programming" functions that allow us to do 
things with the prototypes of objects:

- `Object.create`
- `Object.getPrototypeOf`
- `Object.setPrototypeOf`

See these functions in action here:

{% highlight javascript %}
// Use our new prototype-related functions on ordinary objects:
var o = {};
console.log(Object.getPrototypeOf(o) === Object.prototype);
// true
console.log(o.hasOwnProperty === Object.prototype.hasOwnProperty);
// true

// Define an object which we can use as a prototype:
var p = { name: "I'm the prototype!" };

// Create a new object, and use the argument object as its [[Prototype]]
var c = Object.create(p);

console.log(Object.getPrototypeOf(c) === p);
// true
console.log(Object.getPrototypeOf(Object.getPrototypeOf(c)) ===
    Object.prototype);
// true

// The __proto__ property is what Object.getPrototypeOf reads,
// but is not the recommended way of accessing an object's prototype.
// Use Object.getPrototypeOf instead.
console.log(c.__proto__ === p);
// true

// We can see that `c` inherited a property:
console.log(c.hasOwnProperty('name'));
// false
console.log('name' in c);
// true
console.log(c.name);
// I'm the prototype!

// We can shadow the inherited property:
c.name = "I'm the child!";
console.log(c.name);
// I'm the child!

// If we delete the object's own property, the prototype's one
// will "shine through" again.
delete c.name;
console.log(c.name);
// I'm the prototype!

// We can also forfeit our inheritance.
Object.setPrototypeOf(c, Object.prototype);
console.log('name' in c);
// false

// And to take it further, we can uninherit from Object.prototype too:
Object.setPrototypeOf(c, null);
console.log('hasOwnProperty' in c);
// false
{% endhighlight %}

## Constructor functions

Constructor functions are functions whose author wrote them with the intention 
that the function is called using `new`. For now, let's worry so much about what 
exactly `new` does, but focus on the constructor function and the object it 
"constructs".

{% highlight javascript %}
function Thing() {
}
var t = new Thing();
console.log(t instanceof Thing);
//true
{% endhighlight %}

How does JavaScript work out that `t` is an "instance" of `Thing`? (Whatever 
"instance" means in a class-less, prototype-based language.) It turns out what 
`instanceof` does is to traverse the prototype chain.

{% highlight javascript %}
// Continuing from above snippet,
console.log(Object.getPrototypeOf(t) === Thing.prototype);
// true

// Note that the prototype of `Thing` is **not** `Thing.prototype`
console.log(Object.getPrototypeOf(Thing) === Thing.prototype);
// false

// Instead, since `Thing` is a constructor function, it is a function, and hence
// its prototype is `Function.prototype`:
console.log(Object.getPrototypeOf(Thing) === Function.prototype);
// true

// And hence Thing has properties defined in `Function.prototype`, e.g. "bind":
console.log('bind' in Thing);
// true
{% endhighlight %}

As seen from the above examples, it seems like the `prototype` property on 
constructor functions is more like some sort of meta-data that the mechanism for 
`new` reads off and Does The Right Thing with. If we put some properties into 
`Thing.prototype`, then all `Thing`s will be able to see that property.

{% highlight javascript %}
function Thing() {
}
Thing.prototype.category = "Usual things";
var t = new Thing();
console.log(t.hasOwnProperty('category'));
// false
console.log('category' in t);
// true
console.log(t.category);
// Usual things
{% endhighlight %}

One cool thing is since everything is dynamic, even if we retroactively add new 
properties into the `prototype` property of a constructor function, objects that 
we've already created beforehand using that constructor function can also access 
the new property.

{% highlight javascript %}
// Continuing from the above snippet,
console.log('exists' in t);
// false

// Let's say that things should perhaps by default not exist:
Thing.prototype.exists = false;

console.log('exists' in t);
// true
console.log(t.exists);
// false
{% endhighlight %}

We can also add properties that are functions to `Thing.prototype` to achieve 
very classical-OOP-reminiscient effects:

{% highlight javascript %}
// Continuing from the above snippet,
function isExistant() {
    return this.exists;
}
Thing.prototype.isExistant = isExistant;
console.log(t.isExistant());
// false
{% endhighlight %}

But of course we've jumped the gun --- we still don't know what `this` does yet. 
So let's move on to studying `this`.

## The "this" keyword

If you know about the special `arguments` object available inside function 
definitions, explaining `this` would be a bit easier.

{% highlight javascript %}
function getArgList() {
    return arguments;
}
var args = getArgList('hello?', 'lol');
console.log(args[0]);
// hello?
console.log(args[1]);
// lol
console.log(args.length);
// 2
{% endhighlight %}

The thing to pay attention to here is that the value that is stored in the 
`arguments` object inside the body of a function depends on how the function is 
called. If the function is called with two arguments, then `arguments` will hold 
two things. If the function is called without any arguments, then 
`arguments.length` will be `0`.

Think of `this` as another special variable like `arguments` which:

- is available inside the body of a function, and
- holds a value that is dependent on how the function is called.

Strictly speaking, the `this` keyword holds a value even if it is accessed from 
outside any functions, and there are weird, stupid things like how it sometimes 
refers to the global object, depending on whether "strict mode" is active for 
that context; for now, let's focus on using `this` inside the body of function 
definitions, without strict mode.

The thing about `this` is that its value, instead of depending on the arguments 
that are passed to the function when the function is called, depends on the 
*syntax* of the function call expression. I know, it's weird, right? It makes me 
think a little of dynamically-scoped languages, where what a variable name is 
not looked-up where the function is defined, but rather where it is called. Some 
would call it "[very late binding][late]", where `this` is not bound even at 
run-time, but only bound at call-time. Anyway, let's see some examples.

{% highlight javascript %}
function getThis() {
    return this;
}
console.log(this === getThis());
// (This is weird. In Chrome, it prints true;
//  in NodeJS as a script, it prints false.
//  Let's not worry about it, because that's not how `this` can be useful.)

// Regardless of whether a function's definition uses `this`, we can always
// use it as a property of an object. The property will hold a reference to the
// function.
var o = { g: getThis };
console.log(o.g === getThis);
// true

// If we use a property-lookup dot when calling the function, `this` will be set
// to the object value among whose property we've found the function we're
// calling.
console.log(o === o.g());
// true

// However, the `this` will be lost if we don't call the function in the same
// expression as the one where we looked it up.
var gRef = o.g;
console.log(o === gRef());
// false

// Which is actually obvious if you think about it --- `gRef` and `getThis` is
// actually just two references to the same function, which isn't inherently
// related to any particular object (for the purpose of `this`).
console.log(gRef === getThis);
// true

// It doesn't really matter how the property lookup happened --- with a dot or 
// with square brackets.
console.log(o === o['g']());
// true

// Even if the expression that gave the object where we performed the property 
// (method) look-up isn't even a lvalue (left-hand value), `this` still refers
// to the object that holds the function property we're calling.
function getAnO() {
    return o;
}
console.log(o === getAnO().g());
// true

// Or if we nest objects, `this` is still the object that holds the function 
// property we're calling.
var outer = { inner: o };
console.log(o === outer.inner.g());
// true

// There is no difference in how `this` works between using a pre-defined, named
// function as the property of an object, or to use an anonymous function to 
// define the function property (i.e. method) inside an object literal.
var john = {
    name: 'John',
    selfIntroduce: function() {
        console.log("Hi, I'm " + this.name + ".");
    }
};
john.selfIntroduce();
// Hi, I'm John.

var ben = {
    name: 'Ben',
    selfIntroduce: john.selfIntroduce
};
ben.selfIntroduce();
// Hi, I'm Ben.
{% endhighlight %}

Similar to how we have `Object.create`, `Object.getPrototypeOf` etc. for dealing 
with prototypes, we have the following functions to deal with `this`:

- `Function.prototype.bind`
- `Function.prototype.call`
- `Function.prototype.apply`

These functions basically let you explicity specify which object to pass as 
`this` to a given function.

{% highlight javascript %}
function getThis() {
    return this;
}
var o = {};

// Make a new function whose `this` is always bound to the given object.
// This is like partially applying the `getThis` function with just the `this`
// parameter.
var getThisBoundToO = getThis.bind(o);
console.log(getThisBoundToO() === o);
// true

// `.call` and `.apply` is like immediately calling the function that
// `.bind` returns.
function getName(id) {
    return "Person " + id + ": " + this.name;
}
var john = { name: 'John' };

var getJohnsName = getName.bind(john);
console.log(getJohnsName(1));
// Person 1: John

getName.call(john, 2);
// Person 2: John

getName.apply(john, [3]);
// Person 3: John

getName.bind(john)(4);
// Person 4: John
{% endhighlight %}

I'll leave you to read the docs on MDN for the details of, or difference 
between, `call` and `apply`. I'll also just mention that in ECMAScript 6,
[Arrow Functions][arrow-fn] also gives new ways of dealing with the `this` 
parameter.

By now, we can understand why the example from the very first snippet of this 
post of pushing elements into an array --- where we were trying to pass a method 
of an object as a function to a higher-order function --- didn't work as naively 
expected.

{% highlight javascript %}
var a = [1, 2, 3];
console.log('push' in a);
// true
console.log(a.hasownproperty('push'));
// false
console.log(a.push === Array.prototype.push);
// true

// Here was the unexpected error from before:
[4, 5].forEach(a.push);
// TypeError: Array.prototype.push called on null or undefined

// Now we know that this error is no different from the follow, which
// is clearly nonsense and should be an error (Because `Array` doesn't
// know about particular array instances).
[4, 5].forEach(Array.prototype.push);
// TypeError: Array.prototype.push called on null or undefined

// However, if we perform the property look-up in the same expression
// as calling that function property (i.e. method), the function will
// be able to find the array instance via `this`.
[4, 5].forEach(function(e) {
    // Notice we're immediately calling the function after finding it.
    a.push(e);
});
console.log(a);
// [1, 2, 3, 4, 5]

// Alternatively, we can use our fresh knowledge of the several fancy
// `this`-manipulating functions like `.bind`:
[6, 7].forEach(a.push.bind(a));
console.log(a);
// [1, 2, 3, 4, 5, 6, 0, [6, 7], 7, 1, [6, 7]]
{% endhighlight %}

Oops! It turns out that `Array.prototype.forEach` passes more than
just one argument to its argument function (`Array.prototype.push` in
this case), so `.push` pushed all of those arguments in. For details,
read the docs for `Array.prototype.forEach`.

## The "new" keyword

Now that we know how `this` works, and how prototypes can be set up, we are 
equipped to learn about the mechanism for `new`! What does the `new` keyword do?  
Well, we can just read [section 13.2.2][es-new] of the ES5 spec. (I found this 
when reading StackOverflow about [returning values from constructor 
functions][es-new-so].) I personally think of `new` as just syntactic sugar, 
since its behaviour can be implemented in JavaScript itself. Before we dive deep 
into the quirks and details of `new` as per the spec, here's overly-simple 
implementation of `new` as a JavaScript function, using constructs that we've 
learnt so far, that does what we've seen `new` do so far:

{% highlight javascript %}
function overlySimpleNew(constructor, args) {
    var newObject = Object.create(constructor.prototype);
    constructor.apply(newObject, args);
    return newObject;
}
{% endhighlight %}

This implementation already does a lot of what `new` does. See it in action:

{% highlight javascript %}
// Define a constructor function
function Person(firstName, lastName) {
    this.firstName = firstName;
    this.lastName = lastName;
}
Person.prototype.selfIntroduce = function() {
    console.log("Hi, I'm " + this.firstName + " " + this.lastName + ".");
};

// Use the constructor function with the `new` keyword
var john = new Person('John', 'Doe');
john.selfIntroduce();
// Hi, I'm John Doe.
console.log(john instanceof Person);
// true
console.log('hasOwnProperty' in john);
// true

// Do the same thing with our hand-rolled `overlySimpleNew`:
var ben = overlySimpleNew(Person, ['Ben', 'Smith']);
ben.selfIntroduce();
// Hi, I'm Ben Smith.
console.log(ben instanceof Person);
// true
console.log('hasOwnProperty' in ben);
// true
{% endhighlight %}

Although the above implementation is *about right*, it doesn't do all of what 
the spec specifies. There are many weird, corner cases of how `new` might be 
used that we haven't covered. [Providing A Return Value In A JavaScript 
Constructor][ben-nadel-new] by Ben Nadel demonstrates many of such cases. So 
let's read the spec now, and see how to implement a basically-compliant `new`. 
Go read the spec now: [13.2.2 \[\[Construct\]\]][es-new]. Here's what that 
section says `new` should do, implemented as a function:

{% highlight javascript %}
function BasicallyCompliantNew(constructor, args) {
    var obj = {};
    var prototype = constructor.prototype;
    if (typeof prototype === 'object') {
        Object.setPrototypeOf(obj, prototype);
    } else {
        Object.setPrototypeOf(obj, Object.prototype);
    }
    var result = constructor.apply(obj, args);
    // Functions are objects too.
    if ([ 'object', 'function' ].indexOf(typeof result) >= 0) {
        return result;
    } else {
        return obj;
    }
}
{% endhighlight %}

Basically, as compared to the overly-simple implementation, this 
basically-compliant implementation takes care of the case where the constructor 
function's `prototype` property holds a non-object value (which it usually 
doesn't, because by default it's effectively `Object.create(Object.prototype)`), 
or where the constructor function returns an object value (which is usually 
doesn't, because it doesn't need to return anything).

Read the spec or the code above slowly. Have a think through --- this is all 
there is to `new`.

## Simulating classical OOP

Classical OOP wants the following things:

- Encapsulation
- Inheritance
- Polymorphism

Although there are no notion of "private" object members in JavaScript, by using 
closures cleverly, we can achieve that effect. Since closures are not a 
JavaScript-specific thing, I won't explain it in this post. For some patterns of 
using closures in the context of JavaScript, go read Douglas Crockford's book 
_JavaScript: The Good Parts_.

Polymorphism is obvious. Everything is dynamic, so the dispatch of method-calls 
is dynamic. Duck typing. Yada yada. Easy.

{% highlight javascript %}
[{
    getName: function() {
        return 'John Doe';
    }
}, {
    name: "Ben Smith",
    age: 43,
    getName: function() {
        return this.name;
    },
    selfIntroduce: function() {
        // ...
    }
}].forEach(function(person) {
    // We clearly don't care what is the type of `person`, so long as
    // it has a `name` property that holds a function that returns a
    // string. Which function to dispatch control to is decided at the time
    // the property look-up, which is at run-time.
    console.log(person.getName() + " is here");
};
{% endhighlight %}

The not-so-obvious one of the three OOP things is inheritance --- because, well, 
JavaScript doesn't have classes. Here's how we achieve similar outcomes using 
prototypes and constructor functions:

{% highlight javascript %}
function Thing(state) {
    this.state = state;
}
Thing.prototype.getState = function() {
    return this.state;
};
Thing.prototype.tellState = function() {
    console.log("The state of the thing is:", this.state);
};

var t = new Thing('thing-state');
t.tellState();
// The state of the thing is: thing-state
console.log(t.getState());
// thing-state

// SubThing is meant to be a sub-type of Thing.
function SubThing(state, extraState) {
    // Call the super-class constructor
    Thing.call(this, state);
    this.extraState = extraState;
}

// Specify inheritance relationship by linking up the prototypes.
Object.setPrototypeOf(SubThing.prototype, Thing.prototype);

// We can override (i.e. shadow) methods from the super-class.
SubThing.prototype.tellState = function() {
    console.log("The state of the sub-thing is:",
        this.state, ",", this.extraState);
}

var st = new SubThing('sub-thing-state', 'extra-state');
st.tellState();
// The state of the sub-thing is: sub-thing-state , extra-state
console.log(st instanceof SubThing);
// true
console.log(st instanceof Thing);
// true
console.log(st.getState === Thing.prototype.getState);
// true
{% endhighlight %}

I'm quite new to JavaScript, so I don't know what way of using the 
prototype-related building blocks to simulate classical OOP is more idiomatic. 
For instance, some people seem to prefer something like

{% highlight javascript %}
SubThing.prototype = new Thing();
{% endhighlight %}

... instead of the 

{% highlight javascript %}
Object.setPrototypeOf(SubThing.prototype, Thing.prototype);
{% endhighlight %}

... which I used. My reason for doing what I did is that at time of defining the 
SubThing "class", I may not have enough information to instantiate a Thing, 
depending on what arguments the Thing constructor takes.

The point here is, although the above code sample may not be idiomatic, it 
nonetheless certainly can get the "simulate classical OOP" job done, nicely, 
using JavaScript's prototype mechanisms.

## The end

So there you have it --- an explanation of what I think is JavaScript's hardest 
parts: prototypes, `this`, and `new`. Equipped with this knowledge, you are 
ready to learn all the other parts of JavaScript, like ES6 classes (which are 
allegedly still prototype-based) or ES6 arrow functions (which makes `this` 
different). You are now JavaScript-ready!

[ES5]: http://www.ecma-international.org/ecma-262/5.1/
[Prototype]: http://www.ecma-international.org/ecma-262/5.1/#sec-8.6.2
[late]: http://stackoverflow.com/a/13441628/1349048
[arrow-fn]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Functions/Arrow_functions
[es-new]: http://www.ecma-international.org/ecma-262/5.1/#sec-13.2.2
[es-new-so]: http://stackoverflow.com/a/1978474/1349048
[js-new-quirks]: http://www.bennadel.com/blog/2522-providing-a-return-value-in-a-javascript-constructor.htm
[ben-nadel-new]: http://www.bennadel.com/blog/2522-providing-a-return-value-in-a-javascript-constructor.htm
