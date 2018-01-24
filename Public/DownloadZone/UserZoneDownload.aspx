<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserZoneDownload.aspx.cs" Inherits="Public_DownloadZone_UserZoneDownload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>用户文档下载</title>
    <link href="../../css/L.layout.css"type="text/css" rel="stylesheet"/>
    <style type="text/css">
        body{ margin:0;}
    </style>
</head>
<body>
    <form id="UserZoneDownload" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td valign="top" height="38">
                    <table bgcolor="#111111" cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td class="Header" height="30">
                                <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;下载专区</font>
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
                                <a href="../../Public/DownloadZone/UserZoneDownload.aspx" class="Newbutton"><font>&nbsp;文件下载</font></a></td>
                            <td align="right"><font>&nbsp;</font>
					        </td>
                        </tr>
                    </table>
                        <asp:GridView ID="ZoneList" runat="server" AllowPaging="True" 
                        AutoGenerateColumns="False" BorderColor="#93BEE2" CellPadding="3" 
                        PageSize="15" Width="100%" 
                        onpageindexchanging="ZoneList_PageIndexChanging">
                            <Columns>
                                <asp:TemplateField HeaderText="下载" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="DownloadBtn" runat="server" ImageAlign="Middle" 
                                            ImageUrl="../../image/Icon/Download.gif" Height="16" 
                                            CommandArgument='<%#Eval("DataNo")%>' onclick="DownloadBtn_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="DataNo" HeaderText="文件序号" SortExpression="DataNo" />
                                <asp:BoundField DataField="Title" HeaderText="文件标题" SortExpression="Title" />
                                <asp:BoundField DataField="describe" HeaderText="文件描述" 
                                    SortExpression="describe" />
                                <asp:BoundField DataField="uploadtime" HeaderText="上传时间" 
                                    SortExpression="uploadtime" />
                            </Columns>
                        <RowStyle Height="25px" />
                        <HeaderStyle BackColor="#337EB8" ForeColor="White" />
                        <AlternatingRowStyle BackColor="#E8F4FF" />
                    </asp:GridView>
                    
                </td>
            </tr>
            
            <tr height="30">
            <td class="GbText" background = "../../Image/treetopbg.jpg" align ="center"></td>
            </tr>
        </table>
    </form>
</body>
</html>
