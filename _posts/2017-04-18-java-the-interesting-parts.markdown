---
title:  "Java: The Interesting Parts"
---

A friend of mine who studies data science has lately been asking me a lot about
some concepts in programming languages and computer systems. Since he hasn't 
studied much programming nor computers earlier, Python, as it was introduced to 
him in his data science courses, was the only language that he knew.  Among the 
curious learners out there like my friend, there are probably people who have 
experience only with a dynamically-typed scripting language like Python, Ruby, 
or JavaScript. They're missing out on some intellectually interesting concepts! 
Now, it wouldn't be a surprise if such interesting concepts would be found in 
languages that are very different from Python, e.g. C or Haskell; however, even 
in a language like Java that has a reputation of being dull and mundane, there 
are nonetheless language features that are treasures for curious minds.

I'm going to assume you already know how to program using simple imperative 
programming constructs like variables and assignment, and that you know some 
basic object-oriented programming concepts like classes, objects, methods etc.

Concepts I'm going to discuss in this article:

- compilation
- types and subtypes
- generics

# Compilation

Programming languages are categorised into [compiled][compiled] languages, and 
[interpreted][interpreted] languages. When you run a Python program, you start a 
process to run the Python interpreter, while pointing the interpreter to your 
source file at the same time. Java, on the other hand, has the somewhat-unusual 
property of being both a compiled language and an interpreted language --- 
because there are two steps. First, you run the Java compiler to compile the 
source code into [JVM byte code][byte-code]; then, you run the Java VM bytecode 
interpreter, while pointing the interpreter to the bytecode we've just compiled.

{% highlight bash %}
$ vim Program.java      # write some code
$ ls static
Program.java
$ javac Program.java    # compile
$ ls
Program.class Program.java
$ java Program          # interpret
Hello world!!

$ vim program.py        # compare with Python...
$ python program.py     # ... where we straight-up interpret the source code.
Hello world!!
{% endhighlight %}

# Types and subtypes

In Java, the variables, instead of the values, have types. The type of the same 
variable will, by definition, remain constant throughout the program. We can't 
assign a value to a variable if their types are not compatible; code wouldn't 
compile.

{% highlight java %}
String s = "hello";
// s = 123;     // would cause compilation error
{% endhighlight %}

If the value is of a type that is a [subtype][subtype] of the type of the 
variable, the assignment is legal.

{% highlight java %}
Animal billy = new Goat();
{% endhighlight %}

Here, `Animal` is called the "base" class or the "parent" class; `Goat` is 
called the "derived" class or the "child" class. We say a Goat "is-a" Animal. 
We say that `Goat` is a "subtype" of the type `Animal`, and `Animal` is a 
"supertype" of `Goat`. As we will see, when we focus on their behaviour when we 
assign values around, we really care more about `Animal` being a _type_ than a 
_class_.

There are two or three ways types can be put into in a subtype relationship:

{% highlight java %}
// in P1.java: when the parent type is a class...
class P1 { /* ... */ }

// in C1.java: ...the child type can be a class.
// This is called "inheritance". C1 "inherits" from P1.
class C1 extends P1 { /* ... */ }

// in P2.java: when the parent type is an interface...
interface P2 {
    void doOneThing();
}

// in C2.java: ... the child type can also be an interface.
// This is usually not called "inheritance", since C2 didn't really
// "inherit" any specific behavious from P2, but rather just demand that
// the implementors of this interface to first say how to `doOneThing`
// before they start to be concerned of how to `doOneMoreThing`.
interface C2 extends P2 {
    void doOneMoreThing();
}

// in Animal.java: when the parent type is an interface...
interface Animal {
    int legCount();
}

// in Goat.java: ... the child type can very often be a class.
// This is what we mean when we say to "implement" an interface.
// We say `Goat` is an "implementation" of the `Animal` interface.
class Goat implements Animal {
    int legCount() {
        return 4;
    }
}
{% endhighlight %}

In the above, `C1` is a subtype of `P1`, `C2` is a subtype of `P2`, and `Goat` 
is a subtype of `Animal`. As such, the following usage of the above types would 
be valid:

{% highlight java %}
boolean probablyNotABird(Animal a) {
    return a.legCount() > 2;
}

// In some other method:
// we pass a Goat-typed value to a method parameter of type Animal!
System.out.println(probablyNotABird(new Goat()));
// true
{% endhighlight %}

Abstractly speaking, `C` should be a subtype of `P` if and only if every 
instance of type `C` could be used anywhere an instance of `P` would. This idea 
was first formulated as the [Liskov substitution principle (LSP)][liskov]. People 
nowadays just say "a `C` *is-a* `P`" in a more casual tone.

