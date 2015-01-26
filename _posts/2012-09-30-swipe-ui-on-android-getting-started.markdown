---
title: 'swipe UI on Android: getting started'
excerpt: "since ICS, Android has introduced a range of horizontally swiping navigation
  actions. i like them since they look very naturally-sophisticated. as an example
  to get started using all sorts of swiping navigation, this post talks about how
  to use the \"swipe + title strip\" type.\r\n\r\nstuff that help understanding this
  post:\r\n<ul>\r\n\t<li>how to use Fragments (i.e. on honeycomb or higher Androids)</li>\r\n</ul>\r\nwhat
  i want to achieve, is an Activity that shows three screens of UI content that can
  horizontally swipe to replace each other (just like <a title=\"Tasks Free\" href=\"https://play.google.com/store/apps/details?id=ch.teamtasks.tasks\"
  target=\"_blank\"><em>Tasks</em> </a>or <em>Play Store</em>). here, each of these
  screens would be a separate Fragment.\r\n<h4>the general process:</h4>\r\n<ol>\r\n\t<li>create
  a class in your <em>package</em> inside the <em>src</em> folder, and extend <em>FragmentActivity</em></li>\r\n\t<li>create
  a class inside your <em>FragmentActivity</em> subclass, and extend <em>FragmentPagerAdapter </em></li>\r\n\t<li>create
  <em>Fragment</em> classes (i.e. .java files) in your <em>package</em> inside the
  <em>src</em> folder for each \"screen\", and create corresponding <em>layout</em>
  files</li>\r\n\t<li>the <em>layout</em> file for your MainActivity needs to be just
  a <em>PagerTitleStrip</em> inside a <em>ViewPager</em></li>\r\n\t<li>in a method
  of the MainActivity, find the <em>ViewPager</em> in your main layout, then set its
  <em>adapter</em> to be an <em>instance</em> of the <em>FragmentPagerAdapter</em>
  class"
wordpress_id: 143
wordpress_url: http://blog.easoncxz.com/?p=143
date: '2012-09-30 00:11:34 +1200'
date_gmt: '2012-09-29 12:11:34 +1200'
categories:
- dev
tags:
- Android
- ViewPager
comments: []
---
<p>since ICS, Android has introduced a range of horizontally swiping navigation actions. i like them since they look very naturally-sophisticated. as an example to get started using all sorts of swiping navigation, this post talks about how to use the "swipe + title strip" type.</p>
<p>stuff that help understanding this post:</p>
<ul>
<li>how to use Fragments (i.e. on honeycomb or higher Androids)</li>
</ul>
<p>what i want to achieve, is an Activity that shows three screens of UI content that can horizontally swipe to replace each other (just like <a title="Tasks Free" href="https://play.google.com/store/apps/details?id=ch.teamtasks.tasks" target="_blank"><em>Tasks</em> </a>or <em>Play Store</em>). here, each of these screens would be a separate Fragment.</p>
<h4>the general process:</h4>
<ol>
<li>create a class in your <em>package</em> inside the <em>src</em> folder, and extend <em>FragmentActivity</em></li>
<li>create a class inside your <em>FragmentActivity</em> subclass, and extend <em>FragmentPagerAdapter </em></li>
<li>create <em>Fragment</em> classes (i.e. .java files) in your <em>package</em> inside the <em>src</em> folder for each "screen", and create corresponding <em>layout</em> files</li>
<li>the <em>layout</em> file for your MainActivity needs to be just a <em>PagerTitleStrip</em> inside a <em>ViewPager</em></li>
<li>in a method of the MainActivity, find the <em>ViewPager</em> in your main layout, then set its <em>adapter</em> to be an <em>instance</em> of the <em>FragmentPagerAdapter</em> class<a id="more"></a><a id="more-143"></a></li>
</ol>
<h4>explanation:</h4>
<p>from within some of its <em>Override</em>-ed methods, the <em>FragmentPagerAdapter</em> creates and returns <em>Fragment</em> instances to be considered by the ViewPager to be each "screen".</p>
<h4>code example:</h4>
<p>these examples each omitted spec' details.</p>
<p>layout for the MainActivity - "main.xml":</p>
<pre lang="xml" line="1" escaped="true">&lt;android.support.v4.view.ViewPager
    ...
    android:id="@+id/myPager"
    ...&gt;
    &lt;android.support.v4.view.PagerTitleStrip 
        .../&gt;
&lt;/android.support.v4.view.ViewPager&gt;</pre>
<p>Fragment classes - "Frag1.java":</p>
<pre lang="java" line="1">...
public class Frag1 extends Fragment {

	@Override
	public View onCreateView(LayoutInflater li,ViewGroup vg,Bundle bun){
		return li.inflate(R.layout.frag1, vg, false);
	}
}</pre>
<p>MainActivity class - "MainActivity.java":</p>
<pre lang="java" line="1">...
public class MainActivity extends FragmentActivity {
	SectionPagerAdapter mSectionPagerAdapter;
	ViewPager mViewPager;

	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.main);

		mSectionPagerAdapter=new SectionPagerAdapter(getSupportFragmentManager());
		mViewPager=(ViewPager)findViewById(R.id.pager);
		mViewPager.setAdapter(mSectionPagerAdapter);
	}

	public class SectionPagerAdapter extends FragmentPagerAdapter {
		public SectionPagerAdapter(FragmentManager fm) {
			super(fm);
		}

		@Override
		public Fragment getItem(int pos) {
			Fragment mFragment;
			switch (pos) {
			case 0:
				mFragment = new Frag1();
				mFragment.setArguments(null);
				return mFragment;
			case 1:
				mFragment = new Frag2();
				mFragment.setArguments(null);
				return mFragment;
			case 2:
				mFragment = new Frag3();
				return mFragment;
			default:
				return null;
			}
		}

		@Override
		public int getCount() {
			return 3;
		}

		@Override
		public CharSequence getPageTitle(int pos) {
			return getResources().getStringArray(R.array.titles)[pos];
		}
	}
}</pre>
<p>project directory structure:</p>
<pre>...
/src/myPkg/Frag1.java
/src/myPkg/Frag2.java 
/src/myPkg/Frag3.java
/src/myPkg/MainActivity.java
/res/layout/frag1.xml
/res/layout/frag2.xml
/res/layout/frag3.xml
/res/layout/main.xml
...</pre>
<p>that's about it. i'd appreciate you to leave a reply of your result if you try this.</p>
