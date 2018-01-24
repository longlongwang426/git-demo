﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TaskOutboxRead.aspx.cs" Inherits="Teacher_TaskOutboxRead" %>

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
    <form id="TaskOutboxRead" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td valign="top" height="38">
                    <table bgcolor="#111111" cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td class="Header" height="30">
                                <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;查看任务书</font>
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
                                <span class="Newbutton"><font>&nbsp;查看任务书</font></span></td>
                            <td align="right"><font>&nbsp;</font>
					        </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            <tr>
                <td><img src="../image/DraftBox_bg.jpg" width="100%" style="height: 22px" /></td>
            </tr>
            
            <tr>
                <td>
                    <table id="Table1" class="GbText" style="BORDER-COLLAPSE:collapse" bordercolor="#93bee2"
					    cellspacing="0" cellpadding="0" width="100%" border="1" runat="server">
                        <tr>
                            <td align="right" height="30" width="20%">主题 :</td>
                            <td height="30" style="padding-left: 4px">
                                &nbsp;<asp:TextBox ID="txt_theme"  
                                    ValidationGroup="FileTypeBox" Width="609px" runat="server" 
                                    CssClass="InputCss" Rows="2" Height="16px" ReadOnly="True"></asp:TextBox>
                             </td>
                        </tr>
                        
                        <tr bgcolor="#e8f4ff">
                            <td align="right" height="30" width="20%">接收学生 :</td>
                            <td height="30" style="padding-left: 4px">
                                &nbsp;<asp:TextBox ID="txt_sender"  
                                    ValidationGroup="FileTypeBox" Width="609px" runat="server" 
                                    CssClass="InputCss" Rows="2" Height="16px" ReadOnly="True"></asp:TextBox>
                             </td>
                        </tr>
    					
					    <tr>
						    <td align="right" width="20%" height="30">任务书下载 :</td>
						    <td height="30">&nbsp;&nbsp;&nbsp;
						    <asp:LinkButton ID="lnkdownfile" runat="server" onclick="lnkdownfile_Click">下载</asp:LinkButton>
						    <asp:Label ID="IsAccessory" runat="server" Visible="false">无任务书</asp:Label>
                            </td>
					    </tr>
    					
					    <tr bgcolor="#E8F4FF">
						    <td align="center"  height="35" colspan="2">
							    <asp:Button ID="Delete" runat="server"  CssClass="redButtonCss"  Text="删除" 
                                 Height="22px" Width="83px" onclick="Delete_Click" OnClientClick="javascript:return confirm('若删除，对方将看不到该信息，确定要删除该信息吗？')" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;							
                                <input type="button" value="返回"      
                                  onclick="history.back()" class="redButtonCss" />                    
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
