---
title: 'GAE& python: getting started'
excerpt: "i have just got in touch with <a title=\"python\" href=\"http://python.org/\"
  target=\"_blank\">python</a>, and am looking for a place to try out some python.
  i thought of <a title=\"Google App Engine\" href=\"https://developers.google.com/appengine/\"
  target=\"_blank\">GAE</a>, and tried getting started. this article shares how i
  got started with GAE with python.\r\n<h4>the general process:</h4>\r\n<ol>\r\n\t<li>install
  python on your computer</li>\r\n\t<li>install the Python SDK for GAE</li>\r\n\t<li>try
  a local Hello World</li>\r\n\t<li>deploy yourHelloWorld to the GAE cloud"
wordpress_id: 156
wordpress_url: http://blog.easoncxz.com/?p=156
date: '2012-09-29 22:15:53 +1200'
date_gmt: '2012-09-29 10:15:53 +1200'
categories:
- dev
tags:
- GAE
- Python
comments: []
---
<p>i have just got in touch with <a title="python" href="http://python.org/" target="_blank">python</a>, and am looking for a place to try out some python. i thought of <a title="Google App Engine" href="https://developers.google.com/appengine/" target="_blank">GAE</a>, and tried getting started. this article shares how i got started with GAE with python.</p>
<h4>the general process:</h4>
<ol>
<li>install python on your computer</li>
<li>install the Python SDK for GAE</li>
<li>try a local Hello World</li>
<li>deploy yourHelloWorld to the GAE cloud<a id="more"></a><a id="more-156"></a></li>
</ol>
<h4>what these things mean:</h4>
<p><em>installing python</em> on your computer means to install an interpreter for python programs (or say, <em>python scripts</em>) on your computer (since python is an interpreted language). or say, "open .py files".</p>
<p>the <em>GAE Python SDK</em> is a set of python programs, along with a GUI, with the purpose of simulating the GAE environment on your local computer, and also to conveniently deploy your app to GAE.</p>
<h4>setup process details:</h4>
<p>install python 2.7 from the python website's <a title="Download Python" href="http://www.python.org/download/" target="_blank">download page</a>.</p>
<p>install the GAE Python SDK from the <a title="GAE downloads" href="https://developers.google.com/appengine/downloads" target="_blank">download page</a>of the GAE site.</p>
<p>now they're set. time to code.</p>
<h4>let's code:</h4>
<p>no explainations in this section, just instructions.</p>
<ul>
<li>create a folder somewhere. this would be your HelloWorld's project folder.</li>
<li>create two files: "youNameIt.py" and "app.yaml".</li>
<li>create the contents of the two files as below.</li>
</ul>
<p>"youNameIt.py":</p>
<pre lang="python" line="1">import webapp2
class MainPage(webapp2.RequestHandler):
    def get(self):
        self.response.headers['Content-Type'] = 'text/plain'
        self.response.write('Hello, webapp2 World!')

myApp = webapp2.WSGIApplication([('/', MainPage)], debug=True)</pre>
<p>note that in the above, "MainPage" don't seem to be alterable.</p>
<p>"app.yaml":</p>
<pre lang="yaml" line="1">application: youNameIt
version: 1
runtime: python27
api_version: 1
threadsafe: true

handlers:
- url: /.*
  script: youNameIt.myApp</pre>
