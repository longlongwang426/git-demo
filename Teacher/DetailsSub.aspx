<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailsSub.aspx.cs" Inherits="Teacher_DetailsSub" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
     <link href="../css/L.layout.css" type="text/css" rel="Stylesheet"/>
        <style type="text/css">
       *{ font-size:"宋体"; font-size:12px;}
       body
        {
        	margin-right:0px;
            margin-left: 0px;
            margin-top: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style=" padding:3px; width:98%;">
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr>
       <td vAlign="top" height="38">
           <table borderColor="#111111" height="1" cellSpacing="0" cellPadding="0" width="100%" border="0">
                <tr height="30">
                    <td class="GbText" background = "../Image/treetopbg.jpg">
                    <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;课题详细信息</font></td>
                </tr>
           </table>
       </td> 
    </tr>
  </table>
        <div>
           <asp:DetailsView id="dvSub" runat="server" cellpadding="3" 
                bordercolor="#93BEE2" Width="100%" 
                AutoGenerateRows="False">
                <FooterStyle HorizontalAlign="Center" />
                <CommandRowStyle BackColor="#337EB8" ForeColor="White" />
                <RowStyle Height="25" />
                <FieldHeaderStyle Width="20%" />
                <FooterTemplate>
                    <input id="back" type="button" class="redButtonCss" value="返回" onclick="javascript:parent.frames['main'].history.go(-1)"/>
                </FooterTemplate>
                <Fields>
                    <asp:BoundField DataField="SubjectName" HeaderText="课题名" 
                        SortExpression="SubjectName" />
                    <asp:BoundField DataField="SuitProfession" HeaderText="适用专业名" 
                        SortExpression="SuitProfession" />
                    <asp:BoundField DataField="SuitLevel" HeaderText="适用层次" 
                        SortExpression="SuitLevel" />
                    <asp:BoundField DataField="SubjectType" HeaderText="课题类型" 
                        SortExpression="SubjectType" />
                    <asp:BoundField DataField="SubjectOrigin" HeaderText="课题来源" 
                        SortExpression="SubjectOrigin" />
                    <asp:BoundField DataField="SubjectNewOld" HeaderText="课题新旧" 
                        SortExpression="SubjectNewOld" />
                        <asp:TemplateField HeaderText="课题工作量是否适中"><ItemTemplate><asp:CheckBox ID="cbwfit" runat="server" Enabled="false" Checked='<%#Eval("SubjectWorkload") %>'/></ItemTemplate></asp:TemplateField>
                     <asp:TemplateField HeaderText="课题是否符合目标要求" ><ItemTemplate><asp:CheckBox ID="cbfit" runat="server" Enabled="false" Checked='<%#Eval("SubjectRequire") %>'/></ItemTemplate></asp:TemplateField>
                    <asp:BoundField DataField="n1" HeaderText="指导老师1" 
                        SortExpression="n1" />
                        <asp:BoundField DataField="p1" HeaderText="职称" 
                        SortExpression="p1" />
                    <asp:BoundField DataField="n2" HeaderText="指导老师2" 
                        SortExpression="n2" />
                        <asp:BoundField DataField="p2" HeaderText="职称" 
                        SortExpression="p2" />
                    <asp:TemplateField HeaderText="简介:">
                        <ItemTemplate>
                            <asp:TextBox ID="tbMemo" Text='<%#Eval("Memo")%>' runat="server" ReadOnly="true" TextMode="MultiLine" Width="500px" Height="160px"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="SuitYear" HeaderText="课题年份" 
                        SortExpression="SuitYear" />
                    <asp:BoundField DataField="MaxPeople" HeaderText="该题最大可选人数" 
                        SortExpression="MaxPeople" />
                    <asp:BoundField DataField="NowPeople" HeaderText="已选人数" 
                        SortExpression="NowPeople" />
                    <asp:CheckBoxField DataField="IsCheck" HeaderText="审核状态" />
                </Fields>
                <AlternatingRowStyle BackColor="#E8F4FF"/>
            </asp:DetailsView>
        </div>
    </div>
    </form>
</body>
</html>
