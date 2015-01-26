---
title: How OAuth Works
excerpt: "<h1>About this article</h1>\r\nI am writing this because this is what I'd
  like to have found when I'm figuring out how OAuth works. I'm writing in hope that
  it would be helpful to someone, including future-me.\r\n<ul>\r\n\t<li>This article
  shouldn't be specific to Twitter. It's specific to OAuth (1.0a), an should be applicable
  anywhere that is.</li>\r\n\t<li>This article neglects all cryptography or OAuth
  design decisions - those aspects belong in \"Why OAuth Works The Way It Does\" rather
  than in \"How OAuth Works\".</li>\r\n\t<li>This article will not show any code.</li>\r\n</ul>\r\nI
  have found these two articles which helped me quite a lot in understanding OAuth
  - but they're still not exactly what I'd like:\r\n<ul>\r\n\t<li><a href=\"http://marktrapp.com/blog/2009/09/17/oauth-dummies/\">OAuth
  for Dummies | Mark Trapp</a></li>\r\n\t<li><a href=\"http://www.railstips.org/blog/archives/2009/03/29/oauth-explained-and-what-it-is-good-for/\">OAuth
  Explained and What It Is Good For // RailsTips by John Nunemaker</a></li>\r\n</ul>\r\nI
  wanted there to be a storybook-like article with personified characters that represented
  the different parties, and this article is what I came up with. It might not be
  exactly <em>correct</em>, but it should be <em>helpful</em> with understanding. Please
  point me out if and where I'm wrong.\r\n\r\nFor more meta info, go to section \"Background\"
  way down there."
