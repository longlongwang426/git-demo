<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StuList.aspx.cs" Inherits="Teacher_StuList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
         <script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
    <link href="../css/L.layout.css" type="text/css" rel="Stylesheet"/>
    <style type="text/css">
       *{ font-size:"宋体"; font-size:12px;}
       #title{ text-align:center; font-size:18px; font-weight:bolder; margin-bottom:0px;}
       body{ margin:0;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>         <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">                    <tr height="30">                        <td class="Header">                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;学生选课信息</font>                        </td>                    </tr>                </table>            <div><p id="title" runat="server"></p></div>        <div>
            <asp:GridView ID="gvStu" runat="server" AllowPaging="True"  Width="100%"
            AutoGenerateColumns="False" UseAccessibleHeader="False" CellPadding="4"  
            PageSize="20" onselectedindexchanging="gvStu_SelectedIndexChanging" 
                onpageindexchanging="gvStu_PageIndexChanging">
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#337EB8" ForeColor="White" />
                <AlternatingRowStyle BackColor="#E8F4FF" />
                <Columns>
                    <asp:BoundField DataField="SubjectName" HeaderText="课题名" />
                    <asp:TemplateField HeaderText="学号">
                        <ItemTemplate>
                          <asp:HyperLink ID="HyperLink1" runat="server" Text='<%#Eval("StudentID")%>' NavigateUrl='<%#string.Format("~/Teacher/StuDetail.aspx?id={0}",Eval("StudentID"))%>' ></asp:HyperLink>
                          </ItemTemplate>
                        <ItemStyle Width="10%" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="姓名">
                        <ItemTemplate>
                          <asp:HyperLink ID="HyperLink2" runat="server" Text='<%#Eval("StudentName")%>' NavigateUrl='<%#string.Format("~/Teacher/StuDetail.aspx?id={0}",Eval("StudentID"))%>' ></asp:HyperLink>
                          </ItemTemplate>
                        <ItemStyle Width="10%" />
                   </asp:TemplateField>
                    <asp:BoundField DataField="StudentLevel" HeaderText="培养层次" />
                    <asp:BoundField DataField="ProfessionName" HeaderText="专业" />
                     <asp:BoundField DataField="Class" HeaderText="班级" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lbRefuse" runat="server" Text="退选" CommandArgument='<%#Eval("StudentID") %>' onclick="RefuseStu_Click" OnClientClick="javascript:return confirm('确定要拒绝该学生选题吗？')">
                            </asp:LinkButton>
                        </ItemTemplate>
                        <ItemStyle HorizontalAlign="Center" Width="8%" />
                    </asp:TemplateField>
                </Columns>
        </asp:GridView></div>
      <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0"><tr><td align="center">
       <input id="back" type="button" class="redButtonCss" value="返回" onclick="javascript:parent.frames['main'].location.href='ManageSub.aspx'"/></td></tr></table>
    </div>
    </form>
</body>
</html>
