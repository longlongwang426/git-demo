<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SendMessage.aspx.cs" Inherits="Admin_SendMessage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
 <script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
         <link href="../css/L.layout.css" type="text/css" rel="Stylesheet"/>
        <style type="text/css">
       *{ font-size:"宋体"; font-size:12px;}
       body
        {
            margin-left: 0px;
            margin-top: 0px;
            margin-right:0px;
        }
    </style>
    <script language="ecmascript" src="../jquery/jquery.js" type="text/javascript"></script>
      <script language="ecmascript" type="text/javascript">
         $(document).ready(function(){
            $("#btnSend").click(function(){
             if($("#tbTitle").val()=="")
               { alert("公告的标题不能为空");return false;}
          if($("#tbContent").val()=="")
               { alert("公告的内容不能为空");return false;}
              if($("#tYeat").val()=="")
               { alert("毕业设计年份不能为空");return false;}
               });
          $("#btnBack").click(function(){
          if(!confirm("确定返回吗？"))
          {
           return false;
          }
          })
         })
      </script>
</head>
<body>
    <form id="form1" runat="server">
    <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr height="30">
                        <td class="Header">
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;发布公告</font>
                        </td>
                    </tr>
                </table>
    <table><tr><td class="Labelf"><a href="../Public/Message.aspx" style="color:#fff">查看公告</a></td><td class="Labels" id="aWrite" runat="server"><a  href="SendMessage.aspx" style="color:#fff">发布公告</a></td></tr></table>
<table class="GbText" style="BORDER-COLLAPSE:collapse" bordercolor="#93bee2"
					cellspacing="0" cellpadding="0" width="100%" border="1">
  <tr class = "frametr">
        <td  align="right" width="20%" height="30">标题*</td>
       <td>&nbsp;<asp:TextBox ID="tbTitle" runat="server" Width="610px"></asp:TextBox></td>
  </tr>
    <tr bgcolor="#e8f4ff">
         <td  align="right" width="20%" height="30">内容*</td>
         <td height="30" style="padding-top: 5px; padding-bottom: 5px;">&nbsp;<asp:TextBox ID="tbContent" runat="server" TextMode="MultiLine" 
            Height="360px" Width="623px"></asp:TextBox></td>
    </tr>
    <tr>
         <td  align="right" width="20%" height="30">毕业设计年份</td>
         <td>&nbsp;<input type="text" id="tYeat" runat="server"   readonly="readonly" onFocus="WdatePicker({startDate:'%y',dateFmt:'yyyy',alwaysUserStartDate:true})" /></td>
    </tr>
  <tr bgcolor="#E8F4FF">
        <td align="center" colspan="2"><asp:Button ID="btnSend" runat="server" Text="确定"
          CssClass="redButtonCss" onclick="btnSend_Click"/><asp:Button ID="btnBack" runat="server" CssClass="redButtonCss" PostBackUrl="~/Public/Message.aspx" Text="返回"/></td>
   </tr>
</table>
    </form>
</body>
</html>