As a side note, notice that polymorphism is demonstrated by the call to 
`legCount` inside `probablyNotABird`. Although the variable is of type `Animal`, 
the code that was executed really came from the class `Goat` (hence `4` was 
returned). [Dynamic dispatch][dynamic-dispatch] is another term (which contrasts 
with "static dispatch") that refers to how this decision of "which method's code 
to execute" is made. It's "dynamic" because there are cases where it's 
impossible to know which method's code is going to be executed until we run the 
program (e.g. if the user enters `1` to choose a `Goat`, and `2` to choose a 
`Bird`). This dispatching behaviour is what object-oriented programmers mean 
when they are talking about "polymorphism".  Since in the world of programming 
languages, there are other types of [polymorphisms][polymorphisms], the type 
shown above is called [subtype polymorphism][subtype-polymorphism] to 
distinguish itself from the other types of polymorphism, one of which I will 
discuss in the next section on "generics".

# Generics

"Generics", "generic types", "parameterised types" are all talking about the 
same concept related to syntax that looks like this: `List<T>`.

Once upon a time, back in the Java 1.5 days if I recall correctly, Java had no 
generics. A `List` is just a `List`, containing `Object`s, like Python's lists 
do.

{% highlight java %}
List l = new ArrayList();   // List is an interface; ArrayList is one of the implementations.
l.add(new Goat());
System.out.println(l.size());
// 1
// Goat billy = l.get(0);   // wouldn't compile...
Object billyO = l.get(0);   // ... because a List is a list of `Object`s.
Goat billy = (Goat) billyO; // Explicit type-casting is needed to get a `Goat` back.
System.out.println(billy.legCount());
// 4

// However, lists are heterogenous: they can contain elements of different types.
// This is because almost every type is a subtype of `Object`.
// (Primitive types like `int` are the exceptions.)
// Therefore we can add a flower to the list that already has a goat.
l.add(new Sunflower());

// Things can very well go wrong when we cast:
Goat bob = (Goat) l.get(1);        // Is a sunflower a goat??
// ClassCastException thrown here!

// Therefore, Java needed to provide us with an operator, `instanceof`, to let 
// us check that things are safe to do:
boolean isGoat = l.get(1) instanceof Goat;
System.out.println(isGoat);  // Remember it's a sunflower there.
// false
{% endhighlight %}

Since the definition and behaviour of a list doesn't actually depend on the type 
of the elements it contains, and we'd like to enforce and know that some one 
type is the only type whose elements may be in a given list, generics was 
introduced to Java. It's a great feature, and it's used everywhere by now.

The idea is to not think of `List` as a type, but rather something that can 
_produce_ a type, *if you give it another type as a parameter*. The syntax is 
like `List<T>`, where `List` is called a "raw type", `List<T>` is called a 
"parameterised type", and `T` is called a "type parameter". When we want to 
"instantiate a generic type" to get a parameterized type back, we pass a "type 
argument" to the type parameter. I think the terms are unnecessarily 
complicated, but at least the ideas are coherent. If you are interested in 
rigorously using the correct terms, refer to [Oracle's Java tutorial on 
generics][oracle-generics].

{% highlight java %}
// The type parameter for ArrayList can be inferred:
List<Animal> animalList = new ArrayList<>();

// This is totally fine. Remember the Liskov substitution principle?
// A child instance can be used anywhere a parent instance is expected;
// it is no exception here.
animalList.add(new Goat());

// animalList.add(new Integer(42));     // wouldn't compile.
// We've told Java that we only want `Animal` instances in the list `animalList`.

// At compile time, we cannot be sure of what animal we may get out of this list.
// It could be a bird, a fish, a mammal. Any subtype of Animal is possible.
Animal maybeABird = animalList.get(0);

// The instance will, of course, behave depending on what type of animal
// it actually is at runtime. And a `Goat` is, truely, `probablyNotABird`.
System.out.println(probablyNotABird(maybeABird));
// true
{% endhighlight %}

The syntax for defining a generic type looks like this:

{% highlight java %}
// A generic type, `List`.
interface List<T> {     // Introducing the formal type-parameter `T`.
    // Using the formal type-parameter `T` defined above:
    void add(T t);
    T get(int index);
}
{% endhighlight %}

It's also possible for not an entire class to be parameterised over a type, but 
instead only a single method inside a non-generic class. The syntax looks like 
this:

