<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ZoneManage.aspx.cs" Inherits="Public_DownloadZone_ZoneManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>文档管理</title>
    <link href="../../css/L.layout.css"type="text/css" rel="stylesheet"/>
    <style type="text/css">
        body{ margin:0;}
    </style>
</head>

<body>
    <form id="ZoneManage" runat="server">
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
                        <td class = "Labelf">
                            <a href="../../Public/DownloadZone/ZoneUpload.aspx" class="Newbutton"><font>&nbsp;文件上传</font></a></td>
                        <td class="Labels">
                            <a href="../../Public/DownloadZone/ZoneManage.aspx" class="Newbutton"><font>&nbsp;文件管理</font></a></td>
                        <td class = "Labelf">
                            <a href="../../Public/DownloadZone/ZoneDownload.aspx" class="Newbutton"><font>&nbsp;文件下载</font></a></td>
                        <td align="right"><font>&nbsp;</font>
					    </td>
                    </tr>
                </table>
                <asp:GridView ID="ZoneList" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" BorderColor="#93BEE2" CellPadding="3" 
                PageSize="15" Width="100%" onpageindexchanging="ZoneList_PageIndexChanging">
                <RowStyle Height="25px" />
                    <Columns>
                        <asp:TemplateField HeaderText="选择" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:CheckBox ID="CB1" runat="server" AutoPostBack="True" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:CheckBox ID="CB1" runat="server" />
                            </EditItemTemplate>
                            <HeaderStyle Width="5%"/>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DataNo" HeaderText="文件序号" SortExpression="DataNo">
                        <HeaderStyle Width="7%" />
                        </asp:BoundField>
                        <asp:HyperLinkField DataNavigateUrlFields="DataNo" 
                            DataNavigateUrlFormatString="../../Public/DownloadZone/ZoneEdit.aspx?id={0}" DataTextField="Title" 
                            HeaderText="文件标题" NavigateUrl="../../Public/DownloadZone/ZoneEdit.aspx" 
                            SortExpression="Title" DataTextFormatString="{0}">
                        <HeaderStyle Width="23%" />
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="Describe" HeaderText="文件描述" 
                            SortExpression="Describe">
                        <HeaderStyle Width="50%" />
                        </asp:BoundField>
                        <asp:BoundField DataField="UploadTime" HeaderText="上传时间">
                        <HeaderStyle Width="15%" />
                        </asp:BoundField>
                    </Columns>
                <HeaderStyle BackColor="#337EB8" ForeColor="White" />
                <AlternatingRowStyle BackColor="#E8F4FF" />
                </asp:GridView>
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
              Text="删除" Width="101px" CssClass="ButtonCss" Height="20px" onclick="btnDelete_Click" 
                        onclientclick="javascript:return confirm('确定要删除所选文件吗？')"  />
            </td>
        </tr>
        <tr height="30">
            <td class="GbText" background = "../../Image/treetopbg.jpg" align ="center">
                &nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
    </table>
    </form>
</body>
</html>
