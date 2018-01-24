<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PublicSub.aspx.cs" Inherits="Teacher_PublicSubject" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>课题申报</title>
    <link href="../css/L.layout.css" type="text/css" rel="Stylesheet"/>
    <style type="text/css">
         *{ font-size:"宋体"; font-size:12px;}
         body { color:#006699; font:9px; margin:0;}
        .table {
        	width: 100%;
            border-collapse:collapse;	
        }
        tr td{
            border: 1px solid #93bee2;	
        }

        .style1
        {
            width: 280px; text-align:right; padding-right:10px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table cellspacing="0" cellpadding="0" width="100%" border="0">
            <tr height="38px">
               <td vAlign="top" height="38">
                   <table borderColor="#111111" height="1" cellSpacing="0" cellPadding="0" width="100%" border="0">
                        <tr height="30">
                            <td class="GbText" background = "../Image/treetopbg.jpg">
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;课题申报</font></td>
                        </tr>
                   </table>
               </td> 
            </tr>
            <tr>
                <td style=" border:0;">
                    <table cellspacing="0" cellpadding="0" width="100%" border="0" style=" border:0;">
                        <tr>
                            <td align="center" width="90" background="../image/maillistbutton1.gif" height="24" style=" border:0;">
                                <a href="MySubjects.aspx" class="Newbutton"><font>&nbsp;我的课题</font></a></td>
                            <td align="center" width="90" background="../image/maillistbutton2.gif" height="24" style=" border:0;">
                                <a href="PublicSub.aspx" class="Newbutton"><font>&nbsp;申报课题</font></a></td>
                            <td align="right"><font>&nbsp;</font>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table class="table">
            
            <tr>
                <td class="style1">
                    课题名称：</td>
                <td style=" padding-left:5px;">
                    <asp:TextBox ID="tbSubName" runat="server" Width="450px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                        ControlToValidate="tbSubName" ErrorMessage="*课题名不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr bgcolor="#E8F4FF">
                <td class="style1">
                    适用层次：</td>
                <td style=" padding-left:5px;">
                    <asp:DropDownList ID="ddlLevel" runat="server" 
                        Width="100px">
                        <asp:ListItem>---选择层次---</asp:ListItem>
                        <asp:ListItem>本科</asp:ListItem>
                        <asp:ListItem>专科</asp:ListItem>
                        <asp:ListItem>本专科</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    适用专业：</td>
                <td style=" padding-left:5px;">
                    <asp:TextBox ID="tbMajor" runat="server" Height="60px" TextMode="MultiLine" 
                        Width="230px" ReadOnly="True"></asp:TextBox>
                    <asp:DropDownList ID="ddlMajor" runat="server" AutoPostBack="True" 
                        onselectedindexchanged="ddlMajor_SelectedIndexChanged" Width="210px">
                        <asp:ListItem>---选择适用专业---</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                        ControlToValidate="tbMajor" ErrorMessage="*专业不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr bgcolor="#E8F4FF">
                <td class="style1">
                    课题类型：</td>
                <td style=" padding-left:5px;">
                    <asp:RadioButtonList ID="rblType" runat="server" 
                        RepeatDirection="Horizontal" Height="22px" RepeatLayout="Flow">
                        <asp:ListItem Selected="True">理论类</asp:ListItem>
                        <asp:ListItem>应用类</asp:ListItem>
                        <asp:ListItem>调研类</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    课题来源：</td>
                <td style=" padding-left:5px;">
                    <asp:RadioButtonList ID="rblOrigin" runat="server" 
                        RepeatDirection="Horizontal" Height="22px" RepeatLayout="Flow">
                        <asp:ListItem Selected="True">理论研究</asp:ListItem>
                        <asp:ListItem>生产实际</asp:ListItem>
                        <asp:ListItem>实验室建设</asp:ListItem>
                        <asp:ListItem>其他</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr bgcolor="#E8F4FF">
                <td class="style1">
                    课题新旧：</td>
                <td style=" padding-left:5px;">
                    <asp:RadioButtonList ID="rblIsNew" runat="server" 
                        RepeatDirection="Horizontal" Height="22px" RepeatLayout="Flow">
                        <asp:ListItem Selected="True">新课题</asp:ListItem>
                        <asp:ListItem>往届题，有新要求</asp:ListItem>
                        <asp:ListItem>往届题，没新要求</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    课题工作量是否适中：</td>
                <td style=" padding-left:5px;">
                    <asp:RadioButtonList ID="rblWorkLoad" runat="server" 
                        RepeatDirection="Horizontal" Height="22px" RepeatLayout="Flow">
                        <asp:ListItem Selected="True">是</asp:ListItem>
                        <asp:ListItem>否</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr bgcolor="#E8F4FF">
                <td class="style1">
                    是否能达到专业培养目标要求：</td>
                <td style=" padding-left:5px;">
                    <asp:RadioButtonList ID="rblIsOK" runat="server" 
                        RepeatDirection="Horizontal" Height="22px" RepeatLayout="Flow">
                        <asp:ListItem Selected="True">是</asp:ListItem>
                        <asp:ListItem>否</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    指导教师：</td>
                <td style=" padding-left:5px;">
                    <table style=" width:60%; border:0;">
                        <tr>
                            <td style=" text-align:right; padding-right:10px;">
                                姓名:</td>
                            <td>
                                <asp:TextBox ID="tbT1Name" runat="server"></asp:TextBox>
                            </td>
                            <td style=" text-align:right; padding-right:10px;">
                                职称:</td>
                            <td>
                                <asp:TextBox ID="tbPost1" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style=" text-align:right; padding-right:10px;">
                                姓名:</td>
                            <td>
                                <asp:DropDownList ID="ddlT2Name" runat="server" AutoPostBack="True" 
                                    onselectedindexchanged="ddlT2Name_SelectedIndexChanged" Width="132px">
                                    <asp:ListItem>---选择指导教师---</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td style=" text-align:right; padding-right:10px;">
                                职称:</td>
                            <td>
                                <asp:TextBox ID="tbPost2" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr bgcolor="#E8F4FF">
                <td class="style1">
                    课题简介：</td>
                <td style=" padding-left:5px;">
                    <asp:TextBox ID="tbAbout" runat="server" Height="140px" TextMode="MultiLine" 
                        Width="463px"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ControlToValidate="tbAbout" ErrorMessage="*课题简介不能为空"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style1">
                    最大选题人数：</td>
                <td style=" padding-left:5px;">
                    <asp:DropDownList ID="ddlMax" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr bgcolor="#E8F4FF">
                <td class="style1">
                    适用年份：</td>
                <td style=" padding-left:5px;">
                    <asp:DropDownList ID="ddlSuitYear" runat="server" Width="120px">
                        <asp:ListItem>---选择适用年份---</asp:ListItem>
                    </asp:DropDownList>
                &nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" Font-Size="12px" Text="(该年份以学生毕业年份为准)"></asp:Label>
                </td>
            </tr>
            <tr>
                <td style=" text-align:center; padding:5px 0 5px 0;" colspan="2">
                    <asp:Button ID="btnSubmit" runat="server" Text="提 交" CssClass="ButtonCss" 
                        Width="60px" onclick="btnSubmit_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnReset" runat="server" Text="重 置" CssClass="ButtonCss" 
                        Width="60px" onclick="btnReset_Click" CausesValidation="False" />
                </td>
            </tr>
            <tr style=" height:30px;">
                <td style="background:url(../Image/treetopbg.jpg);" colspan="2"></td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
