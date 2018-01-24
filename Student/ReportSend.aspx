﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportSend.aspx.cs" Inherits="Student_ReportSend" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>报告提交</title>
    <link href="../css/L.layout.css"type="text/css" rel="stylesheet"/>
    <style type="text/css">
        body
        {
        	margin-right:0px;
            margin-left: 0px;
            margin-top: 0px;
        }
    </style>
</head>
<body>
    <form id="ReportSend" runat="server">
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr>
                <td valign="top" height="38">
                    <table bgcolor="#111111" cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td class="Header" height="30">
                                <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;开题材料提交</font>
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
                                <a href="../Student/ReportSend.aspx" class="Newbutton"><font>&nbsp;提交开题材料</font></a></td>
                            <td class = "Labelf">
                                <a href="../Student/ReportOutbox.aspx" class="Newbutton"><font>&nbsp;我的开题材料</font></a></td>
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
                    <table class="GbText" style="BORDER-COLLAPSE:collapse" bordercolor="#93bee2"
					    cellspacing="0" cellpadding="0" width="100%" border="1" runat="server">
                        <tr>
                            <td align="right" height="30" width="20%">主题 :&nbsp;</td>
                            <td height="30" style="padding-left: 4px">
                                &nbsp;<asp:TextBox ID="txt_theme"
                                    ValidationGroup="FileTypeBox" Width="609px" runat="server" 
                                    CssClass="InputCss" Rows="2" Height="16px"></asp:TextBox>
                                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txt_theme" ErrorMessage="主题不能为空！" 
                                    SetFocusOnError="True"   ValidationGroup="FileTypeBox"></asp:RequiredFieldValidator>
                             </td>
                        </tr>
                        
                        <tr bgcolor="#E8F4FF">
                            <td align="right" height="30" width="20%">接收教师 :&nbsp;</td>
                            <td height="30" style="padding-left: 4px">
                                &nbsp;<asp:TextBox ID="tbSendTo" runat="server" CssClass="InputCss" Width="400px" ReadOnly="true"></asp:TextBox>
                                <asp:DropDownList ID="ddlTeacher" 
                                    CssClass="InputCss" ValidationGroup="FileTypeBox" 
                                    Rows="2" Height="18px" Width="150px"
                                    runat="server"  AutoPostBack="true" onselectedindexchanged="ddlTeacher_SelectedIndexChanged">
                                    <asp:ListItem>----选择指导老师----</asp:ListItem>
                                </asp:DropDownList>
                                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                    ControlToValidate="tbSendTo" ErrorMessage="接收教师不能为空！" 
                                    SetFocusOnError="True"   ValidationGroup="FileTypeBox"></asp:RequiredFieldValidator>
                             </td>
                        </tr>
                        
					    <tr>
						    <td align="right" width="20%" height="30">开题材料上传 :&nbsp;</td>
						    <td height="30">&nbsp;&nbsp;&nbsp;<asp:FileUpload ID="FileUploadMain"  CssClass="redButtonCss" runat="server" Width="300px" />
		                    &nbsp;<span style="color:Red"><font face="宋体">【开题材料只能是.doc、.docx、.xls、.xlsx、.ppt、.pptx、.rar、zip类型且上传文件小于50MB】</font></span></td>
					    </tr>
    					
					    <tr bgcolor="#E8F4FF">
						    <td align="center"  height="35" colspan="2">
							    <asp:Button ID="btn_Commit" Height="20px" CssClass="redButtonCss" Width="60px" 
                                    runat="server" Text="发送"
                                    ValidationGroup="FileTypeBox" onclick="btn_Commit_Click"/>
                                &nbsp; &nbsp;						
							    <asp:Button ID="btn_reset"  Height="20px"  CssClass="redButtonCss" Width="60px" 
                                    runat="server" Text="重置"  
                                    ValidationGroup="FileTypeBox" onclick="btn_reset_Click1"/>
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