wordpress_id: 989
wordpress_url: http://blog.easoncxz.com/?p=989
date: '2014-02-05 15:54:40 +1300'
date_gmt: '2014-02-05 03:54:40 +1300'
categories:
- dev
tags:
- OAuth
- Twitter
comments: []
---
<h1>About this article</h1>
<p>I am writing this because this is what I'd like to have found when I'm figuring out how OAuth works. I'm writing in hope that it would be helpful to someone, including future-me.</p>
<ul>
<li>This article shouldn't be specific to Twitter. It's specific to OAuth (1.0a), an should be applicable anywhere that is.</li>
<li>This article neglects all cryptography or OAuth design decisions - those aspects belong in "Why OAuth Works The Way It Does" rather than in "How OAuth Works".</li>
<li>This article will not show any code.</li>
</ul>
<p>I have found these two articles which helped me quite a lot in understanding OAuth - but they're still not exactly what I'd like:</p>
<ul>
<li><a href="http://marktrapp.com/blog/2009/09/17/oauth-dummies/">OAuth for Dummies | Mark Trapp</a></li>
<li><a href="http://www.railstips.org/blog/archives/2009/03/29/oauth-explained-and-what-it-is-good-for/">OAuth Explained and What It Is Good For // RailsTips by John Nunemaker</a></li>
</ul>
<p>I wanted there to be a storybook-like article with personified characters that represented the different parties, and this article is what I came up with. It might not be exactly <em>correct</em>, but it should be <em>helpful</em> with understanding. Please point me out if and where I'm wrong.</p>
<p>For more meta info, go to section "Background" way down there.<a id="more"></a><a id="more-989"></a></p>
<hr />
<h1>Prerequisites</h1>
<ul>
<li>You know what "OAuth" refers to, and have used it as a user before, e.g. have clicked a "sign in with twitter" button like the one in <a href="http://attending.io" target="_blank">Attending</a>. If you haven't, go try it out now or see Twitter's <a title="dev.twitter.com" href="https://dev.twitter.com/docs/browser-sign-flow" target="_blank">explanation</a>.</li>
</ul>
<ul>
<li>Learn some words. See the OAuth spec's <a title="oauth.net" href="http://oauth.net/core/1.0a/#anchor3" target="_blank">Definitions</a>. I'll be using them.</li>
</ul>
<h1>The story</h1>
<p style="padding-left: 30px;"><em><strong>Update:</strong> It turned out that this section of my article is really just my own understanding and description of what's described in <a title="oauth.net" href="http://oauth.net/core/1.0a/#anchor9" target="_blank">section 6 of the OAuth 1.0a spec</a> - I'm glad to have found my interpretation to be quite correct!</em><em></em></p>
<p>The Consumer (Attending.io) builds his site. He then goes to the Service Provider (Twitter) and registers himself as a "Consumer" at that service. The Service Provider provides the Consumer with a Consumer Key and a Consumer Secret, which corresponds to that key.</p>
<p>The User visits the Consumer's site. The Consumers's site shows a "sign in with twitter" button, which the User clicks, with the purpose of letting the Consumer interact with the Service Provider on behave of himself. Now, the Consumer needs to do something in response to that click.</p>
<p>The Consumer now contacts the Service Provider, proves who he claims himself to be by using the matching Consumer Key and Consumer Secret, and asks for a Request Token, which comes with a corresponding Request Token Secret.</p>
<p>The Consumer then generates a URL based on the information from the Request Token &amp; Secret, and redirects the User to that URL to authorize the Consumer. With Attending and Twitter, that URL would be to a page managed by Twitter, and is specific to <em>that instance</em> of a request of authentication, <em>that Consumer</em> and <em>that User</em>. Because the purpose of this URL is to authorize, it is called the Authorization URL.</p>
<p>The User now communicates directly with the Service Provider (e.g. after you clicked that button, you're now faced with a webpage with your browser's address bar showing ***.twitter.com/***.). The User says to the Service Provider, "Yep, this dude here is trustworthy. I'd like to give 'em authority to access that part'a my stuff". In response, the Service Provider nods his head, makes a note of the affair, and gives an OAuth Verifier to the User.</p>
<p>The User takes the OAuth Verification, leaves the Service Provider, goes to the Consumer, and says "Yep, it's done. Here's the OAuth Verification" and hands it to him.</p>
<p>The Consumer again grabs the Request Token &amp; Secret together with the OAuth Verification, gives them all to the Service Provider, and ask for an Access Token and its corresponding Access Token Secret. The Service Provider checks to see that all three of the Request Token, the Request Token Secret, and the OAuth Verification actually match, and says "No problem, here are the keys", and finally gives the Consumer the Access Token and its corresponding Access Token Key.</p>
<p>Now is the end of (what I call) an OAuth auth session. With the Access Token &amp; Key, the Consumer is finally authorized by the User to access Protected Resources at the Service Provider. For example, the Consumer might ask "Please go ahead and delete all my User's email", and the Service Provider might do that. Exactly what type (or say, authority level) of access the Consumer is authorized to, is proposed before the OAuth auth session takes place, and is confirmed by the User when he is at the Service Provider's place authorizing the Consumer. The User should be able to make the Service Provider revoke access of a particular Access Token.</p>
<h1>The keys</h1>
<p>Notice how <strong>"Key/Token" &amp; "Secret"</strong> come <em>in pairs</em>. There are 3 pairs in total:</p>
<ol>
<li>the Consumer Key &amp; Secret,</li>
<li>the Request Token &amp; Secret, and</li>
<li>the Access Key &amp; Secret.</li>
</ol>
<p>In addition to those keys/tokens &amp; secrets, Twitter also makes use of something called an "OAuth Verification".</p>
<p>According to my understanding:</p>
<ul>
<li>The Consumer ~ is specific to each, well, Consumer. As long as "that app" is still operated by the same person or team, the Service Provider doesn't need to assign new ~ to "that app".</li>
<li>The Request ~ is generated every time the Consumer needs the User to grant him permission from the Service Provider. Think of the "Request" as an authorization request.</li>
<li>The Access ~ is kept by the Consumer, forever. (If you give someone information, you can ever take it back, right?) The Access ~ may lose effect at the User's wish. After the User revokes it, if he again wants to use the Consumer's app, he will have to go through the authorisation(?) process again to give the Consumer new Access ~.</li>
</ul>
<h1>Done</h1>
<p>That's all. Now, you should be able to read spec and docs and work out <em>how to do stuff</em>, now that you should know most of <em>what needs to be done</em>.</p>
<hr />
<h1>Background</h1>
<p><a title="oauth.net" href="http://oauth.net/" target="_blank">OAuth</a> is not a new thing. I've recently been trying to understand how it works, in <a title="dev.twitter.com" href="https://dev.twitter.com/docs/auth/implementing-sign-twitter" target="_blank">the context of</a> Twitter. (That would be <a title="oauth.net" href="http://oauth.net/core/1.0a/" target="_blank">OAuth 1.0a</a>, because that's <a title="dev.twitter.com" href="https://dev.twitter.com/docs/auth/oauth" target="_blank">what Twitter uses</a>.)</p>
<p>I find it hard to figure out how OAuth works. The resources I find online about OAuth are either <strong>too specific &amp; low-level</strong>, viz. being about the most detailed details of OAuth - e.g. the <a title="oauth.net" href="http://oauth.net/core/1.0a/" target="_blank">OAuth 1.0a spec</a>, or <strong>too abstract &amp; high-level</strong>, viz. whose intended audience seemed to be people who already knows how OAuth works - e.g. the documentation of libraries like <a title="code.google.com" href="https://code.google.com/p/twitter-oauth/" target="_blank">twitter-oauth</a> or <a title="python-twitter" href="https://code.google.com/p/python-twitter/" target="_blank">python-twitter</a> - they straight up refer to OAuth concepts and mention phrases like "access token" without explaining what the concepts mean.</p>
