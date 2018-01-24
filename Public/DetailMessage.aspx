<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailMessage.aspx.cs" Inherits="DetailMessage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
 <link href="../css/L.layout.css" type="text/css" rel="Stylesheet"/>
        <style type="text/css">
       *{ font-size:"宋体"; font-size:12px;}
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
    <div>
         <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr height="30">
                        <td class="Header">
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;查看信息</font>
                        </td>
                    </tr>
                </table>
            <table id="Table1" class="GbText" style="BORDER-COLLAPSE:collapse" bordercolor="#93bee2"
					    cellspacing="0" cellpadding="0" width="100%" border="1">
                        <tr>
                            <td align="right" height="30" width="20%">标题 :</td>
                            <td height="30" style="padding-left: 4px">
                                &nbsp;<asp:TextBox ID="tbTitle"  Width="609px" runat="server" 
                                    CssClass="InputCss" Rows="2" Height="16px" ReadOnly="True"></asp:TextBox>
                             </td>
                        </tr>
                        
                        <tr bgcolor="#e8f4ff">
                            <td align="right" height="30" width="20%">内容 :</td>
                            <td height="30" style="padding-left: 4px">
                                &nbsp;<asp:TextBox ID="tbContent"  Width="609px" runat="server" 
                                    CssClass="InputCss" Rows="2" Height="234px" ReadOnly="True" 
                                    TextMode="MultiLine"></asp:TextBox>
                             </td>
                        </tr>
                        
					    <tr>
						    <td align="right" width="20%" height="30">发布时间 :</td>
						    <td height="30">&nbsp;&nbsp;&nbsp;
						        <asp:Label ID="lbTime" runat="server"></asp:Label>
                            </td>
					    </tr>
					    <tr bgcolor="#E8F4FF">
						    <td align="center"  height="35" colspan="2">						
                                  <asp:Button ID="btnBack" runat="server" CssClass="redButtonCss" PostBackUrl="~/Public/Message.aspx" Text="返回"/>
						    </td>
					    </tr>
                    </table>
    </div>
    </form>
</body>
</html>
