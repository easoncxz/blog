---
title: Android ContextMenu
excerpt: "i assume that you already know:\r\n<ul>\r\n\t<li>what is a <code>ContextMenu</code></li>\r\n</ul>\r\nthis
  post talks about how to use ContextMenu with a ListView. i have just got started
  with thost by the time of writing this post, and that is all i know about. <strong>but
  it works."
wordpress_id: 217
wordpress_url: http://blog.easoncxz.com/?p=217
date: '2012-10-02 17:53:24 +1300'
date_gmt: '2012-10-02 05:53:24 +1300'
categories:
- dev
tags:
- Android
- ContextMenu
comments: []
---
<p>i assume that you already know:</p>
<ul>
<li>what is a <code>ContextMenu</code></li>
</ul>
<p>this post talks about how to use ContextMenu with a ListView. i have just got started with thost by the time of writing this post, and that is all i know about. <strong>but it works.<a id="more"></a><a id="more-217"></a></strong></p>
<p>inside my <code>Activity</code>'s file <code>List.java</code>:</p>
<pre lang="java" line="1">public class test extends ListActivity {

    public static final int MENU_ITEM_ID_DELETE = 100;
    public static final int MENU_ITEM_ID_RENAME = 200;
    public static final int MENU_ITEM_ORDER_DELETE = 100;
    public static final int MENU_ITEM_ORDER_RENAME = 200;
    public static final int MENU_GROUP_ONLY_ONE = 100;
    private AdapterView.AdapterContextMenuInfo myInfo;
    private ListView lv;
    private String strCaption;

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.list); // using my custom layout
        lv = getListView();
        mySetAnAdapterToListViewMethod(); // details to filling a ListView is omitted
        registerForContextMenu(lv);
    }

    public void onCreateContextMenu(ContextMenu menu, View v,
            ContextMenu.ContextMenuInfo menuInfo) {
        super.onCreateContextMenu(menu, v, menuInfo);
        myInfo = (AdapterView.AdapterContextMenuInfo) menuInfo;
        strCaption = ((TextView) myInfo.targetView).getText().toString();
        menu.setHeaderIcon(R.drawable.myHeaderImage); // using my custom image
        menu.setHeaderTitle(strCaption);
        menu.add(MENU_GROUP_ONLY_ONE, MENU_ITEM_ID_DELETE, MENU_ITEM_ORDER_DELETE, R.string.list_menu_Delete); // using my custom string values
        menu.add(MENU_GROUP_ONLY_ONE, MENU_ITEM_ID_RENAME, MENU_ITEM_ORDER_RENAME, R.string.list_menu_Rename); // using my custom string values
    }

    public boolean onContextItemSelected(MenuItem item) {
        switch (item.getItemId()) {
        case MENU_ITEM_ID_DELETE:
            Toast.makeText(getApplicationContext(), "delete attempted", Toast.LENGTH_SHORT).show();
            break;
        case MENU_ITEM_ID_RENAME:
            Toast.makeText(getApplicationContext(), "delete attempted", Toast.LENGTH_SHORT).show();
        }
        return super.onContextItemSelected(item);
    }

    private void mySetAnAdapterToListViewMethod() {
        // a method to fill the list
    }

}</pre>
<p>the example says it all. as an alternative method that i am not familiar with, seems that the <code>onCreateContextMenu(...)</code> method could use <code>MenuInflater</code> instead of all those <code>menu.blah()</code> methods. something like this: (uncertain)</p>
<pre>MenuInflater inflater=new ...;
inflater.inflate(...);</pre>
<p>could be used to replace all the <code>menu.blah</code> methods.</p>
<h4>reference</h4>
<ul>
<li><a href="http://www.mikeplate.com/2010/01/21/show-a-context-menu-for-long-clicks-in-an-android-listview/">Show a context menu for long-clicks in an Android ListView</a></li>
<li><a href="http://developer.android.com/guide/topics/ui/menus.html#context-menu">Menus | Android Developers</a></li>
<li><a href="http://progrnotes.blogspot.co.nz/2010/10/android-context-menu-in-listview-after.html">Programming notes: Android: Context menu in ListView after clicking</a></li>
</ul>