{% highlight java %}
// Not a generic class:
class ListReader {
    public static  // This is where to put these keywords, if you want them.
    <E>     // Introducing the formal type-parameter `E`.
    E       // The return type.
    lastElementOf(List<E> l) {  // Using the formal type-parameter `E`.
        return l.get(l.size() - 1);
    }

    // The scope of a type-parameter is within the generic method,
    // hence we can use another type variable in this method that
    // incidentally is also called `E`, just like the other method.
    static <E> E firstElementOf(List<E> l) {
        return l.get(0);
    }
}
{% endhighlight %}

These two methods above are examples of [parametric 
polymorphism][parametric-polymorphism], in the sense that these methods can deal 
with all kinds of lists: lists of integers, lists of strings, lists of animals 
etc. We can say that these methods are "polymorphic". We might also say that 
generic types are also, in a similar idea to generic methods, "polymorphic". 
Parametric polymorphism happens to be a very popular concept in functional 
programming, to the point where if a functional programmer was talking to you 
about "polymorphism", parametric polymorphism is probably what they meant.

Notice that we won't "lose precision" when using generics. The type that comes 
out is exactly the type that goes in, instead of some supertype or subtype of 
it.

{% highlight java %}
// Subtyping:
Animal a = new Goat();
// and now you can't use some hypothetical `double hornLength()` defined in `Goat`,
// because what you have is an `Animal`, which doesn't necessarily have horns.

// Generics:
List<Goat> goats = new ArrayList<>();
goats.add(new Goat());
Goat billy = ListReader.firstElementOf(goats);  // Compiles!
// Notice how we didn't need to explicitly tell the `ListReader` what the
// actual type parameter `E` is, since Java is able to infer that.
// The formal parameter was a `List<E> l`; the actual parameter was some
// `List<Goat> goats`, so while `l` now refers to the same list as `goats` does,
// `E` is also the same type that `Goat` is.
{% endhighlight %}

If we have a type parameter that can't be inferred from the type of
the method arguments, Java will try using the return type, by inspecting the 
type of the variable we're trying to assign the method's return value to.

{% highlight java %}
class EmptyThings {
    static <E> List<E> emptyList() {
        return new ArrayList<>();
    }
}

// In some other method:
List<Animal> animals = emptyList();     // `E` inferred to be `Animal`
animals.add(new Goat());
{% endhighlight %}

In case Java can't infer the type parameter (be it due to the program's 
ambiguity or the compiler's incompetence), we will need to use a [rather uncommon 
syntax][explicit-type-param] to explicitly pass the type parameter. We can also 
choose to use the syntax even when it's not necessary.

{% highlight java %}
// This is how we (unnecessarily) pass `Animal` has a type parameter:
List<Animal> animals = EmptyThings.<Animal>emptyList();
{% endhighlight %}


# When subtyping meets generics

Interesting things happen when we use generics and subtypes together. For 
convenience, let me use `C < P` to denote that `C` is a subtype of `P` (think 
"the child is smaller than the parent").

{% highlight java %}
List<Animal> animals = new ArrayList<Goat>();  // wouldn't compile
// despite that Goat < Animal and also ArrayList < List.

// In fact, the following still wouldn't compile,
// despite that List = List:
List<Goat> goats = new ArrayList<>();   // ArrayList<Goat> inferred
List<Animal> animals = goats;
{% endhighlight %}

Let me convince you that it is sensible for Java to reject the above programs. 
Let's look at something subtle you could do if Java had let you compile the code 
above:

{% highlight java %}
// Remember that assigning a list to another list is merely copying a reference;
// there is still only the one list in memory. For this reason, mutations made 
// to the copied reference will be seen from the original reference.
List<Integer> xs = new ArrayList<>();   // ArrayList<Integer> inferred
System.out.println(xs.size());
// 0
List<Integer> xsRef = xs;
xsRef.add(42);      // mutation via new reference
System.out.println(xs.size());  // effect seen via old reference
// 1


// Now, with subtyping involved...
List<Goat> goats = new ArrayList<>();   // ArrayList<Goat> inferred
System.out.println(goats.size());       // Initially the list is empty
// 0

// Now, this wouldn't normally be legal, but let's suppose it is...
List<Animal> animals = goats;
// Remember that no new list is created in memory;
// we're just copying a reference.

Animal mel = new Snake();       // Reasonable, since Snake < Animal
animals.add(mel);               // Mutation!
System.out.println(animals.size()); // Effect seen from new reference.
// 1
System.out.println(goats.size());   // Effect seen from old reference.
// 1

