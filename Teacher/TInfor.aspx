<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TInfor.aspx.cs" Inherits="Teacher_TInfor" %>

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
            margin: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr height="30">
                <td class="Header">
                    <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;教师信息</font>
                </td>
            </tr>
        </table>
        <table>
            <tr>
                <td class="Labels"><a href="TInfor.aspx" style="color:#fff">教师信息</a></td>
                <td align="right"><font>&nbsp;</font>
            </tr>
        </table>
        <div>
            <asp:DetailsView ID="dvTea" runat="server"  cellpadding="3" 
                bordercolor="#93BEE2" Width="100%"
                AutoGenerateRows="False">
               <FooterStyle HorizontalAlign="Center" />
                <CommandRowStyle BackColor="#337EB8" ForeColor="White" />
                <RowStyle Height="25" />
                <FieldHeaderStyle Width="25%" HorizontalAlign="Right"/>
                <AlternatingRowStyle BackColor="#E8F4FF"/>
                <FooterTemplate>
                <asp:Button ID="btnEdit" runat="server" CssClass="redButtonCss" Text="编辑" onclick="btnEdit_Click"/>
                <asp:Button ID="btnUpdate" runat="server" CssClass="redButtonCss" Text="更新" 
                onclick="btnUpdate_Click"/>
            <input id="back" type="button" class="redButtonCss" value="返回" onclick="javascript:parent.frames['main'].location='../Public/Message.aspx'"/>
                </FooterTemplate>
                <Fields>
                  <asp:TemplateField HeaderText="编号:">
                  <ItemTemplate><asp:TextBox ID="tbID" Text='<%#Eval("TeacherID")%>' runat="server" ReadOnly="true" Enabled="false" Width="200px"></asp:TextBox></ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="姓名:"><ItemTemplate><asp:TextBox ID="tbName" runat="server" Text='<%#Eval("TeacherName")%>' ReadOnly="true" Enabled="false" Width="200px"></asp:TextBox></ItemTemplate></asp:TemplateField>
                  <asp:TemplateField HeaderText="性别:"><ItemTemplate><asp:TextBox ID="tbSex" runat="server" Text='<%#Eval("Sex")%>' ReadOnly="true" Enabled="false" Width="200px"></asp:TextBox></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="职称:"><ItemTemplate><asp:TextBox ID="tbPost" runat="server" Text='<%#Eval("Post")%>' ReadOnly="true"  Enabled="false" Width="200px"></asp:TextBox></ItemTemplate></asp:TemplateField>
                  <asp:TemplateField HeaderText="固定电话:"><ItemTemplate><asp:TextBox ID="tbPhone" runat="server" Text='<%#Eval("Phone")%>' ReadOnly="true" OnKeyPress="if ((event.keyCode < '0' || event.keyCode >57)&&event.keyCode!=45) event.returnValue = false;this.value=this.value.replace(' ',''); " Width="200px"
MaxLength="15"></asp:TextBox></ItemTemplate></asp:TemplateField>
                  <asp:TemplateField HeaderText="手机:"><ItemTemplate><asp:TextBox ID="tbTel" runat="server" Text='<%#Eval("Telephone")%>' ReadOnly="true" OnKeyPress="if ((event.keyCode < '0' || event.keyCode >57)&&event.keyCode!=45) event.returnValue = false;this.value=this.value.replace(' ','');" Width="200px"
MaxLength="15"></asp:TextBox></ItemTemplate></asp:TemplateField>
                  <asp:TemplateField HeaderText="电子邮件:"><ItemTemplate><asp:TextBox ID="tbEmail" runat="server" Text='<%#Eval("Email")%>' ReadOnly="true"  MaxLength="50" Width="200px"></asp:TextBox></ItemTemplate></asp:TemplateField> 
                </Fields>
            </asp:DetailsView>
        </div>
        <table style="width:100%;">
            <tr height="30">
                <td class="GbText" background = "../Image/treetopbg.jpg"></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
