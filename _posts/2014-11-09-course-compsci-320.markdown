---
title: 'Course: COMPSCI 320'
wordpress_id: 1230
wordpress_url: http://blog.easoncxz.com/?p=1230
date: '2014-11-09 09:49:30 +1300'
date_gmt: '2014-11-08 21:49:30 +1300'
categories:
- study
tags: []
comments: []
---
<p>Specialisation elective of Part 3, semester 2: COMPSCI 320 - "Applied Algorithmics"</p>
<p>This course seems to be a sequel of COMPSCI 220 - "Algorithms and Data Structures". In 220, allegedly, some basic algorithmic concepts (like "big-O" or hash tables) were taught; here in 320, they seem to try to be more systematic, and to give some overview (i.e., some higher level understanding) of those algorithms and stuff from 220, and more.</p>
<ol>
<li>(initial teasers)
<ul>
<li>Review of terminology
<ul>
<li>Big-{ O | Theta | Omega}</li>
<li>Graph jargon</li>
</ul>
</li>
<li>Stable marriage problem: Gale-Shapely algorithm</li>
<li>Graph planarity testing: DMP algorithm</li>
</ul>
</li>
<li>Greedy algorithms
<ul>
<li>examples
<ul>
<li>interval scheduling</li>
<li>shortest path
<ul>
<li>Dijkstra's algorithm, Bellman-Ford algorithm</li>
</ul>
</li>
<li>making change / counting coins</li>
<li>fuelling up gas at various gas stations on a 1-dimension trip</li>
<li>Huffman encoding</li>
</ul>
</li>
<li>proof of correctness
<ul>
<li>"staying ahead", "lower bound constraint", "exchange argument"</li>
<li>modifying the optimal solution to the greedy solution without loss of optimality</li>
</ul>
</li>
</ul>
</li>
<li>Divide and conquer
<ul>
<li>mergesort
<ul>
<li>study of time complexity of recursive algorithms
<ul>
<li>Master Theorem</li>
</ul>
</li>
</ul>
</li>
<li>closest pair of points on a 2-D plane</li>
<li>k-th smallest element in a sequence</li>
<li>matrix multiplication: less than O(n^3), e.g. Strassen algorithm</li>
<li>fast Fourier transform</li>
</ul>
</li>
<li>Dynamic programming
<ul>
<li>the necessary "optimal sub-structure property" of a problem in order for DP to be useful</li>
<li>examples
<ul>
<li>weighted interval scheduling</li>
<li>arbitrary-piece-count piece-wise linear curve-fitting (with more punishment for using more pieces)</li>
<li>knapsack problem (binary version: one of each type of item only)</li>
<li>egg-dropping problem (figure out the "highest safe floor" using minimal number of drops)</li>
<li>"optimal stopping problem": hiring <em>one</em> "good" or "bad" applicant for the remaining time</li>
<li>Floyd's algorithm, Bellman-Ford algorithm</li>
</ul>
</li>
</ul>
</li>
<li>NP-completeness etc.
<ul>
<li>"(polynomial time) reduction" (of problems to other problems)</li>
<li>studied problems (usually reducing among each other):
<ul>
<li>(maximum) independent set (IS)</li>
<li>(minimum) vertex cover (VC)</li>
<li>(minimum) set cover (SC)</li>
<li>constraint satisfaction problem
<ul>
<li>2-SAT, 3-SAT</li>
<li>circuit-SAT</li>
<li>polynomially reducing 3-SAT to IS</li>
</ul>
</li>
<li>subset sum (SS)</li>
</ul>
</li>
<li>decision problems vs. optimization problems: polynomially-reducible to each other</li>
<li>"pseudo-polynomial problems" (e.g., SS): poly on the value, not on the bitstring length</li>
<li>P, NP</li>
<li>NP-completeness</li>
<li>NP, co-NP: on the asymmetry between proving "yes" and "no" for a decision problem
<ul>
<li>primality testing: testing for a number to <em>be</em> prime, then to <em>not be</em> prime
<ul>
<li>in both NP &amp; co-NP</li>
</ul>
</li>
<li>integer factorization: also in both NP &amp; co-NP</li>
</ul>
</li>
</ul>
</li>
<li>Randomized algorithms
<ul>
<li>exercise:
<ul>
<li>simulating a biased coin using a fair coin</li>
<li>simulating a fair coin using a biased coin</li>
</ul>
</li>
<li>categorization:
<ul>
<li>Monte Carlo vs. Las Vegas</li>
<li>biased MC algorithms (e.g. "yes"-biased: if it says yes, it's right.)
<ul>
<li>checking matrix multiplication results, determinant calculations</li>
<li>(biased/"half") primality testing</li>
</ul>
</li>
</ul>
</li>
<li>"p-correct" stochastic algorithm</li>
<li>amplification of stochastic advantage: the signal vs. noise view of random events</li>
<li>multiple-correct-answer problems: correct answers competing among each other while the wrong answer wins</li>
<li>converting between MC &amp; LV algorithms</li>
<li>more complexity classes:
<ul>
<li>ZPP, BPP</li>
<li>RP, co-RP</li>
</ul>
</li>
</ul>
</li>
</ol>
