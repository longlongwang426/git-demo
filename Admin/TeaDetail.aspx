<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TeaDetail.aspx.cs" Inherits="Admin_TeaDetail" %>

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
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;教师信息</font>
                        </td>
                    </tr>
                </table>
           <asp:DetailsView id="dvTea" runat="server" cellpadding="3"                 bordercolor="#93BEE2" Width="100%"                 AutoGenerateRows="False">
                <FooterStyle HorizontalAlign="Center" />
                <CommandRowStyle BackColor="#337EB8" ForeColor="White" />
                <RowStyle Height="25" />
                <FieldHeaderStyle  Width="25%" HorizontalAlign="Right"/>
                <FooterTemplate>
                    <asp:Button ID="btnEdit" runat="server" CssClass="redButtonCss" Text="编辑" OnClick="btnEditClick" CausesValidation="false"/>
                     <asp:Button ID="btnUpdate" runat="server" CssClass="redButtonCss" Text="更新" OnClick="btnUpdateClick"/>
                    <input id="back" type="button" class="redButtonCss" value="返回" onclick="javascript:if(confirm('确定要返回吗？'))parent.frames['main'].location.href='ManageTe.aspx';else return false;"/>
                </FooterTemplate>
                <Fields>
                   <asp:TemplateField HeaderText="教师编号:">
                     <ItemTemplate><asp:TextBox ID="tbID" runat="server" Text='<%#Eval("TeacherID") %>' ReadOnly="true"></asp:TextBox></ItemTemplate></asp:TemplateField>
                   <asp:TemplateField HeaderText="姓名:"><ItemTemplate><asp:TextBox ID="tbName" runat="server" Text='<%#Eval("TeacherName") %>' ReadOnly="true"></asp:TextBox></ItemTemplate></asp:TemplateField>
       <asp:TemplateField HeaderText="性别:"><ItemTemplate><asp:TextBox ID="tbSex" runat="server" Text='<%#Eval("Sex") %>' ReadOnly="true"></asp:TextBox><asp:RadioButtonList ID="rblSex" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblSexSelectedChanged" AutoPostBack="true" Visible="false">
            <asp:ListItem>男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem></asp:RadioButtonList></ItemTemplate></asp:TemplateField>
                   <asp:TemplateField HeaderText="职称:"><ItemTemplate><asp:TextBox ID="tbPost" runat="server" Text='<%#Eval("Post") %>' ReadOnly="true"></asp:TextBox><asp:DropDownList ID="ddlPost" runat="server" OnSelectedIndexChanged="ddlPostSexSelectedChanged" AutoPostBack="true" Visible="false">
            <asp:ListItem Selected="True">----请选择职称----</asp:ListItem>
            <asp:ListItem>教授</asp:ListItem>
            <asp:ListItem>副教授</asp:ListItem>
            <asp:ListItem>讲师</asp:ListItem>
            <asp:ListItem>助教</asp:ListItem>
            </asp:DropDownList></ItemTemplate></asp:TemplateField>
                   <asp:TemplateField HeaderText="固定电话:"><ItemTemplate><asp:TextBox ID="tbT1" runat="server" Text='<%#Eval("Phone") %>' ReadOnly="true"></asp:TextBox></ItemTemplate></asp:TemplateField>
                   <asp:TemplateField HeaderText="手机号:"><ItemTemplate><asp:TextBox ID="tbT2" runat="server" Text='<%#Eval("Telephone") %>' ReadOnly="true"></asp:TextBox></ItemTemplate></asp:TemplateField>
                   <asp:TemplateField HeaderText="电子邮件:"><ItemTemplate><asp:TextBox ID="tbE" runat="server" Text='<%#Eval("Email") %>' ReadOnly="true"></asp:TextBox></ItemTemplate></asp:TemplateField>
                </Fields>
                <AlternatingRowStyle BackColor="#E8F4FF"/>
            </asp:DetailsView>
    </form>
</body>
</html>
