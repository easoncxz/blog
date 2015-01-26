---
title: 'Course: SOFTENG 254'
excerpt: "<a href=\"http://web.ece.auckland.ac.nz/uoa/home/about/our-programmes-and-courses/our-courses/softeng-courses\">SOFTENG
  254: Quality Assurance</a>\r\n\r\nThis course is, in my opinion, a typical \"software
  engineering\" course. The main focus is on \"testing\" and \"processes and tools\".\r\n<ul>\r\n\t<li>\"software
  quality assurance\"\r\n<ul>\r\n\t<li>software (everything other than hardware)</li>\r\n\t<li>quality
  (contain no bugs, works properly)\r\n<ul>\r\n\t<li>IEEE terminology\r\n<ul>\r\n\t<li>fault</li>\r\n\t<li>error</li>\r\n\t<li>failure</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n</li>\r\n\t<li>assurance
  (to make sure that quality happens)</li>\r\n</ul>\r\n</li>\r\n</ul>\r\n<h2>testing</h2>\r\n<ul>\r\n\t<li>testing\r\n<ul>\r\n\t<li>what
  are good tests? (increases probability of finding faults)</li>\r\n\t<li>how to come
  up with good tests? (systematically)</li>\r\n\t<li>flowgraph\r\n<ul>\r\n\t<li>coverage</li>\r\n</ul>\r\n</li>\r\n\t<li>white-box
  testing strategies\r\n<ul>\r\n\t<li>path-based testing strategies\r\n<ul>\r\n\t<li>statement
  coverage</li>\r\n\t<li>branch coverage</li>\r\n\t<li>condition coverage</li>\r\n\t<li>path
  coverage (i.e. linear independent path coverage)"
