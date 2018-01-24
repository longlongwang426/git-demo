﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TaskOutbox.aspx.cs" Inherits="Teacher_TaskOutbox" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>发布任务书</title>
    <link href="../css/L.layout.css"type="text/css" rel="stylesheet"/>
    <style type="text/css">
        body{ margin:0;}
    </style>
</head>
<body>
    <form id="TaskOutbox" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td valign="top" height="38">
                    <table bgcolor="#111111" cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td class="Header" height="30">
                                <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;发布任务书</font>
                            </td>
                        </tr>
                    </table>
                </td> 
            </tr>
            <tr>
                <td>
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td class = "Labelf">
                                <a href="SendTask.aspx" class="Newbutton"><font>&nbsp;发布任务书</font></a></td>
                            <td class = "Labels">
                                <a href="TaskOutbox.aspx" class="Newbutton"><font>&nbsp;我的任务书</font></a></td>
                            <td align="right"><font>&nbsp;</font>
					        </td>
                        </tr>
                    </table>
                    <asp:GridView ID="MailList" runat="server" AllowPaging="True" 
                    AutoGenerateColumns="False" BorderColor="#93BEE2" CellPadding="3" 
                    PageSize="15" Width="100%" onpageindexchanging="MailList_PageIndexChanging">
                    <RowStyle Height="25px" />
                        <Columns>
                            <asp:TemplateField HeaderText="选择">
                                <ItemTemplate>
                                    <asp:CheckBox ID="CB1" runat="server" AutoPostBack="True" />
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:CheckBox ID="CB1" runat="server" />
                                </EditItemTemplate>
                                <HeaderStyle Width="10%" />
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="DataNo" HeaderText="序号" SortExpression="DataNo">
                            <HeaderStyle Width="10%" />
                            </asp:BoundField>
                            <asp:HyperLinkField DataNavigateUrlFields="MailNo" 
                                DataNavigateUrlFormatString="./TaskOutboxRead.aspx?id={0}" DataTextField="Theme" 
                                HeaderText="主题" NavigateUrl="./TaskOutboxRead.aspx" SortExpression="Theme">
                            <HeaderStyle Width="50%" />
                            </asp:HyperLinkField>
                            <asp:BoundField DataField="StudentName" HeaderText="接收学生" 
                                SortExpression="StudentName">
                            <HeaderStyle Width="15%" />
                            </asp:BoundField>
                            <asp:BoundField DataField="SenderTime" HeaderText="发送时间" 
                                SortExpression="SenderTime">
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
                                
                                <asp:Label ID="Label1" runat="server" Text="您未发布任何任务书！"></asp:Label>
                                
                            </td>
                        </tr>
                    </table>
                </td>            
            </tr>
            
            <tr>
                <td style="padding: 5px; text-align: center;">
                        <asp:Button ID="btnSelectAll" runat="server"  style="margin-left: 0px"
                  Text="全选" Width="101px" CssClass="ButtonCss" Height="20px" onclick="btnSelectAll_Click" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                     <asp:Button ID="btnCancel" runat="server"  style="margin-left: 0px"
                  Text="反选" Width="101px" CssClass="ButtonCss" Height="20px" onclick="btnCancel_Click"  />
                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btnDelete" runat="server"  style="margin-left: 0px"
                  Text="删除" Width="101px" CssClass="ButtonCss" Height="20px" onclick="btnDelete_Click"  OnClientClick="javascript:return confirm('若删除，对方将看不到该信息，确定要删除该信息吗？')"/>
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