// Now the problematic bit:
Goat billy = goats.get(0);
// Considering runtime and compile-time respectively:
// Do we now have a Goat or a Snake?
{% endhighlight %}

We clearly have gotten ourselves into an absurd situation. We know at 
compile-time that `goats` has clearly always been a list of `Goat`s, with none 
of that forceful and unsafe type-casting business involved. When we retrieved 
the 0-th element from it though, we still ended up having something that has no 
way of being a `Goat`, since might actually be a `Snake`!

To deal with these issues, the language feature in Java is called "bounded 
generics", which uses the syntax `List<? extends T>` or `List<? super T>`.  Here 
we can see the two keywords `extends` and `super` being given new usages on top 
of their more traditional role in the class hierarchy. "Constrained generics" 
and "bounded type parameters" are also recognisable ways to refer to the same 
language feature. The term "bounded type parameters" is also mentioned in the 
generics [tutorial][oracle-generics] from Oracle that I mentioned earlier.  
Bounded generics is based on a more rudimentary feature called "wildcard 
generics" (also mentioned in the tutorial) which uses the more rudimentary 
syntax `List<?>`. With wildcard and bounded generics, we can do things like the 
following:

{% highlight java %}
int listLength(List<?> listOfUnknowns) {
    // Here we don't need to care about what the unknown type is,
    // so it's ok that it remains unknown.
    return listOfUnknowns.size();
}

boolean headIsNotNull(List<?> listOfUnknowns) {
    // `Object` is the only legal type to collect the return value with.
    // This is because we don't know what the list type-parameter is,
    // but an instance of any type is nonetheless always an instance of `Object`.
    Object o = listOfUnknowns.get(0);
    return o != null;
}

void feedMammals(
    // Anything that is a Mammal may need feeding. (e.g. a goat)
    Iterable<? extends Mammal> mammals,

    // A feeder for anything that a `Mammal` is is ok. (e.g. a feeder for `Animal`s)
    Consumer<? super Mammal> feeder) {
    for (Mammal m : mammals) {
        feeder.accept(m);  // feed the Mammal `m`
    }
}

// When we call the method, we may have more specific mammals or feeders:
Iterable<Goat> goats = allMyGoats();    // Assume there to be some `allMyGoats` method.
Consumer<Animal> animalFeeder = makeAnimalFeeder(); // Assume some `makeAnimalFeeder`.
feedMammals(goats, animalFeeder);       // Compiles!
// Animal-feeders can feed any animal;
// in particular, it can feed Mammals, which goats are!
{% endhighlight %}

The types [Iterable][Iterable] and [Consumer][Consumer] are not hypothetic.

There are a lot more intricasies about the intersection of subtype polymorphism 
and parameteric polymorphism. The two scary-sounding concepts in C#, 
"[covariance and contravariance][co-contra]" is exactly there to deal with those 
intricasies.

# That's all!

The above is my pick of some of the most interesting features in Java, from a 
programming language point of view. As we can see, when you start looking into 
it, even a language that is "dull" and "boring" might have features that are 
quite intellectually sophisticated. I believe the features I've mentioned above 
simply have no analogue at all in the the world of dynamically-typed scripting 
languages like Python. Learning languages is great fun, and there's usually 
something special and worth learning about in each language out there. I hope 
that this article has given you some new ideas to think about, and perhaps a bit 
of motivation and curiosity to look for other interesting features in various 
languages. Until next time!

[compiled]: https://en.wikipedia.org/wiki/Compiled_language
[interpreted]: https://en.wikipedia.org/wiki/Interpreted_language
[liskov]: http://wiki.c2.com/?LiskovSubstitutionPrinciple
[polymorphisms]: https://en.wikipedia.org/wiki/Polymorphism_(computer_science)
[dynamic-dispatch]: https://en.wikipedia.org/wiki/Dynamic_dispatch
[oracle-generics]: https://docs.oracle.com/javase/tutorial/java/generics/index.html
[explicit-type-param]: http://stackoverflow.com/questions/15629552/uses-for-the-strange-looking-explicit-type-argument-declaration-syntax-in-java
[subtype-polymorphism]: https://en.wikipedia.org/wiki/Subtype_polymorphism
[parametric-polymorphism]: https://en.wikipedia.org/wiki/Parametric_polymorphism
[co-contra]: https://msdn.microsoft.com/en-us/library/mt654055.aspx
[Iterable]: https://docs.oracle.com/javase/8/docs/api/java/lang/Iterable.html
[Consumer]: https://docs.oracle.com/javase/8/docs/api/java/util/function/Consumer.html
