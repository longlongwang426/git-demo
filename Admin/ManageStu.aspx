<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageStu.aspx.cs" Inherits="Admin_ManageStu" %>

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
    <div>
<table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr height="30">
                        <td class="Header">
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;学生管理</font>
                        </td>
                    </tr>
                </table>
          <div>
            <asp:GridView ID="gvStudent" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" AutoGenerateColumns="False"   Width="100%"
                  onrowdatabound="gvStudent_RowDataBound" 
                  onrowdeleting="gvStudent_RowDeleting" UseAccessibleHeader="False" onpageindexchanging="gvStudent_PageIndexChanging" 
                  PageSize="20">
                <HeaderStyle BackColor="#337EB8" ForeColor="White" />
                <AlternatingRowStyle BackColor="#E8F4FF" />
                <Columns>
                   <asp:TemplateField><ItemTemplate><asp:CheckBox ID="cbSelect" runat="server" AutoPostBack="True" /></ItemTemplate></asp:TemplateField>
                   <asp:BoundField DataField="AutoId"  HeaderText="序号"/>
                   <asp:HyperLinkField DataTextField="StudentID" HeaderText="学号" 
                        NavigateUrl="~/Admin/StuDetail.aspx" DataNavigateUrlFields="StudentID" 
                        DataNavigateUrlFormatString="~/Admin/StuDetail.aspx?id={0}" 
                        DataTextFormatString="{0}"/>
                   <asp:BoundField DataField="StudentName"  HeaderText="姓名"/>
                   <asp:BoundField DataField="Sex"  HeaderText="性别"/>
                    <asp:BoundField DataField="StudentLevel"  HeaderText="类别"/>
                   <asp:BoundField DataField="ProfessionName"  HeaderText="专业"/>
                   <asp:BoundField DataField="Class"  HeaderText="班级"/>
                   <asp:BoundField DataField="SubjectTime"  HeaderText="毕业设计选题时间"/>
                   <asp:BoundField DataField="Phone"  HeaderText="固定电话"/>
                   <asp:BoundField DataField="Telephone"  HeaderText="手机"/>
                   <asp:BoundField DataField="Email"  HeaderText="电子邮件"/>
                   <asp:TemplateField HeaderText="审核状态"><ItemTemplate><asp:CheckBox ID="cbCheck" runat="server" AutoPostBack="True" Checked='<%#Eval("IsAccept") %>' OnCheckedChanged="ChangeChecked"/></ItemTemplate></asp:TemplateField>
                   <asp:CommandField ShowDeleteButton="true" HeaderText="删除" />
                </Columns>
            </asp:GridView></div>
            <div>
                <asp:CheckBox ID="cb2" runat="server" Text="全选" AutoPostBack="True" 
                    oncheckedchanged="cb2_CheckedChanged" />
                <asp:Button ID="btnDelete" runat="server" CssClass="redButtonCss" Text="删除" onclick="btnDelete_Click"/><input id="back" type="button" class="redButtonCss" value="新建" onclick="javascript:parent.frames['main'].location.href='AddOneStu.aspx'"/>
                 <asp:DropDownList ID="ddlMajor" runat="server" AutoPostBack="True"
                onselectedindexchanged="ddlMajor_SelectedIndexChanged">
                <asp:ListItem Selected="True">----选择专业----</asp:ListItem>
            </asp:DropDownList></div>
           </div>           
        </div>
    </form>
</body>
</html>
