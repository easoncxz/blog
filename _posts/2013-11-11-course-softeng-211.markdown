---
title: 'Course: SOFTENG 211'
excerpt: "SOFTENG 211 - \"software engineering theory\"\r\n\r\nThis course is inappropriately
  named. To my knowledge, it's better that it's called something like \"discrete mathematics\".
  This course is <a href=\"https://twitter.com/easoncxz/status/396968089671069696\">the
  best course</a> in this semester.\r\n<ul>\r\n\t<li>logic\r\n<ul>\r\n\t<li>propositional
  logic, first-order logic, predicate logic, quantifiers</li>\r\n\t<li>the 16 binary
  boolean operators</li>\r\n</ul>\r\n</li>\r\n\t<li>set theory\r\n<ul>\r\n\t<li>equality\r\n<ul>\r\n\t<li>indiscernability
  of identicals / identity of indiscernables</li>\r\n</ul>\r\n</li>\r\n\t<li>\"pairs\"</li>\r\n\t<li>\"reification\"</li>\r\n\t<li>!!
  \"element of\" being the only predicate needed</li>\r\n\t<li>Zermelo-Fraenkel Set
  Theory\r\n<ul>\r\n\t<li>standard definition of equality</li>\r\n\t<li>axiom of extensionality</li>\r\n\t<li>axiom
  of pairing</li>\r\n\t<li>set comprehension\r\n<ul>\r\n\t<li>Russel's Antinomy -&gt;
  axiom scheme of restricted comprehension"
wordpress_id: 887
wordpress_url: http://blog.easoncxz.com/?p=887
date: '2013-11-11 16:28:11 +1300'
date_gmt: '2013-11-11 04:28:11 +1300'
categories:
- study
tags: []
comments: []
---
<p>SOFTENG 211 - "software engineering theory"</p>
<p>This course is inappropriately named. To my knowledge, it's better that it's called something like "discrete mathematics". This course is <a href="https://twitter.com/easoncxz/status/396968089671069696">the best course</a> in this semester.</p>
<ul>
<li>logic
<ul>
<li>propositional logic, first-order logic, predicate logic, quantifiers</li>
<li>the 16 binary boolean operators</li>
</ul>
</li>
<li>set theory
<ul>
<li>equality
<ul>
<li>indiscernability of identicals / identity of indiscernables</li>
</ul>
</li>
<li>"pairs"</li>
<li>"reification"</li>
<li>!! "element of" being the only predicate needed</li>
<li>Zermelo-Fraenkel Set Theory
<ul>
<li>standard definition of equality</li>
<li>axiom of extensionality</li>
<li>axiom of pairing</li>
<li>set comprehension
<ul>
<li>Russel's Antinomy -&gt; axiom scheme of restricted comprehension<a id="more"></a><a id="more-887"></a></li>
</ul>
</li>
<li>axiom of union</li>
<li>axiom of power set</li>
<li>axiom of infinity</li>
<li>axiom of choice</li>
</ul>
</li>
<li>"functions" - are relations which is left-total and right-unique</li>
<li>Cartesian product</li>
<li>equivalence relation
<ul>
<li>equivalence classes</li>
<li>partition</li>
</ul>
</li>
<li>partial order
<ul>
<li>"strict partial order"?</li>
<li>total order</li>
</ul>
</li>
<li>transitive closure
<ul>
<li>directed acyclic graph</li>
</ul>
</li>
<li>"uniqueness" &amp; "totality" of functions</li>
<li>injectivity, surjectivity, bijectivity</li>
</ul>
</li>
<li>mathmatical induction
<ul>
<li>pigeonhole principle</li>
</ul>
</li>
<li>strings
<ul>
<li>string:= function: N --&gt; alphabet</li>
<li>concatenation</li>
<li>partial evaluation of functions</li>
<li>semigroup, monoid
<ul>
<li>e.g. function compositio</li>
</ul>
</li>
</ul>
</li>
<li>computability
<ul>
<li>Gödel's Incompleteness Theorums (IT1 &amp; IT2)</li>
<li>strings and "languages"</li>
<li>deterministic finite automata
<ul>
<li>pumping lemma</li>
<li>concatenation of languages
<ul>
<li>Mealy+ machines</li>
</ul>
</li>
</ul>
</li>
<li>Turing machines
<ul>
<li>universal Turing machines
<ul>
<li>how it runs over the same tape (like a caterpillar)</li>
<li>algorithm (really just manually simulating a TM)</li>
</ul>
</li>
<li>halting problem, entscheidungsproblem, busy beavers
<ul>
<li>time complexity of UTM (uncomputably steep)</li>
</ul>
</li>
</ul>
</li>
<li>"primitive recursive functions" &amp; others</li>
<li>introducing P &amp; NP problems</li>
<li>other universal computing paradigms
<ul>
<li>Conway's game of life</li>
<li>UTM running on a bintree instead of a linear tape</li>
</ul>
</li>
</ul>
</li>
<li>boolean algebra
<ul>
<li>normal forms (CNF, DNF)</li>
<li>satisfiability(of CNF)/non-validity(of DNF) (hard)</li>
<li>prefix normal form</li>
</ul>
</li>
<li>lambda calculus
<ul>
<li>currying</li>
<li>lambda terms
<ul>
<li>infinite supply (x0, x1, x2, ...)</li>
<li>application</li>
<li>abstraction</li>
</ul>
</li>
<li>free variables vs. bound variables</li>
<li>shadowing</li>
<li>alpha-conversion (renaming a bound variable)</li>
<li>beta-reduction (applying an abstraction)</li>
<li>pairs, and the "True", "False" abstractions(functions)</li>
<li>recursion, and intro to the Y-combinator</li>
<li>evaluation order
<ul>
<li>deterministic strategies
<ul>
<li>applicative order (start with rightmost, innermost)
<ul>
<li>it sometimes loops forever</li>
</ul>
</li>
<li>normal order (start with leftmost, outermost)
<ul>
<li>it sometimes duplicates work (but can be solved by caching,<br />
aka "lazy evaluation")</li>
</ul>
</li>
</ul>
</li>
<li>non-deterministic strategies
<ul>
<li>inherent parallelism</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>counting
<ul>
<li>set, multiset, list, permutation
<ul>
<li>bitstring/signature</li>
</ul>
</li>
<li>some counting principles
<ul>
<li>invariance</li>
<li>disjoint sum</li>
<li>cartesian product</li>
</ul>
</li>
<li>counting "weak compositions" &amp; "compositions"</li>
<li>counting functions f: S -&gt; T, given |S|, |T| (power)
<ul>
<li>counting surjective functions f (Stirling number of the second kind)</li>
</ul>
</li>
</ul>
</li>
<li>graphs
<ul>
<li>directed graph (aka "digraph")</li>
<li>"walk", "path", "cycle"</li>
<li>tree</li>
<li>example: counting binary trees which have n nodes</li>
<li>using transition matrices
<ul>
<li>counting walks
<ul>
<li>using generating functions, on matrices</li>
</ul>
</li>
</ul>
</li>
<li>Eulerian cycles</li>
<li>Hamiltionian cycle</li>
<li>minimum spanning trees
<ul>
<li>Prim's algorithm</li>
<li>Kruskal's algorithm</li>
</ul>
</li>
<li>shortest path
<ul>
<li>Dijkstra's algorithm</li>
</ul>
</li>
</ul>
</li>
<li>using generating functions
<ul>
<li>example: Fibonacci sequence</li>
<li>example: Pascal's triangle (two-param GenFunc) (combinations)</li>
</ul>
</li>
</ul>
