<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ZoneUpload.aspx.cs" Inherits="Publics_DownloadZone_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>文档上传</title>
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
    <form id="ZoneUpload" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr>
            <td vAlign="top" height="38">
                <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr height="30">
                        <td class="Header">
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
                            <a href="../../Public/DownloadZone/ZoneUpload.aspx" class="Newbutton"><font>&nbsp;文件上传</font></a></td>
                        <td class="Labelf">
                            <a href="../../Public/DownloadZone/ZoneManage.aspx" class="Newbutton"><font>&nbsp;文件管理</font></a></td>
                        <td class = "Labelf">
                            <a href="../../Public/DownloadZone/ZoneDownload.aspx" class="Newbutton"><font>&nbsp;文件下载</font></a></td>
                        <td align="right"><font>&nbsp;</font>
					    </td>
                    </tr>
                </table>
            </td>
        </tr>
        
        <tr>
            <td><img src="../../image/DraftBox_bg.jpg" width="100%" style="height: 22px" /></td>
        </tr>
        
        <tr>
            <td>
                <table class="GbText" style="BORDER-COLLAPSE:collapse" bordercolor="#93bee2"
					cellspacing="0" cellpadding="0" width="100%" border="1" runat="server" runat = "server">
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
						<td height="30">&nbsp;&nbsp;&nbsp;<asp:FileUpload ID="FileUploadMain"  CssClass="redButtonCss" runat="server" Width="400px" />
		                &nbsp;<span style="color:Red"><font face="宋体">【上传的文件只能是.doc、.docx、.xls、.ppt、.rar、zip类型且上传文件小于50MB】</font></span></td>
					</tr>
					
					<tr bgcolor="#E8F4FF">
						<td align="center"  height="35" colspan="2">
								
							<asp:Button ID="btn_Commit"  Height="20px"  CssClass="redButtonCss" Width="60px" 
                                runat="server" Text="提交"  
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
            <td class="GbText" background = "../../Image/treetopbg.jpg" align ="center">
                &nbsp;&nbsp;&nbsp;&nbsp;</td>
        </tr>
    </table>
    </form>
</body>
</html>