wordpress_id: 872
wordpress_url: http://blog.easoncxz.com/?p=872
date: '2013-11-02 16:58:35 +1300'
date_gmt: '2013-11-02 04:58:35 +1300'
categories:
- study
tags: []
comments: []
---
<p><a href="http://web.ece.auckland.ac.nz/uoa/home/about/our-programmes-and-courses/our-courses/softeng-courses">SOFTENG 254: Quality Assurance</a></p>
<p>This course is, in my opinion, a typical "software engineering" course. The main focus is on "testing" and "processes and tools".</p>
<ul>
<li>"software quality assurance"
<ul>
<li>software (everything other than hardware)</li>
<li>quality (contain no bugs, works properly)
<ul>
<li>IEEE terminology
<ul>
<li>fault</li>
<li>error</li>
<li>failure</li>
</ul>
</li>
</ul>
</li>
<li>assurance (to make sure that quality happens)</li>
</ul>
</li>
</ul>
<h2>testing</h2>
<ul>
<li>testing
<ul>
<li>what are good tests? (increases probability of finding faults)</li>
<li>how to come up with good tests? (systematically)</li>
<li>flowgraph
<ul>
<li>coverage</li>
</ul>
</li>
<li>white-box testing strategies
<ul>
<li>path-based testing strategies
<ul>
<li>statement coverage</li>
<li>branch coverage</li>
<li>condition coverage</li>
<li>path coverage (i.e. linear independent path coverage)<a id="more"></a><a id="more-872"></a></li>
</ul>
</li>
<li>dataflow testing strategies
<ul>
<li>"definition, use, kill"</li>
</ul>
</li>
</ul>
</li>
<li>black-box testing strategies
<ul>
<li>equivalence class/partitioning &amp; boundary value analysis</li>
<li>logic testing</li>
</ul>
</li>
<li>some considerations
<ul>
<li>polymorphism (dynamic binding)</li>
<li>(multiple) inheritance</li>
<li>overriding/overloading</li>
</ul>
</li>
<li>mock testing</li>
</ul>
</li>
<li>measurement
<ul>
<li>attribute ("empirical relationship")</li>
<li>measurement ("representation condition")</li>
<li>metric (the mapping from attribute to "numbers and symbols" which have unitis which have "scales")</li>
<li>scales
<ul>
<li>nominal</li>
<li>ordinal</li>
<li>interval (fixed spacing)</li>
<li>ratio (has "true zero")</li>
<li>absolute (count; is a natural number)</li>
</ul>
</li>
<li>protocol (e.g. "take off your shoes before measuring height")</li>
<li>"entity population model" (e.g. "Is this typical or not?")</li>
</ul>
</li>
<li>software metrics
<ul>
<li>size
<ul>
<li>e.g. LOC, NCLOC, ES (executable statements), "DSI" (delivered source instructions)</li>
</ul>
</li>
<li>complexity
<ul>
<li>e.g. McCabes CCN (Cyclomatic Complexity Number)</li>
</ul>
</li>
<li>test quality
<ul>
<li>TER (test effectiveness ratio) a.k.a. coverage</li>
</ul>
</li>
<li>correctness
<ul>
<li>viz. #(faults)/product_size</li>
</ul>
</li>
</ul>
</li>
</ul>
<h2>processes &amp; tools</h2>
<ul>
<li>processes
<ul>
<li>phases / "software development lifecycles"(SDLC)
<ul>
<li>requirements</li>
<li>design</li>
<li>implementation</li>
<li>testing</li>
</ul>
</li>
</ul>
</li>
<li>adaptive vs. predicative processes
<ul>
<li>waterfall</li>
<li>agile
<ul>
<li>XP</li>
</ul>
</li>
<li>RUP</li>
</ul>
</li>
<li>Capability maturity model (CMM)</li>
<li>modelling
<ul>
<li>overview
<ul>
<li>types of models
<ul>
<li>UI models</li>
<li>architecture models</li>
<li>data models</li>
<li>state transition models</li>
<li>call graphs</li>
<li>dependency graphs</li>
<li>dataflow diagrams &amp; etc.</li>
</ul>
</li>
<li>Domain specific languages (DSL) (e.g. GraphViz)</li>
<li>
<ul>
<li>forward engineering (more-&gt;less abstract)</li>
<li>reverse engineering (less-&gt;more abstract)</li>
<li>re-engineering (reverse-&gt;forward)</li>
<li>round-trip engineering (auto <em>more&lt;-&gt;less abstract</em> synchronously)</li>
</ul>
</li>
<li>
<ul>
<li>model instance (describes data itself)</li>
<li>model (describes structure of data)</li>
<li>metamodel (describes structure of model)</li>
</ul>
</li>
</ul>
</li>
<li>UI modelling
<ul>
<li>screen diagram</li>
<li>tools, e.g. Eclipse*Java "WindowBuilder"</li>
</ul>
</li>
<li>data modelling
<ul>
<li>"analysis data model" (simplified class diagram of data object classes)</li>
<li>design model (has implementation considerations)</li>
<li>tools
<ul>
<li>ObjectAid</li>
<li>Umlet</li>
</ul>
</li>
</ul>
</li>
</ul>
</li>
<li>Version control system (VCS)
<ul>
<li>what, why</li>
<li>"delta encoding", "unified diff format"</li>
<li>centralized VCS vs. distributed VCS</li>
<li>locking vs. merging: "the 'lost update' problem"
<ul>
<li>conflicts
<ul>
<li>textual conflicts</li>
<li>semantic conflicts</li>
</ul>
</li>
</ul>
</li>
<li>Subversion (svn)</li>
<li>"VCS best practices"
<ul>
<li>one change at a time</li>
<li>don't break the build</li>
<li>only the source</li>
<li>meaningful log message</li>
<li>communication still essential</li>
</ul>
</li>
</ul>
</li>
<li>JavaDoc</li>
<li>ANT build tool</li>
<li>reflection
<ul>
<li>structural (i.e. about data/code)</li>
<li>behavioural (i.e. about behaviour/environment)<br />
-</p>
<ul>
<li>introspection</li>
<li>intercession</li>
</ul>
</li>
<li>
<ul>
<li>dynamic</li>
<li>static</li>
</ul>
</li>
<li>metaobject protocols (MOP)
<ul>
<li>metaobjects</li>
<li>metaclasses</li>
</ul>
</li>
<li>in Java</li>
<li>"MetaJ"</li>
</ul>
</li>
<li>generators
<ul>
<li>use cases
<ul>
<li>class extensions</li>
<li>remote method calls</li>
<li>getters/setters</li>
<li>stubs</li>
<li>partial evaluation</li>
</ul>
</li>
<li>Java Emitter Templates (JET)
<ul>
<li>JET directive, JET expression, JET scriptlet</li>
</ul>
</li>
<li>genetator type errors (faults in the generator program or template)</li>
</ul>
</li>
<li>refactoring
<ul>
<li>changes <em>how</em>, not <em>what</em></li>
<li>
<ul>
<li>dead code</li>
<li>clear simple names</li>
<li>maintainability</li>
</ul>
</li>
<li>smells
<ul>
<li>long method</li>
<li>large class</li>
<li>magic number</li>
<li>duplicate code</li>
</ul>
</li>
<li>using Eclipse</li>
</ul>
</li>
<li>modularity
<ul>
<li>seperation of concerns</li>
<li>coupling &amp; cohesion</li>
<li>layerd architecture</li>
</ul>
</li>
<li>to minimize scope, accessibility modifiers</li>
</ul>
