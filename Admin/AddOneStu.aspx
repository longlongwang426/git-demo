<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddOneStu.aspx.cs" Inherits="Admin_AddOneStu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
            <link href="../css/L.layout.css" type="text/css" rel="Stylesheet"/>
                <script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
        <style type="text/css">
        body
        {
            margin-left: 0px;
            margin-top: 0px;
            margin-right:0px;
        }
       *{ font-size:"宋体"; font-size:12px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr height="30">
                        <td class="Header">
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;学生信息录入</font>
                        </td>
                    </tr>
                </table>
<table class="GbText" style="BORDER-COLLAPSE:collapse" bordercolor="#93bee2"
					    cellspacing="1" cellpadding="1" width="100%" border="1">
  <tr><td align="right" width="25%">学号*:</td><td><asp:TextBox ID="tbNo" runat="server" Width="338px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ErrorMessage="工资号不能为空" ControlToValidate="tbNo" Display="Dynamic"></asp:RequiredFieldValidator></td></tr>
  <tr bgcolor="#e8f4ff"><td align="right" width="25%">姓名*:</td><td><asp:TextBox ID="tbName" runat="server" Width="338px"></asp:TextBox>
      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ErrorMessage="姓名不能为空" ControlToValidate="tbName" Display="Dynamic"></asp:RequiredFieldValidator></td></tr>
  <tr><td align="right" width="25%">性别:</td><td><asp:RadioButtonList ID="rblSex" runat="server" 
                RepeatDirection="Horizontal">
            <asp:ListItem Selected="True">男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem>
            </asp:RadioButtonList></td></tr>
  <tr bgcolor="#e8f4ff"><td align="right" width="25%">培养层次*:</td><td><asp:RadioButtonList ID="rblLeve" runat="server" 
                RepeatDirection="Horizontal">
            <asp:ListItem Selected="True">本科</asp:ListItem>
            <asp:ListItem>专科</asp:ListItem>
            </asp:RadioButtonList></td></tr>
  <tr><td align="right" width="25%">专业*:</td><td><asp:DropDownList ID="ddlMajor" runat="server"></asp:DropDownList></td></tr>
  <tr bgcolor="#e8f4ff"><td align="right" width="25%">班级:</td><td><asp:TextBox ID="tbClass" runat="server" Width="338px"></asp:TextBox></td></tr>
  <tr><td align="right" width="25%">毕业设计年份*:</td><td><input type="text" id="tYeat" runat="server"   readonly="readonly" onFocus="WdatePicker({startDate:'%y',dateFmt:'yyyy',alwaysUserStartDate:true})"  Width="338px"/></td></tr>
  <tr bgcolor="#e8f4ff"><td align="right" width="25%">固定电话:</td><td><asp:TextBox ID="tbPhone" runat="server" Width="338px"></asp:TextBox>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                ErrorMessage="固定电话的格式不对" ControlToValidate="tbPhone" Display="Dynamic" 
                ValidationExpression="(\(\d{3}\)|\d{3}-)?\d{8}"></asp:RegularExpressionValidator></td></tr>
  <tr><td align="right" width="25%">移动电话:</td><td><asp:TextBox ID="tbTel" runat="server" Width="338px"></asp:TextBox>
      <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ErrorMessage="手机号格式输入有误" ControlToValidate="tbTel" 
                ValidationExpression="0-9]{7}|[0-9]{11}"></asp:RegularExpressionValidator></td></tr>
             <tr bgcolor="#e8f4ff"><td align="right" width="25%">电子邮件:</td><td><asp:TextBox ID="tbEmail" runat="server" Width="338px"></asp:TextBox>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                     ErrorMessage="电子邮件格式输入有误" ControlToValidate="tbEmail" Display="Dynamic"></asp:RegularExpressionValidator></td></tr>
                     <tr><td></td><td><asp:Button ID="btnSave" runat="server"  Text="保存"  CssClass="redButtonCss" 
                             onclick="btnSave_Click" />
                         <input id="back" type="button" class="redButtonCss" value="返回" onclick="javascript:if(confirm('确定要返回吗？'))parent.frames['main'].location.href='ManageStu.aspx';else return false;"/></td></tr>
</table>
    </form>
</body>
</html>
