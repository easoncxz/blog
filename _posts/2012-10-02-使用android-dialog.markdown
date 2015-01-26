---
title: 使用Android Dialog
excerpt: "我将假设你已知道：\r\n<ul>\r\n\t<li>Dialog是什么</li>\r\n</ul>\r\n貌似Android要显示Dialog有两个办法：\r\n<ol>\r\n\t<li><code>Activity</code>类中，创建一个 <code>protected
  Dialog onCreateDialog(int id)</code> 方法，然后在<code>Activity</code>内任意位置调用 <code>showDialog(DIALOG_PAUSED_ID);</code> 。这里<code>DIALOG_PAUSED_ID</code>是个<code>int</code>。</li>\r\n\t<li>在任意位置直接就地创建一个<code>Dialog</code>，然后调用其<code>show()</code>方法。"
wordpress_id: 233
wordpress_url: http://blog.easoncxz.com/?p=233
date: '2012-10-02 17:13:14 +1300'
date_gmt: '2012-10-02 05:13:14 +1300'
categories:
- dev
tags:
- Android
- Dialog
comments: []
---
<p>我将假设你已知道：</p>
<ul>
<li>Dialog是什么</li>
</ul>
<p>貌似Android要显示Dialog有两个办法：</p>
<ol>
<li><code>Activity</code>类中，创建一个 <code>protected Dialog onCreateDialog(int id)</code> 方法，然后在<code>Activity</code>内任意位置调用 <code>showDialog(DIALOG_PAUSED_ID);</code> 。这里<code>DIALOG_PAUSED_ID</code>是个<code>int</code>。</li>
<li>在任意位置直接就地创建一个<code>Dialog</code>，然后调用其<code>show()</code>方法。<a id="more"></a><a id="more-233"></a></li>
</ol>
<p>我只成功尝试了方法1，但我不知道这是为什么。两种方法都应该可用。以下是方法1的例子。</p>
<p><code>List.java</code> 的内容：</p>
<pre lang="java" line="1">public class List extends Activity {
    private static final int DIALOG_ID_DELETE = 1;

    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.list);
        showDialog(DIALOG_ID_DELETE);
    }

    @Override
    protected Dialog onCreateDialog(int id) {
        switch (id) {
        case DIALOG_ID_DELETE:
            AlertDialog.Builder builder = new AlertDialog.Builder(List.this);
            builder.setTitle(caption);
            builder.setMessage(R.string.list_alert_Delete_message_row);
            builder.setIcon(android.R.drawable.ic_dialog_alert);
            builder.setPositiveButton(android.R.string.yes,
                    new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            toaster("delete attempted");
                            fillListApprop(mode);
                        }
                    });
            builder.setNegativeButton(android.R.string.no,
                    new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialog, int which) {
                            dialog.dismiss();
                        }
                    });
            return builder.create();
        default:
            Toast.makeText(getApplicationContext(),"something went wrong with the dialog", Toast.LENGTH_SHORT).show();
            return null;
        }
    }

}</pre>
<p>参考：</p>
<ul>
<li><a href="http://developer.android.com/guide/topics/ui/dialogs.html#AlertDialog">Dialogs | Android Developers</a></li>
</ul>
<p>别的参考忘了。</p>
