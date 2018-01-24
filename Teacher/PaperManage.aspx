<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PaperManage.aspx.cs" Inherits="Teacher_PaperManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>查看论文</title>
    <link href="../css/L.layout.css"type="text/css" rel="stylesheet"/>
    <style type="text/css">
        body{ margin:0;}
    </style>
</head>
<body>
    <form id="PaperManage" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td valign="top" height="38">
                    <table bgcolor="#111111" cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td class="Header" height="30">
                                <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;查看论文</font>
                            </td>
                        </tr>
                    </table>
                </td> 
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td class = "Labels">
                                <span class="Newbutton"><font>&nbsp;查看论文</font></span></td>
                            <td align="right"><font>&nbsp;</font>
					        </td>
                        </tr>
                    </table>
                    <asp:GridView ID="PaperList" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BorderColor="#93BEE2" CellPadding="3" 
                    PageSize="15" Width="100%" onpageindexchanging="PaperList_PageIndexChanging">
                    <RowStyle Height="25px" />
                        <Columns>
                            <asp:BoundField DataField="DataNo" HeaderText="序号">
                            <HeaderStyle Width="10%" />
                            </asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="MailNo" 
                                DataNavigateUrlFormatString="./PaperRead.aspx?id={0}" DataTextField="Theme" 
                                HeaderText="主题" NavigateUrl="./PaperRead.aspx" SortExpression="Theme">
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="StudentName" HeaderText="发送学生" 
                                SortExpression="StudentName">
                            <HeaderStyle Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SenderTime" HeaderText="发送时间" 
                                SortExpression="SenderTime">
                            <HeaderStyle Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="Contents" HeaderText="审核状态" 
                                SortExpression="Contents" >
                            <HeaderStyle Width="15%" />
                            </asp:BoundField>
                        </Columns>
                    <HeaderStyle BackColor="#337EB8" ForeColor="White" />
                    <AlternatingRowStyle BackColor="#E8F4FF" />
                    </asp:GridView>
                </td>
            </tr>
            
            <tr>
                <td height="40">
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td align="center" width="100%" height="24">
                                <asp:Label ID="Label1" runat="server" Text="您未收到论文！"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>            
            </tr>
            <tr height="30">
                <td class="GbText" background = "../Image/treetopbg.jpg" align ="center">
                    &nbsp;&nbsp;&nbsp;&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>
