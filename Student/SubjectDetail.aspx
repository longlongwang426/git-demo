<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubjectDetail.aspx.cs" Inherits="Student_SubjectDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>我的课题</title>
    <link href="../css/L.layout.css"type="text/css" rel="stylesheet"/>
    <style type="text/css">
      *{ font-size:9pt;}
      body
        {
        	margin-right:0px;
            margin-left: 0px;
            margin-top: 0px;
        }
    </style>
</head>

<body>
    <form id="information" runat="server">
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr>
       <td valign="top" height="38">
           <table bgcolor="#111111" cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td class="Header" height="30">
                    <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;课题信息</font>
                    </td>
                </tr>
           </table>
       </td> 
    </tr>
    <tr>
        <td>
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td align="center" width="90" background="../image/maillistbutton2.gif" height="24">
                        <a href="../Student/SubjectDetail.aspx" class="Newbutton"><font>&nbsp;课题信息</font></a></td>
                    <td align="right"><font> &nbsp;</font>
					</td>
                </tr>
            </table>
            <asp:DetailsView id="SubjectDetail1" runat="server" cellpadding="3" 
                bordercolor="#93BEE2" Width="100%" 
                AutoGenerateRows="False">
                <FooterStyle HorizontalAlign="Center" />
                <CommandRowStyle BackColor="#337EB8" ForeColor="White" />
                <RowStyle Height="25" />
                <FieldHeaderStyle Width="20%" />
                <FooterTemplate>
                    <asp:Button ID="ChooseSubject" runat="server" CssClass="redButtonCss"  Text="提交选择" OnClick="ChooseSubject_Click" OnClientClick="javascript:return confirm('请核实该课题所适用的专业。确定要选择该课题吗？')" />
                    <input type="button" value="返回"      
                       onclick="history.back()" class="redButtonCss" />   
                </FooterTemplate>
                <Fields>
                    <asp:BoundField DataField="SubjectName" HeaderText="课题名" 
                        SortExpression="SubjectName" />
                    <asp:BoundField DataField="SuitProfession" HeaderText="适用专业" 
                        SortExpression="SuitProfession" />
                    <asp:BoundField DataField="SuitLevel" HeaderText="适用层次" 
                        SortExpression="SuitLevel" />
                    <asp:BoundField DataField="SubjectType" HeaderText="课题类型" 
                        SortExpression="SubjectType" />
                    <asp:BoundField DataField="SubjectOrigin" HeaderText="课题来源" 
                        SortExpression="SubjectOrigin" />
                    <asp:BoundField DataField="SubjectNewOld" HeaderText="课题新旧" 
                        SortExpression="SubjectNewOld" />
                    <asp:CheckBoxField DataField="SubjectWorkload" HeaderText="课题工作量是否适中" 
                        ReadOnly="True" SortExpression="SubjectWorkload" />
                    <asp:CheckBoxField DataField="SubjectRequire" HeaderText="课题是否符合目标要求" 
                        ReadOnly="True" SortExpression="SubjectRequire" />
                    <asp:BoundField DataField="SuitYear" HeaderText="课题年份" 
                        SortExpression="SuitYear" />
                    <asp:BoundField DataField="N1" HeaderText="指导老师1" 
                        SortExpression="N1" />
                    <asp:BoundField DataField="P1" HeaderText="指导老师职称" 
                        SortExpression="P1" />
                    <asp:BoundField DataField="N2" HeaderText="指导老师2" 
                        SortExpression="N2" />
                    <asp:BoundField DataField="P2" HeaderText="指导老师职称" 
                        SortExpression="P2" />
                    <asp:BoundField DataField="Memo" HeaderText="简介" SortExpression="Memo" />
                    <asp:BoundField DataField="MaxPeople" HeaderText="该题最大可选人数" 
                        SortExpression="MaxPeople" />
                    <asp:BoundField DataField="NowPeople" HeaderText="已选人数" 
                        SortExpression="NowPeople" />
                </Fields>
                <AlternatingRowStyle BackColor="#E8F4FF"/>
            </asp:DetailsView>
        </td>
    </tr>
    <tr height="30">
        <td class="GbText" background = "../Image/treetopbg.jpg" align =center>
            &nbsp;&nbsp;&nbsp;&nbsp;</td>
    </tr>
    </table>
    
    </form>
</body>
</html>