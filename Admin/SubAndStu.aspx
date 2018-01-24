<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SubAndStu.aspx.cs" Inherits="Admin_SubAndStu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
     <script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
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
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;所有课题信息</font>
                        </td>
                    </tr>
                </table>
 <table><tr>
 <td  class="Labelf"><a href="AllStuSub.aspx" class="Newbutton">已选课学生信息</a></td>
 <td class="Labelf"><a href="NoChoose.aspx" class="Newbutton">未选课学生信息</a></td>
 <td class="Labelf"><a href="HasChoosenSub.aspx" class="Newbutton">已被选题信息</a></td>
 <td class="Labelf"><a href="NoChoosenSub.aspx" class="Newbutton">未被选课题信息</a></td>
 <td class="Labels"><a href="SubAndStu.aspx" class="Newbutton">所有课题信息</a></td>
 <td><asp:Button ID="btnDown" runat="server" Text="导出所有课题信息" CssClass="redButtonCss" 
         onclick="btnDown_Click" Width="120px"/></td>
 </tr></table>

  <div>
    <asp:GridView ID="gvSub" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" AutoGenerateColumns="False"  Width="100%"
               AllowPaging="True" UseAccessibleHeader="False" 
               onpageindexchanging="gvSub_PageIndexChanging" PageSize="20" 
          AllowSorting="True">
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#337EB8" ForeColor="White" />
                <AlternatingRowStyle BackColor="#E8F4FF" />
                <Columns>
                   <asp:BoundField DataField="PId"  HeaderText="序号"/>
                      <asp:BoundField DataField="SubjectName" HeaderText="课题名称" />
                   <asp:BoundField DataField="SuitProfession" HeaderText="适用专业" HeaderStyle-Width="10%"/>
                   <asp:BoundField DataField="SuitLevel" HeaderText="适用层次" />
                   <asp:BoundField DataField="SubjectType" HeaderText="课题类型" />
                   <asp:BoundField DataField="SubjectOrigin" HeaderText="课题来源" />
        <asp:TemplateField HeaderText="课题工作量是否适中"><ItemTemplate><asp:CheckBox ID="cbCheck" runat="server" Checked='<%#Eval("SubjectWorkload") %>' Enabled="false"/></ItemTemplate></asp:TemplateField>
      <asp:TemplateField HeaderText="是否达到课题要求"><ItemTemplate><asp:CheckBox ID="cbCheck" runat="server" Checked='<%#Eval("SubjectRequire") %>' Enabled="false"/></ItemTemplate></asp:TemplateField>
                   <asp:BoundField DataField="n1" HeaderText="指导教师"/>
                   <asp:BoundField DataField="n2" HeaderText="指导教师" /> 
                   <asp:BoundField DataField="Memo" HeaderText="简介" />
                   <asp:BoundField DataField="MaxPeople" HeaderText="最大选课人数" />
                   <asp:BoundField DataField="NowPeople" HeaderText="已选人数" />
                   <asp:TemplateField HeaderText="审核状态"><ItemTemplate><asp:CheckBox ID="cbCheck" runat="server" Checked='<%#Eval("IsCheck") %>' Enabled="false"/></ItemTemplate></asp:TemplateField>
                </Columns>   
            </asp:GridView>
    </div>
</div>
    </form>
</body>
</html>
