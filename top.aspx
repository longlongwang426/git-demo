<%@ Page Language="C#" AutoEventWireup="true" CodeFile="top.aspx.cs" Inherits="top" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <script language="javascript" type="text/javascript" src="jquery/jquery.js"></script>
    <script language="javascript" type="text/javascript">
      $(document).ready(function(){
            $("#exit").click(function(){ 
                 parent.close();
            });
            $("#reLogin").click(function(){
              if(confirm("确定重新登录吗？"))
              {
                 top.location.href="Login.aspx";
              }
            });
});</script>
<style type="text/css">
    *{ font-family:"宋体";font-size:12px;margin:0; padding:0;}
    body {background-color:#005076;margin:0; padding:0;}
    #top{background:#005076 url(image/head_meitu_1.jpg) no-repeat; height:90px;}
    #gblink{text-align:right; margin-right:10%;}
    #gblink  p{ margin-top:10px;}
    #gblink a{ color:#fff; text-decoration:none; margin-right:10px;}
    #gblink a:hover{ color:#f00; text-decoration:underline;}
</style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <div id="top">
        <div id="gblink"><p><a href="Desktop.aspx" target="main">我的桌面</a><a href="Public/ModifyPwd.aspx" target="main">修改密码</a><a href="#" id="reLogin">重新登录</a><a href="#" id="exit">退出</a></p>
       </div>
     </div>
    </div>
    </form>
</body>
</html>
 