<p>that's it.</p>
<h4>explanation:</h4>
<p>in the above, the "app.yaml" file is a <a title="YAML - Wikipedia, the free encyclopedia" href="http://en.wikipedia.org/wiki/YAML" target="_blank">YAML</a> file that describes the structure of the app, and sort of define handlers to requests. the "youNameIt.py" file is the python script that is to be run by the server's web app infrastructure, e.g. webapp2, when a request triggers a handler defined by "app.yaml".</p>
<h4>test it locally:</h4>
<ul>
<li>start the <em>GAE launcher</em></li>
<li><em>add</em> the existing application</li>
<li>select the item of the youNameIt app in the list</li>
<li>click <em>run</em></li>
</ul>
<p>now visit <a title="localhost" href="http://localhost:8080" target="_blank">http://localhost:8080</a> . hopefully you should see the words "Hello, webapp2 World!" in the browser, indicating an app is now successfully running in your local "GAE emulator".</p>
<p><a href="https://epynza.sn2.livefilestore.com/y1pyDeAYhni2nxu0fLOVmBuGdPSYOzSwp1PkYl5WE6Z2rEHKK1HSMALA-x7pjwVuxLsmhxwPCBoxg1xBK7ZppYLEhf6OFLiraZo/gae-launcher.PNG?psid=1" target="_blank"><img class="alignnone" src="https://epynza.sn2.livefilestore.com/y1pyDeAYhni2nxu0fLOVmBuGdPSYOzSwp1PkYl5WE6Z2rEHKK1HSMALA-x7pjwVuxLsmhxwPCBoxg1xBK7ZppYLEhf6OFLiraZo/gae-launcher.PNG?psid=1" alt="" width="466" height="298" /></a></p>
<h4>deploy it:</h4>
<p>well, given that you have gone through the above, this is fairly easy.</p>
<p>sign up for a developer account at the <a title="Google Developers" href="https://developers.google.com/" target="_blank">Google Developers</a> page. then <em>create</em> a new GAE app in the GAE A<em>dmin Console, </em>whose link is on that page. (or if you couldn't find the link i copied it <a title="Admin Console" href="https://appengine.google.com/" target="_blank">here</a>.)</p>
<p>make sure that the ID (or say, <em>name</em>) of your app is the same in the python script filename, the "app.yaml" content, and the GAE<em> Admin Console</em>. select your app in the list in the GAE launcher window, then click the <em>deploy</em> button. give the password of the Google account which you used to sign up with Google Developers. Google Application Specific Passwords seem to work too.</p>
<h4>done.</h4>
<p>well, hopefully now you can visit youNameIt.appspot.com and see your Hello World running live.</p>
<h4>references:</h4>
<ul>
<li><a href="https://developers.google.com/appengine/docs/python/gettingstartedpython27/">Getting Started: Python 2.7 - Google App Engine — Google Developers</a></li>
<li><a href="http://www.youtube.com/watch?v=j7OQZp2S5pY">01 - Google App Engine for Python - Hello World - YouTube</a></li>
<li><a href="http://www.mkyong.com/google-app-engine/google-app-engine-python-hello-world-example-using-eclipse/">Google app engine Python hello world example using Eclipse</a></li>
<li><a href="http://stackoverflow.com/questions/5211306/google-app-engine-with-python-2-7-couldnotfindmoduleerror">Google App Engine with Python 2.7 - CouldNotFindModuleError - Stack Overflow</a></li>
</ul>
<h4>what could go wrong?</h4>
<p>a lot of things went wrong for me through my attempts; i think listing things that went wrong for me may be helpful. for me:</p>
<ul>
<li>after i first pressed the <em>run</em> button, the <em>GAE launcher</em> didn't let me run my app (though even locally). later i found out a couple of relevant things that might have caused it:
<ul>
<li>which python interpreter installation are you using? i had python 3.2 installed too, and i later found out that python32 kept on being used to run all the scripts, and thus things weren't as expected.</li>
<li>check your PATH. check that the <em>GAE launcher</em>, and your python installation are both listed.</li>
</ul>
</li>
<li>i fixed my PATH so that only python27 is included, but when i pressed the <em>run </em>button, the <em>GAE launcher </em>still didn't let me run my app. then i realized that:
<ul>
<li>in my "app.yaml" file, after "threadable", i wrote "True". however, what i should have written is "true". i found this out by comparing my code and the code i copy and pasted from <a href="https://developers.google.com/appengine/docs/python/gettingstartedpython27/helloworld">Hello, World! - Google App Engine — Google Developers</a>.</li>
</ul>
</li>
<li>well, soon my app was running locally. but when i tried to deploy it to the cloud, i failed.
<ul>
<li>i reckonized that i had an inappropriate global proxy set on my computer. i cancelled the proxy settings, and the uploading went fine.</li>
</ul>
</li>
</ul>
<p>&nbsp;</p>
