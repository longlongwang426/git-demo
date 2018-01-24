<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageTe.aspx.cs" Inherits="Admin_ManageT" %>

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
</head>
<body>
    <form id="form1" runat="server">
    <div><table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr height="30">
                        <td class="Header">
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;教师管理</font>
                        </td>
                    </tr>
                </table><div>
      <asp:GridView ID="gvTeacher" runat="server" CellPadding="4" ForeColor="#333333" 
                AutoGenerateColumns="False"  Width="100%" onpageindexchanging="gvTeacher_PageIndexChanging" 
            onrowdatabound="gvTeacher_RowDataBound" onrowdeleting="gvTeacher_RowDeleting" 
            PageSize="20" UseAccessibleHeader="False" >
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" 
                HorizontalAlign="Center" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#337EB8" ForeColor="White" 
                HorizontalAlign="Center" />
                <AlternatingRowStyle BackColor="#E8F4FF" />
                <Columns>
                   <asp:TemplateField><ItemTemplate><asp:CheckBox ID="cbSelect" runat="server"/></ItemTemplate></asp:TemplateField>
                   <asp:BoundField DataField="PId"  HeaderText="序号"/>
                    <asp:HyperLinkField DataNavigateUrlFields="TeacherID" 
                        DataNavigateUrlFormatString="~/Admin/TeaDetail.aspx?id={0}" 
                        DataTextField="TeacherID" DataTextFormatString="{0}" HeaderText="教师编号" 
                        NavigateUrl="~/Admin/TeaDetail.aspx" />
                   <asp:BoundField DataField="TeacherName" HeaderText="姓名" />
                   <asp:BoundField DataField="Sex" HeaderText="性别" />
                   <asp:BoundField DataField="Post" HeaderText="职称" />
                   <asp:BoundField DataField="Phone" HeaderText="固定电话" />
                   <asp:BoundField DataField="Telephone" HeaderText="手机" />
                   <asp:BoundField DataField="Email" HeaderText="电子邮件" />
                   <asp:CommandField ShowDeleteButton="true" HeaderText="删除" />
                </Columns>   
            </asp:GridView> 
           </div>
         <div>
            <asp:CheckBox ID="cb2" runat="server" Text="全选" AutoPostBack="True" 
                 oncheckedchanged="cb2_CheckedChanged" />
            <asp:Button ID="btnDelete" runat="server"  Text="删除"  CssClass="redButtonCss" 
                             onclick="btnDelete_Click" OnClientClick="javascript:return confirm('确定要删除吗？')"/>
             <input id="back" type="button" class="redButtonCss" value="新建" onclick="javascript:parent.frames['main'].location.href='AddOneTea.aspx'"/>
        </div>        
    </div>
    </form>
</body>
</html>
