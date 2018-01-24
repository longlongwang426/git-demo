<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddOneTea.aspx.cs" Inherits="Admin_AddOneTea" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>

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
</head>
<body>
    <form id="form1" runat="server">
    <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr height="30">
                        <td class="Header">
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;教师信息录入</font>
                        </td>
                    </tr>
                </table>
<table class="GbText" style="BORDER-COLLAPSE:collapse" bordercolor="#93bee2"
					    cellspacing="1" cellpadding="1" width="100%" border="1">
  <tr><td align="right" width="25%">工资号*:</td><td>&nbsp;<asp:TextBox 
          ID="tbNo" runat="server" Width="338px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="工资号不能为空" ControlToValidate="tbNo" Display="Dynamic"></asp:RequiredFieldValidator></td></tr>
  <tr bgcolor="#e8f4ff"><td align="right" width="25%">姓名*:</td>
      <td>&nbsp;<asp:TextBox ID="tbName" runat="server" Width="338px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="姓名不能为空" ControlToValidate="tbName" Display="Dynamic"></asp:RequiredFieldValidator></td></tr>
  <tr><td align="right" width="20%">性别:</td><td><asp:RadioButtonList ID="rblSex" runat="server" 
                RepeatDirection="Horizontal">
            <asp:ListItem Selected="True">男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
            </asp:RadioButtonList></td></tr>
  <tr bgcolor="#e8f4ff"><td align="right" width="25%">职称*:</td>
      <td>&nbsp;<asp:DropDownList ID="ddlPost" runat="server">
            <asp:ListItem Selected="True">----请选择职称----</asp:ListItem>
            <asp:ListItem>教授</asp:ListItem>
            <asp:ListItem>副教授</asp:ListItem>
            <asp:ListItem>工程师</asp:ListItem>
            <asp:ListItem>讲师</asp:ListItem>
            <asp:ListItem>助教</asp:ListItem>
            </asp:DropDownList></td></tr>
  <tr><td align="right" width="25%">固定电话:</td><td>&nbsp;<asp:TextBox 
          ID="tbPhone" runat="server" Width="338px"></asp:TextBox>
      </td></tr>
  <tr bgcolor="#e8f4ff"><td align="right" width="25%">移动电话:</td>
      <td>&nbsp;<asp:TextBox ID="tbTel" runat="server" Width="338px"></asp:TextBox>
      </td></tr>
             <tr><td align="right" width="25%">电子邮件:</td><td>&nbsp;<asp:TextBox 
                     ID="tbEmail" runat="server" Width="338px"></asp:TextBox>
               </td></tr>
                     <tr bgcolor="#e8f4ff"><td></td><td><asp:Button ID="btnSave" runat="server"  Text="保存"  CssClass="redButtonCss" 
                             onclick="btnSave_Click" />
                         <input id="Button1" type="button" class="redButtonCss" value="返回" onclick="javascript:if(confirm('确定要返回吗？'))parent.frames['main'].location.href='ManageTe.aspx';else return false;"/></td></tr>
</table>
    </form>
</body>
</html>
