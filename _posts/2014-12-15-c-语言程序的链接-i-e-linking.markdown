---
title: C 语言所谓的「链接」(linking)，及其他
wordpress_id: 1271
wordpress_url: http://blog.easoncxz.com/?p=1271
date: '2014-12-15 22:43:44 +1300'
date_gmt: '2014-12-15 10:43:44 +1300'
categories:
- dev
tags:
- C
- linking
comments: []
---
<p>如 <code>man gcc</code> 所说——</p>
<pre><code>When you invoke GCC, it normally does preprocessing, compilation, assembly, and linking.
</code></pre>
<p>当我们 <code>gcc -o main main.c</code> 的时候，其实这四个步骤都执行过了。如果我们想的话，我们可以将这四步<a href="http://labor-liber.org/en/gnu-linux/development/c_several_steps_compilation">分开进行</a>：</p>
<pre><code>gcc -E main.c &gt; main.i
gcc -S main.i  # out comes main.s
gcc -c main.s  # out comes main.o
gcc main.o     # out comes a.out
</code></pre>
<p>这里，<code>main.c</code> 是源文件 (source file), <code>main.i</code> 是预编译后的源文件 (preprocessed source file), <code>main.s</code> 是汇编文件 (assembly file), <code>main.o</code> 是机器码，或称「<a href="https://zh.wikipedia.org/wiki/%E7%9B%AE%E6%A0%87%E4%BB%A3%E7%A0%81">目标代码</a>」 (the so-called "machine code" or "object code"), <code>a.out</code> 是可执行文件 (executable file). （注：其中 <code>.o</code> 和 executable 在 Linux 上往往是所谓的 <a href="https://en.wikipedia.org/wiki/Executable_and_Linkable_Format">ELF (Executable and Linkable Format)</a> -- 咦，<code>readelf</code> 里的 <code>elf</code> 是哪来的呢？）</p>
<p>这大多是早就听说过了的东西了；可是这啥「链接」到底是干啥的？还有，我 <code>#include</code> 进来的不只是头文件 (header files) 吗？怎么看似只有声明（而没有定义）的东西却是能用的？最近，由于工作的需要我接触到了 "DLL" (Dynamical-Link Library, 动态链接库) 这个东西，于是展开了研究「C 语言程序到底是怎么编译的」的一次小旅程。最初的工作需要是「看看这个 DLL 里有什么函数」——因为我猜 DLL 既然是个「库」，它应该有一些函数给我用吧？——然后就止不住地花费了工内工后的各种时间研究之。</p>
<p>首先，我很快地了解到了 Linux 下的 <code>.so</code> 文件在概念上跟 DLL 是一样的，于是我就打算试试自己制作并使用一个自己的 <code>.so</code>. 很快，我找到了<a href="http://www.cprogramming.com/tutorial/shared-libraries-linux-gcc.html">这篇我看了多次的文章(Shared libraries with GCC on Linux)</a> —— 在我的 Linux 机器上，跟着文章的指引，我做出并调用了我的第一个动态链接库。</p>
<p>这「动态链接库」到底怎么个「动态」法呢？——如果我将编译出来的 <code>libfoo.so</code> 改名为 <code>libgood.so</code>, 然后另外编译一个对外公布的 API/接口 和 <code>libgood.so</code> 完全一样，但是内部的实施细节和 <code>libgood.so</code> 完全没有任何关系的某 <code>libbad.so</code>, 将其改名为 <code>libfoo.so</code>, 然后运行我的 <code>main</code>, 会怎么样呢？我试了试，果然，未经重新编译的 <code>main</code> 执行时毫无意见地执行了 <code>libbad.so</code> 里的「恶意」代码。至此，相比我们都明显地感受到「从网上下载 DLL 放到系统目录里」到底是一种什么样的危险行为了吧？</p>
<p>继续关注我的初衷——「这个 <code>.so</code> 提供了些什么函数呢？」——<a href="http://www.linuxquestions.org/questions/linux-general-1/list-library-function-of-a-shared-library-so-438693/">很快</a>，我又发现了 <code>nm</code>, <code>readelf</code>, 和 <code>objdump</code> 这三个命令。（事后发现，三者全是 GNU 在 <code>binutils</code> 里所有提供的。）由于我对我要找的函数的名字有几个猜测，所以在试 <code>nm</code> 的时候，就已经找到了「一部分」（事后证明其实是 <strong>全部</strong> ）我预期中的函数了；<code>readelf</code> 详细的信息也算是确认了我的猜想以及从 <code>nm</code> 那获得的信息。</p>
<p>可是问题来了——为什么我 <code>nm</code> 或者 <code>readelf</code> 一个 <code>.so</code> 文件的时候，会有那么多的「名称」指代着貌似是未定义的东西的呢？——我之前就略为听说过 "symbol table" 这个东西，估计 <code>nm</code> 给的就是我的机器码的 "symbol table" 了吧（如<a href="http://linux.die.net/man/1/nm">其 man page</a> 所言，显然是的）。这「未定义的符号」到底是怎么回事呢？还有，<em>Shared libraries with GCC on Linux</em> 一文里这什么 <code>LD_LIBRARY_PATH</code>, 啥 <code>ld</code>, <code>ldd</code>, <code>gcc</code> 的 <code>-L</code>, <code>-l</code>, <code>-Wl,-rpath=...</code> 又是什么意思呢？我继续研究…</p>
<p>然后我读到了<a href="http://ref.web.cern.ch/ref/CERN/CNL/2001/003/shared-lib/Pr/">这篇文章 (A Quick Tour of Compiling, Linking, Loading, and Handling Libraries on Unix)</a>。虽然其不是讲 C 语言的（而是 C++），并且不知道内容是否和我想了解的一致，但是见到其有使用 <code>nm</code> 等 binutils 的例子、解读，我就读了。顺手也就那我之前的 <code>libgood.so</code>, <code>libbad.so</code> 之类的来试了试。这篇文章里，值得一提的是 C++ 的所谓 "<a href="https://en.wikipedia.org/wiki/Name_mangling">name mangling</a>" -- 这样东西使得阅读 <code>nm</code> 的输出十分困难——幸好 <code>nm</code> 有个 <code>--demangle</code> 的选项。</p>
<p>我然后干脆就补了下「从 .c 到可执行文件」这一路下来我的源文件所经过的各个步骤。没多久我就花了时间读 <code>man gcc</code> -- 事实表明这是十分正确的 —— 关于 <code>gcc</code> <code>-E</code>, <code>-S</code>, <code>-c</code> 的疑问全部打消了，我也见到了我的 <code>.c</code> 编译出来的汇编码——还是稍有激动的一个时刻。既然同一个程序的 5 个不同形态 (<code>.c</code>, <code>.i</code>, <code>.s</code>, <code>.o</code>, executable) 都见识到了，我当然也就用 <code>nm</code> 之类的工具研究了下我的 <code>.o</code>.</p>
<p>情况大概就在这时候明朗起来了。一个函数（或者是其他的什么东西——见 <a href="https://en.wikipedia.org/wiki/Nm_(Unix)">Wikipedia 的 nm 条目</a>）会在 <code>.o</code> 里弄出一个「符号」来；该「符号」的名称与函数（之类的）的名称一样 —— 除非有 name mangling. 我意识到了一个我认为是非常的关键的现象：</p>
<p><strong>我的程序所声明了而未定义的函数都是在「链接」的时候才被决定用于指代哪个函数体定义的！</strong></p>
<p>"linking" 开始之前我的程序以一种什么形态存在呢？——就是 <code>.o</code> 文件了。正如 <code>nm</code> 所会报告，我的 <code>.o</code> 主程序有很多 "undefined" symbols. 看来，「链接」就是一个 <strong>把多个 <code>.o</code> 沿着同样的符号名对接起来</strong> 的过程！</p>
<pre><code>$ vim declares_a_few_functions.h
$ vim in_main_we_use_those_functions_declared_yet_undefined.c
$ vim just_define_those_functions.c
$ gcc -c *.c  # they all compile just fine...
$ gcc -o main *.o  # the linker doesn't complain either!
$ ./main
It works!
</code></pre>
<p>知道了「『链接』其实是沿着 symbol table 把多个 <code>.o</code> 连起来」这码事之后，许多东西都明了起来了——如果一堆 <code>.o</code> 能连得起来没有「漏」（即 undefined symbol)，而且其中有一个 symbol 叫 <code>main</code> 的话，linker 就可以输出一个 executable; 如果这堆 <code>.o</code> 全部都已经连起来了，却还是有「漏」，或者没有定义 <code>main</code>, 那么如果你给个 <code>-shared</code> flag 给 <code>gcc</code> 的话， linker 还是可以输出一个 <code>.so</code> 供你继续拿来「连」其他东西的。<code>-L</code> 就是向 linker 指明「去哪找能连的东西」；<code>-l</code> 就是（还是向 linker） 指明「要连的那捆东西叫什么」；<code>gcc</code> 的 <code>-Wl,-rpath=</code> 选项或者 Linux 的 <code>LD_LIBRARY_PATH</code> 环境变量就是让 linker 在其将输出的 executable/so 里留下话给 loader (i.e. 执行 <code>./main</code> 时加载我们的程序的那个程序）说「去这些目录里找需要的 <code>.so</code>！」；而 <code>ldd</code> 就可以显示一个给定的 executable 里，我们的 linker 到底留了些什么话。</p>
<p>很自然的考虑就是——「显然有些库是自动加载的——那么，它们存在于哪里？？」—— Aha! 这个问题恰恰又指出了 Linux 系统和 C 语言环境紧密的关系——忽然间，<code>/usr/bin/</code>, <code>/usr/lib/</code>, <code>/usr/include/</code> （或者 <code>/bin/</code>, <code>/lib/</code>；还有 <code>/usr/local/bin/</code>, <code>/usr/local/lib/</code>, <code>/usr/local/include/</code>）的意义几乎不言自明了—— <code>include/</code> 就是 <code>gcc</code> 找我们 <code>#include &lt;blahlib.h&gt;</code> （或者 <code>#include "locallib.h"</code> —— 我不是 C 程序员，我分不清）时搜索 <code>blahlib.h</code> 的地方；<code>lib/</code> 就是找 <code>ldd</code> 能显示的 linker 说我们的 executable 所需的 <code>.so</code> 的地方。不如我试一下，把的 <code>libfoo.so</code> 放到 <code>/usr/lib/</code> 里？果然，<code>-L</code>, <code>-Wl,-rpath=</code>, <code>LD_LIBRARY_PATH</code> 都可以省掉了！</p>
<p>如果进一步阅读，想必我们还能不耗太多功夫地搞清楚『「静态库」和「动态库」的区别是什么？』、『为什么我们现在一般使用动态库？』、『<code>.o</code>, <code>.so</code> 还有那些链接顺序的花样？』之类的问题，不过对于我这样一个不是 C 程序员，却又十分困惑「那些什么 <code>strdup</code> 啥的函数到底是哪里来的」的人来讲，这实在算是一片疑惑得到了解答了！我觉得我从此可以愉快地编译自己写的 C 代码了！</p>
<p>相关链接：</p>
<ul>
<li><a href="http://www.cprogramming.com/tutorial/shared-libraries-linux-gcc.html">Shared libraries with GCC on Linux</a></li>
<li><a href="https://en.wikipedia.org/wiki/Nm_(Unix)">nm (Unix) - Wikipedia</a></li>
<li><a href="http://labor-liber.org/en/gnu-linux/development/">Development with GNU/Linux</a></li>
<li><a href="http://ref.web.cern.ch/ref/CERN/CNL/2001/003/shared-lib/Pr/">A Quick Tour of Compiling, Linking, Loading, and Handling Libraries on Unix</a></li>
<li><a href="http://www.lurklurk.org/linkers/linkers.html">Beginner's Guide to Linkers</a></li>
<li><a href="http://pages.cs.wisc.edu/~beechung/ref/gcc-intro.html">Gcc tutorial - Compiling C and C++ Programs</a></li>
<li><a href="http://www.tenouk.com/Bufferoverflowc/Bufferoverflow1c.html">A Compiler, Assembler, Linker &amp; Loader</a></li>
</ul>
