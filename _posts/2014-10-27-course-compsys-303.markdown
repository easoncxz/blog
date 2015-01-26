---
title: 'Course: COMPSYS 303'
wordpress_id: 1217
wordpress_url: http://blog.easoncxz.com/?p=1217
date: '2014-10-27 17:09:11 +1300'
date_gmt: '2014-10-27 05:09:11 +1300'
categories:
- study
tags: []
comments: []
---
<p>Specialisation elective of Part 3, semester 2: COMPSYS 303 - "Microcomputers and Embedded Systems".</p>
<p>Outline:</p>
<ul>
<li>What is an "embedded system"? ("does a specific thing")
<ul>
<li>"IC technologies"</li>
<li>"VLSI" - "Very-Large-Scale Integration"; "ASIC" - "Application Specific Integrated Circuit"; PLD - Programmable Logic Device</li>
<li>Processor techonologies</li>
<li>GPP -General-Purpose Processor; ASIP - Application Specific Instruction-set Processor; Custom processor (i.e. hardware)</li>
</ul>
</li>
<li>concurrency
<ul>
<li>communication/synchronisation methods</li>
<li>single rendez-vous</li>
<li>read-modify-write &amp; test-and-set</li>
<li>bounded/unbounded queue</li>
</ul>
</li>
<li>CHFSM - concurrent, hierarchical FSMs
<ul>
<li>"Synchronous broadcast" </li>
</ul>
</li>
<li>C-to-hardware synthesis
<ul>
<li>C</li>
<li>-> FSMD (FSM with Datapath) (not a flowchart)</li>
<li>-> FSM + Datapath</li>
<li>-> combination + sequential implementation (in VHDL)</li>
</ul>
</li>
<li>"So(P)C" - "System on (Programmable) Chip"
<ul>
<li>Peripherals, bus, bridge</li>
<li>bus arbitratory</li>
<li>bus master/slave</li>
<li>DMA - Direct Memory Access</li>
<li>vectored interrupts vs. fixed interrupts</li>
</ul>
</li>
<li>"design metrics"
<ul>
<li>NRE (Non-Recurring Engineering) cost, unit cost, average cost</li>
</ul>
</li>
<li>A tiny bit of control theory
<ul>
<li>open/closed loop control systems</li>
<li>P, PI, PD, PID controllers</li>
</ul>
</li>
<li>"Industry automation"
<ul>
<li>"PLD" - "Programmable Logic Device"</li>
<li>ladder logic diagrams</li>
</ul>
</li>
</ul>
<p>Also, for the assignments and lab work, there is some programming involved. We had to create a life controller prototype and a traffic light controller prototype, using C, on an Altera DE0 board.</p>
