<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubList.aspx.cs" Inherits="Student_SubList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>选择课题</title>
    <link href="../css/L.layout.css"type="text/css" rel="stylesheet"/>
    <style type="text/css">
        body{ margin:0;}
    </style>
</head>

<body>
    <form id="SubjectList" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
           <td valign="top" height="38">
               <table bgcolor="#111111" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td class="Header" height="30">
                        <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;课题管理</font></td>
                    </tr>
               </table>
           </td> 
        </tr>
        <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td align="center" width="90" background="../image/maillistbutton2.gif" height="24">
                            <a href="../Student/SubList.aspx" class="Newbutton"><font>&nbsp;课题列表</font></a></td>
                        <td align="right"><font face="宋体">&nbsp;</font>
					    </td>
                    </tr>
                </table>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" BorderColor="#93BEE2" CellPadding="3" 
                PageSize="20" Width="100%" onpageindexchanging="GridView1_PageIndexChanging">
                <RowStyle Height="25px" />
                <Columns>
                    <asp:BoundField DataField="SubNo" HeaderText="课题号" ReadOnly="True" 
                        SortExpression="SubNo" />
                    <asp:HyperLinkField DataTextField="SubjectName" HeaderText="课题名称" 
                        NavigateUrl="../Student/SubjectDetail.aspx" 
                        DataNavigateUrlFields="SubjectID" 
                        DataNavigateUrlFormatString="../Student/SubjectDetail.aspx?id={0}" 
                        SortExpression="SubjectName"/>
                    <asp:BoundField DataField="SuitProfession" HeaderText="适用专业" 
                        SortExpression="SuitProfession" />
                    <asp:BoundField DataField="SuitLevel" HeaderText="适用层次" 
                        SortExpression="SuitLevel" />
                    <asp:BoundField DataField="N1" HeaderText="指导老师1" 
                        SortExpression="N1" />
                    <asp:BoundField DataField="P1" HeaderText="老师职称" 
                        SortExpression="P1" />
                    <asp:BoundField DataField="N2" HeaderText="指导老师2" SortExpression="N2" />
                    <asp:BoundField DataField="P2" HeaderText="老师职称" SortExpression="P2" />
                    <asp:BoundField DataField="MaxPeople" HeaderText="最大可选人数" ReadOnly="True" SortExpression="MaxPeople"/>
                    <asp:BoundField DataField="NowPeople" HeaderText="已选人数" SortExpression="NowPeople"/>
                </Columns>
                <HeaderStyle BackColor="#337EB8" ForeColor="White" />
                <AlternatingRowStyle BackColor="#E8F4FF" />
                </asp:GridView>
            </td>
        </tr>
        <tr>
            <td height="24">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td align="center" width="100%" height="24">
                            <asp:Label ID="Label1" runat="server" Text="没有适合的课题！" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </td>            
        </tr>
        <tr height="30">
            <td class="GbText" background = "../Image/treetopbg.jpg">
            </td>
        </tr>
    </table>
    
    </form>
</body>
</html>