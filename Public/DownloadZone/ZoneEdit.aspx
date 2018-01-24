<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ZoneEdit.aspx.cs" Inherits="Public_DownloadZone_ZoneEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>文档修改</title>
    <link href="../../css/L.layout.css"type="text/css" rel="stylesheet"/>
    <style type="text/css">
        body{ margin:0;}
    </style>
</head>
<body>
    <form id="ZoneEdit" runat="server">
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
                                <span class="Newbutton"><font>&nbsp;文档修改</font></span></td>
                            <td align="right"><font>&nbsp;</font>
					        </td>
                        </tr>
                    </table>
                </td>
            </tr>
            
            <tr>
                <td style="margin: 0px; padding: 0px;"><img src="../../image/DraftBox_bg.jpg" width="100%" style="height: 22px" /></td>
            </tr>
            
            <tr>
                <td>
                    <table id="Table1" class="GbText" style="BORDER-COLLAPSE:collapse" bordercolor="#93bee2"
					    cellspacing="0" cellpadding="0" width="100%" border="1" runat="server">
                        <tr class = "frametr">
                            <td align="right" height="30" width="20%">文件标题 :</td>
                            <td height="30" style="padding-left: 4px">
                                &nbsp;<asp:TextBox ID="txt_filetitle"  
                                    ValidationGroup="FileTypeBox" Width="609px" runat="server" 
                                    CssClass="InputCss" Rows="2" Height="16px"></asp:TextBox>
                                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                    ControlToValidate="txt_filetitle" ErrorMessage="文件标题不能为空！" 
                                    SetFocusOnError="True"   ValidationGroup="FileTypeBox"></asp:RequiredFieldValidator>
                             </td>
                        </tr>
                        
                        <tr bgcolor="#e8f4ff">
						    <td align="right" width="20%" height="30"> 文件描述 :</td>
						    <td height="30" style="padding-top: 5px; padding-bottom: 5px;">&nbsp;
						        <asp:TextBox ID="txt_discription"  
                                    ValidationGroup="FileTypeBox" Width="609px" runat="server" 
                                    CssClass="InputCss" Rows="5" TextMode="MultiLine" Height="390px"></asp:TextBox>
						        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                    ControlToValidate="txt_discription" ErrorMessage="文件描述不能为空！" 
                                    SetFocusOnError="True"   ValidationGroup="FileTypeBox"></asp:RequiredFieldValidator>
						    </td>
					    </tr>
    					
					    <tr>
						    <td align="right" width="20%" height="30">文件上传 :</td>
						    <td height="30">&nbsp;&nbsp;&nbsp;<asp:FileUpload ID="FileUploadMain"  
                                    CssClass="redButtonCss" runat="server" Width="300px" Visible="False" />
						    <asp:LinkButton ID="lnkUpfile" runat="server" onclick="lnkUpfile_Click">重新上传</asp:LinkButton>
		                    &nbsp;<asp:Label ID="Label1" runat="server" ForeColor="Red" 
                                Text="【上传的文件只能是.doc、.docx、.xls、.xlsx、.ppt、.pptx、.rar、zip类型且上传文件小于50MB】" Visible="False"></asp:Label>
                            </td>
					    </tr>
    					
					    <tr bgcolor="#E8F4FF">
						    <td align="center"  height="35" colspan="2">

							    <asp:Button ID="btnModify" runat="server"  CssClass="redButtonCss"  Text="修改" 
                                 Height="22px" Width="83px" onclick="btnModify_Click1" OnClientClick="javascript:return confirm('确定要修改吗？')" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;							
    															
							    <input type="button" value="返回"                                       onclick="history.back()" class="redButtonCss" />
                                
						    </td>
					    </tr>
                    </table>
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
