<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>毕业设计管理系统</title>
    <script language="javascript" type="text/javascript" src="jquery/jquery.js"></script>
    <script language="javascript" type="text/javascript">
    $(document).ready(function(){
    $("#btnLogin").click(function(){
      if($("#tbName").val()=="")
      {
         alert("请输入用户名");return false;
      }
      if($("#tbPwd").val()=="")
      {
         alert("请输入密码");return false;
      }
    });
        $("#btnExit").click(function(){
        window.close();
    });
})
function btnExit_onclick() {

}

    </script>
    <style type="text/css">
        body{background:#00648B; }
        #image{width:731px; padding:0% 0 0 25%;}
        #btnLogin{width:83px; background:#00648B; color:#fff; font-size:16px;}
         #btnExit{  width:83px; background:#00648B; color:#fff; font-size:16px;}
        .style1
        {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">          
    <div id="image">
                <table cellpadding="5" cellspacing="5" 
                    style="position:relative; top:388px; left:389px; height: 164px;">
     <tr><td colspan="2" class="style1"><asp:TextBox ID="tbName" runat="server" Width="185px" 
             Height="18px"></asp:TextBox></td></tr>
     <tr><td colspan="2"><asp:TextBox ID="tbPwd" runat="server" 
             Width="185px" TextMode="Password"></asp:TextBox></td></tr>
     <tr><td colspan="2"><asp:RadioButtonList ID="rblType" runat="server" RepeatDirection="Horizontal">
             <asp:ListItem  Selected="True">学生</asp:ListItem>
             <asp:ListItem  >教师</asp:ListItem>
             <asp:ListItem>管理员</asp:ListItem>
    </asp:RadioButtonList></td></tr>
    <tr><td><asp:Button ID="btnLogin" runat="server" onclick="btnLogin_Click"  Text="登录"/></td><td><button id="btnExit" onclick="return btnExit_onclick()">退出</button></td></tr>
</table>
            &nbsp;<img src="image/Login_meitu_1.jpg" alt="" /></div>         
    </form>
</body>
</html>
