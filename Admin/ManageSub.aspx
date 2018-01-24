<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManageSub.aspx.cs" Inherits="Admin_ManageSub" %>

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
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;课题管理</font>
                        </td>
                    </tr>
                </table>
          <asp:GridView ID="gvSub" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" AutoGenerateColumns="False"  Width="100%"
               onrowdatabound="gvSub_RowDataBound" onrowdeleting="gvSub_RowDeleting" 
               AllowPaging="False" UseAccessibleHeader="False" BorderColor="#93BEE2"
               >
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#337EB8" ForeColor="White" />
                <AlternatingRowStyle BackColor="#E8F4FF" />
                <Columns>
                   <asp:TemplateField><ItemTemplate><asp:CheckBox ID="cbSelect" runat="server"/></ItemTemplate></asp:TemplateField>
                   <asp:BoundField DataField="PId"  HeaderText="序号"/>
                    <asp:TemplateField HeaderText="课题名称">
                    <ItemTemplate>
                      <asp:HyperLink ID="HyperLink1" runat="server" Text='<%#Eval("SubjectName")%>' NavigateUrl='<%#string.Format("~/Admin/DetailSub.aspx?id={0}",Eval("SubjectID"))%>' ></asp:HyperLink>
                      </ItemTemplate>
                      </asp:TemplateField>
                      <asp:BoundField DataField="SuitLevel" HeaderText="适用层次" />
                   <asp:BoundField DataField="n1" HeaderText="指导教师" />
                   <asp:BoundField DataField="n2" HeaderText="指导教师" />
                   <asp:BoundField DataField="Memo" HeaderText="主要内容"  HeaderStyle-Width="30%"/>
                   <asp:BoundField DataField="MaxPeople" HeaderText="最大选课人数" />
                   <asp:BoundField DataField="SuitYear" HeaderText="开题时间" />
                   <asp:TemplateField HeaderText="审核状态"><ItemTemplate><asp:CheckBox ID="cbCheck" runat="server" AutoPostBack="True" Checked='<%#Eval("IsCheck") %>' OnCheckedChanged="ChangeChecked"/></ItemTemplate></asp:TemplateField>
                   <asp:CommandField ShowDeleteButton="true" HeaderText="删除"/>
                </Columns>   
            </asp:GridView>
       <div>
         <div>
            <asp:CheckBox ID="cb2" runat="server" Text="全选" 
                oncheckedchanged="cb2_CheckedChanged" AutoPostBack="True" />
            <asp:Button ID="btnDelete" runat="server"  Text="删除"  CssClass="redButtonCss" onclick="btnDelete_Click" OnClientClick="javascript:return confirm('确定要删除吗？')"/>&nbsp;&nbsp;
            <asp:Button ID="btnCheck" runat="server"  Text="通过审核"  CssClass="redButtonCss" onclick="btnCheck_Click" OnClientClick="javascript:return confirm('确定要审核这些课题吗？')"/>&nbsp;&nbsp;
            <asp:Button ID="btnDaochu" runat="server"  Text="导出课题信息"  
                 CssClass="redButtonCss" onclick="btnDaochu_Click" Width="108px"/>
        </div>   
       </div>
    </form>
</body>
</html>
