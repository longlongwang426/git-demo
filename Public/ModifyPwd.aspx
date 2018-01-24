<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ModifyPwd.aspx.cs" Inherits="ModifyPwd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="../css/L.layout.css" type="text/css" rel="Stylesheet" />
    <script language="javascript" type="text/javascript" src="../jquery/jquery.js"></script>
    <script language="javascript" type="text/javascript">
    $(document).ready(function(){
    $("#btnOk").click(function(){
      if($("#tbOldPwd").val()=="")
      {
         alert("请输入旧密码");return false;
      }
      if($("#tbNewPwd").val()=="")
      {
         alert("请输入新密码");return false;
      }
      if($("#tbANewPwd").val()=="")
      {
         alert("请再次输入新密码");return false;
      }
      if($("#tbANewPwd").val()!=$("#tbNewPwd").val())
      {
         alert("请输入相同的新密码");return false;
      }
    });
    $("#back").click(function(){
      if(confirm("确定返回吗？"))
      {
         parent.frames["main"].location.href="../Desktop.aspx";
       }
    })
})
    </script>
    <style type="text/css">
       #back{ margin-left:20px;}
       
       body { color:#006699; font:9px; margin:0;}
        .style1
        {
        	position:relative; top:120px; left:300px;
            width: 400px; height:160px;
            border: 1px solid #6699CC;
            border-collapse:collapse;
        }
        tr td{
            border: 1px solid #93bee2;
	        
        }
        .td1{
            text-align:right; padding-right:10px;
	        width:140px;
        }
        .td2{
            padding-left:10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr height="30">
                <td class="Header">
                    <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;密码修改</font>
                </td>
            </tr>
        </table>
        <div>
            <table class="style1" cellpadding="0" cellspacing="0">
            <tr>
                <td class="td1">原密码：</td>
                <td class="td2">
                    <asp:TextBox ID="tbOldPwd" runat="server" TextMode="Password" 
                        Width="220px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="td1">新密码：</td>
                <td class="td2">
                    <asp:TextBox ID="tbNewPwd" runat="server" TextMode="Password" 
                        Width="220px"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="td1">确认密码：</td>
                <td class="td2">
                    <asp:TextBox ID="tbANewPwd" runat="server" TextMode="Password" 
                        Width="220px"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="2" style="padding-left:120px;"><asp:Button ID="btnOk"  runat="server" CssClass="redButtonCss" Text="确定" onclick="btnOk_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="back" value="取消"  class="redButtonCss"/>&nbsp;</td>
            </tr>
        </table>
        </div>
    </div>
    </form>
</body>
</html>
