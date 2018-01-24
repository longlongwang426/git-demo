<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MInfor.aspx.cs" Inherits="Admin_MInfor" %>

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
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;个人信息管理</font>
                        </td>
                    </tr>
                </table>
                <div>
    <asp:DetailsView ID="dvManage" runat="server" cellpadding="3" bordercolor="#93BEE2" Width="100%" AutoGenerateRows="False">
                <FooterStyle HorizontalAlign="Center" />
                <CommandRowStyle BackColor="#337EB8" ForeColor="White" />
                <RowStyle Height="25" />
                 <FieldHeaderStyle Width="25%" HorizontalAlign="Right"/>
                                <AlternatingRowStyle BackColor="#E8F4FF"/>
                <FooterTemplate>
                    <asp:Button ID="btnEdit" runat="server" CssClass="redButtonCss" Text="编辑" OnClick="btnEditClick" CausesValidation="false"/>
                     <asp:Button ID="btnUpdate" runat="server" CssClass="redButtonCss" Text="更新" OnClick="btnUpdateClick"/>
                </FooterTemplate>
<Fields>
                   <asp:TemplateField HeaderText="管理员编号:">
                     <ItemTemplate><asp:TextBox ID="tbID" runat="server" Text='<%#Eval("AdminID") %>' ReadOnly="true"></asp:TextBox></ItemTemplate></asp:TemplateField>

                   <asp:TemplateField HeaderText="姓名:"><ItemTemplate><asp:TextBox ID="tbName" runat="server" Text='<%#Eval("AdminName") %>' ReadOnly="true"></asp:TextBox></ItemTemplate></asp:TemplateField>
       <asp:TemplateField HeaderText="性别:"><ItemTemplate><asp:TextBox ID="tbSex" runat="server" Text='<%#Eval("Sex") %>' ReadOnly="true"></asp:TextBox><asp:RadioButtonList ID="rblSex" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblSexSelectedChanged" Enabled="false" AutoPostBack="true" Visible="false">
            <asp:ListItem>男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem></asp:RadioButtonList></ItemTemplate></asp:TemplateField>
                   <asp:TemplateField HeaderText="固定电话:"><ItemTemplate><asp:TextBox ID="tbT1" runat="server" Text='<%#Eval("Phone") %>' ReadOnly="true"></asp:TextBox></ItemTemplate></asp:TemplateField>
                   <asp:TemplateField HeaderText="手机号:"><ItemTemplate><asp:TextBox ID="tbT2" runat="server" Text='<%#Eval("Telephone") %>' ReadOnly="true"></asp:TextBox></ItemTemplate></asp:TemplateField>
                   <asp:TemplateField HeaderText="电子邮件:"><ItemTemplate><asp:TextBox ID="tbE" runat="server" Text='<%#Eval("Email") %>' ReadOnly="true"></asp:TextBox></ItemTemplate></asp:TemplateField>
                </Fields>
    </asp:DetailsView></div>
    </form>
</body>
</html>
