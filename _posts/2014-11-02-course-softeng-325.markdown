---
title: 'Course: SOFTENG 325'
wordpress_id: 1223
wordpress_url: http://blog.easoncxz.com/?p=1223
date: '2014-11-02 21:29:36 +1300'
date_gmt: '2014-11-02 09:29:36 +1300'
categories:
- study
tags: []
comments: []
---
<p>Compulsory course of Part 3, semester 2: SOFTENG 325 - "Software Architecture".</p>
<p>This course is distinctly divided into two parts, one about Java web stuff, and the other about "software engineering" in general, in an academic style. I think the course is badly-named (or badly-designed in general) - the Java web stuff doesn't seem very relevant to "software architecture".</p>
<ul>
<li>Part 1: around Spring Framework
<ul>
<li>Dependency Injection
<ul>
<li>"Dependency Lookup", Inversion of Control</li>
</ul>
</li>
<li>AOP (Aspect-Oriented Programming)
<ul>
<li>Jargon
<ul>
<li>joinpoint</li>
<li>pointcut (a set of joinpoints)</li>
<li>advice</li>
<li>aspect (advice + pointcut)</li>
<li>*advisor</li>
<li>proxy</li>
<li>introduction</li>
</ul>
</li>
<li>AOP with Spring Framework
<ul>
<li>Programmatically</li>
<li>Declaratively</li>
</ul>
</li>
</ul>
</li>
<li>"Distributed Object Middleware" (Java RMI - Java Remote Method Invocation)</li>
<li>web services
<ul>
<li>Really basic TCP, HTTP
<ul>
<li>HTTP methods (aka verbs)</li>
</ul>
</li>
<li>SOAP/WSDL</li>
<li>REST</li>
</ul>
</li>
<li>ORM - Object-Relational Mapping/Mapper
<ul>
<li>Spring DAO (Data Access Objects)</li>
<li>Hibernate</li>
</ul>
</li>
<li>Transactions
<ul>
<li>Various race conditions
<ul>
<li>Lost updates</li>
<li>Inconsistent retrievals</li>
<li>Dirty reads (read before other's commit/abort)</li>
<li>Premature writes (write before other's commit/abort)</li>
<li>"Repeatable read"</li>
<li>"Phantom read"</li>
</ul>
</li>
<li>Serial Equivalence</li>
<li>Locking
<ul>
<li>2-phase locking</li>
<li>exclusive lock</li>
<li>Read-write lock</li>
</ul>
</li>
</ul>
</li>
<li>"Security" (introductory cryptography)
<ul>
<li>Symmetric/Asymmetric key cryptography</li>
<li>digest hashes</li>
<li>certificates and digital signing</li>
</ul>
</li>
<li>Basic concepts of Spring MVC</li>
</ul>
</li>
<li>Part 2: software architecture
<ul>
<li>Quality attributes
<ul>
<li>The 6 system quality attributes:
<ul>
<li>Performance, Availability, Modifiability, Security, Usability, Testability</li>
</ul>
</li>
<li>QAS: Quality attribute scenarios
<ul>
<li>concrete QAS</li>
<li>general QAS</li>
</ul>
</li>
</ul>
</li>
<li>"Structures" (which an achitecture often has many)
<ul>
<li>"Views" of a structure (which a structure often has many)</li>
</ul>
</li>
<li>Common "tactics" for meeting quality requirements
<ul>
<li>(a few tactics for each of the 6 system QAs)</li>
</ul>
</li>
<li>Architectural styles: examples
<ul>
<li>Client/server</li>
<li>Layered, or virtual machine</li>
<li>Pipe and filter</li>
</ul>
</li>
<li>Creating architectures, given quality requirements
<ul>
<li>"ADD" - "Architecture-Driven Design"</li>
</ul>
</li>
<li>Evaluating architectures
<ul>
<li>"ATAM" - "Architecture Trade-off Analysis Method"
<ul>
<li>"Utility tree"</li>
</ul>
</li>
</ul>
</li>
<li>Documenting architectures
<ul>
<li>"ADL" - "Architecture Description Language"</li>
<li>Maybe using UML</li>
<li>Document rationale, to allow for checking the architecture against quality requirements.</li>
<li>"Tailor to" different audiences/stakeholders</li>
</ul>
</li>
<li>Software product lines: designing with variations</li>
<li>"Measuring modifiability"
<ul>
<li>OOP/OOAnalysis/OODesign: semantic coherence reduces potential changes</li>
<li>"CRS" - Class Reachability Set
<ul>
<li>CRSS - CRS size</li>
</ul>
</li>
<li>"SCCS" - Strongly Connected Component Size</li>
<li>"towers" (at some large CRSS value) and "gaps" (between the tower and the vertical axis) (on the "class_count - CRSS value" histogram)</li>
<li>Large dependency cycles</li>
</ul>
</li>
<li>Case study of Cecil, our "learning management system"
<ul>
<li>Examples of usages of tactics to meet quality requirements</li>
</ul>
</li>
</ul>
</li>
</ul>
