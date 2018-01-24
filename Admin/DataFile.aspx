<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataFile.aspx.cs" Inherits="Admin_DataFile" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
        <link href="../css/L.layout.css"type="text/css" rel="stylesheet"/>
        <style type="text/css">
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
<table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr height="38px">
       <td vAlign="top" height="38">
           <table borderColor="#111111" height="1" cellSpacing="0" cellPadding="0" width="100%" border="0">
                <tr height="30">
                    <td class="GbText" background = "../Image/treetopbg.jpg">
                    <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;归档数据</font></td>
                </tr>
           </table>
       </td> 
    </tr>
    <tr>
        <td>
            <asp:GridView ID="gvDataFile" runat="server" AllowPaging="True" 
        AutoGenerateColumns="False" CellPadding="4"  ForeColor="#E8F4FF" GridLines="None" 
        Width="100%" UseAccessibleHeader="False" 
                onpageindexchanging="gvDataFile_PageIndexChanging" PageSize="15" >
        <RowStyle BackColor="White" ForeColor="#006699" />
        <Columns>
            <asp:BoundField DataField="AID" HeaderText="序号"/>
            <asp:BoundField DataField="TeacherName" HeaderText="教师" />
            <asp:BoundField DataField="Theme" HeaderText="主题" />
            <asp:BoundField DataField="Contents" HeaderText="内容" />
            <asp:BoundField DataField="SenderTime" HeaderText="发送时间" />
                <asp:TemplateField HeaderText="下载" ItemStyle-VerticalAlign="Middle" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Center">
                 <ItemTemplate>
                      <asp:ImageButton ID="DownloadBtn" runat="server" ImageAlign="Middle" ImageUrl="../image/Icon/Download.gif" Height="16"  CommandArgument='<%#Eval("MailNo")%>' onclick="DownloadBtn_Click" /></ItemTemplate>
                      <HeaderStyle Width="10%" />
<ItemStyle HorizontalAlign="Center" VerticalAlign="Middle"></ItemStyle>
                                </asp:TemplateField>
        </Columns>
        <FooterStyle BackColor="#E8F4FF" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#E8F4FF" ForeColor="#006699" HorizontalAlign="Center" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <HeaderStyle BackColor="#337FB2" Font-Bold="True" ForeColor="#E8F4FF" />
        <EditRowStyle BackColor="#CCCCFF" />
        <AlternatingRowStyle BackColor="#E8F4FF" />
    </asp:GridView>
        </td>
    </tr>
    <tr bgcolor="#E8F4FF">
        <td align="center">
            <asp:Button ID="btByTea" runat="server" CssClass="redButtonCss" Text="按教师姓名排序" 
                              Width="100px" onclick="btByTea_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btByDate" runat="server" CssClass="redButtonCss" Text="按提交日期排序" 
                              Width="100px" onclick="btByDate_Click" />
        </td>
    </tr>
    <tr height="30">
        <td class="GbText" background = "../image/treetopbg.jpg" valign="baseline" 
            width="30">
        </td>
    </tr>
    </table>
    </form>
</body>
</html>
