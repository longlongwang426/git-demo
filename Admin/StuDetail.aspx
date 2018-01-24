<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StuDetail.aspx.cs" Inherits="Admin_StuDetail" %>

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
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;学生信息</font>
                        </td>
                    </tr>
                </table>
        <div>
            <asp:DetailsView ID="dvStu" runat="server"  cellpadding="3"                 bordercolor="#93BEE2" Width="100%"                AutoGenerateRows="False">
               <FooterStyle HorizontalAlign="Center" />                <CommandRowStyle BackColor="#337EB8" ForeColor="White" />                <RowStyle Height="25" />                <FieldHeaderStyle Width="25%" HorizontalAlign="Right"/>
                <AlternatingRowStyle BackColor="#E8F4FF"/>
                <FooterTemplate>
                  <asp:Button ID="btnEdit" runat="server" CssClass="redButtonCss" Text="编辑" onclick="btnEdit_Click"/>
                <asp:Button ID="btnUpdate" runat="server" CssClass="redButtonCss" Text="更新" 
                onclick="btnUpdate_Click"/>
            <input id="back" type="button" class="redButtonCss" value="返回" onclick="javascript:if(confirm('确定要返回吗？'))parent.frames['main'].location.href='ManageStu.aspx';else return false;"/>
                </FooterTemplate>
                <Fields>
                  <asp:TemplateField HeaderText="学号:">
                  <ItemTemplate><asp:TextBox ID="tbID" Text='<%#Eval("StudentID") %>' runat="server" ReadOnly="true"></asp:TextBox></ItemTemplate>
                  </asp:TemplateField>
                  <asp:TemplateField HeaderText="姓名:"><ItemTemplate><asp:TextBox ID="tbName" runat="server" Text='<%#Eval("StudentName") %>' ReadOnly="true"></asp:TextBox></ItemTemplate></asp:TemplateField>
                  <asp:TemplateField HeaderText="性别:"><ItemTemplate><asp:TextBox ID="tbSex" runat="server" Text='<%#Eval("Sex") %>' ReadOnly="true"></asp:TextBox><asp:RadioButtonList ID="rblSex" runat="server" RepeatDirection="Horizontal" OnSelectedIndexChanged="rblSexSelectedChanged"  AutoPostBack="true" Visible="false">
            <asp:ListItem>男</asp:ListItem>
            <asp:ListItem>女</asp:ListItem></asp:RadioButtonList></ItemTemplate></asp:TemplateField>
            <asp:TemplateField HeaderText="培养层次:"><ItemTemplate><asp:TextBox ID="tbLevel" runat="server" Text='<%#Eval("StudentLevel") %>' ReadOnly="true" ></asp:TextBox><asp:RadioButtonList ID="rblLevil" runat="server" AutoPostBack="true" OnSelectedIndexChanged="rblLevelChanged" RepeatDirection="Horizontal" Visible="false"><asp:ListItem>本科</asp:ListItem>
            <asp:ListItem>专科</asp:ListItem>
            </asp:RadioButtonList></ItemTemplate></asp:TemplateField>
                  <asp:TemplateField HeaderText="专业名称:"><ItemTemplate><asp:TextBox ID="tbPro" runat="server" Text='<%#Eval("ProfessionName") %>' ReadOnly="true"></asp:TextBox><asp:DropDownList ID="ddlMajor" runat="server" Visible="false" OnSelectedIndexChanged="ddlIndexChanged"><asp:ListItem>----请选择专业----</asp:ListItem></asp:DropDownList></ItemTemplate></asp:TemplateField>
                  <asp:TemplateField HeaderText="班级:"><ItemTemplate><asp:TextBox ID="tbClass" runat="server" Text='<%#Eval("Class") %>' ReadOnly="true"></asp:TextBox></ItemTemplate></asp:TemplateField>

                  <asp:TemplateField HeaderText="毕业设计年份:"><ItemTemplate><input type="text" id="subYear" runat="server" value='<%#Eval("SubjectTime") %>'  readonly="readonly" onFocus="WdatePicker({startDate:'%y',dateFmt:'yyyy',alwaysUserStartDate:true})" /></ItemTemplate></asp:TemplateField>
                  <asp:TemplateField HeaderText="固定电话:"><ItemTemplate><asp:TextBox ID="tbPhone" runat="server" Text='<%#Eval("Phone") %>' ReadOnly="true"></asp:TextBox></ItemTemplate></asp:TemplateField>
                  <asp:TemplateField HeaderText="手机:"><ItemTemplate><asp:TextBox ID="tbTel" runat="server" Text='<%#Eval("Telephone") %>' ReadOnly="true"></asp:TextBox></ItemTemplate></asp:TemplateField>
                  <asp:TemplateField HeaderText="电子邮件:"><ItemTemplate><asp:TextBox ID="tbEmail" runat="server" Text='<%#Eval("Email") %>' ReadOnly="true"></asp:TextBox></ItemTemplate></asp:TemplateField> 
                  <asp:TemplateField HeaderText="选题资格:"><ItemTemplate><asp:CheckBox ID="cbAccept" runat="server"  Enabled="false" Checked='<%#Eval("IsAccept") %>'/></ItemTemplate></asp:TemplateField>
                </Fields>
            </asp:DetailsView>
        </div>
    </div>
    </form>
</body>
</html>
