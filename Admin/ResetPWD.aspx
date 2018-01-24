<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ResetPWD.aspx.cs" Inherits="Admin_ResetPWD" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="../css/L.layout.css" type="text/css" rel="Stylesheet"/>
    <script src="../jquery/jquery.js" type="text/javascript"></script>
    <script type="text/javascript">
      $(document).ready(function(){
       $("#btnSelect").click(function(){
        if($("#tbID").val()=="")
        {
          alert("请输入需要重置密码的学生学号");return false;
        }
       })
       $("#btnOk").click(function(){
        if($("#tbID").val()=="")
        {
          alert("请输入需要重置密码的学生学号");return false;
        }
       })
       $("#btnTSelect").click(function(){
        if($("#tbTID").val()=="")
        {
          alert("请输入需要重置密码的教师账号");return false;
        }
       })
       $("#Button2").click(function(){
        if($("#tbTID").val()=="")
        {
          alert("请输入需要重置密码的教师账号");return false;
        }
       })
      })
    </script>
   <style type="text/css">
       *{ font-size:"宋体"; font-size:12px;}
       body{margin:0px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr height="30">
                        <td class="Header" style="padding-left:10px;">
                            <font color="#003366" size="2">账户维护</font>
                        </td>
                    </tr>
                </table>
 <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
     <tr><td align="right">请输入需要重置密码的学生学号：</td><td style="width:10%"><asp:TextBox ID="tbID" runat="server" Width="200px"></asp:TextBox></td><td><asp:Button ID="btnSelect" 
        runat="server" Text="查询" CssClass="redButtonCss" onclick="btnSelect_Click" /><asp:Button ID="btnOk" 
        runat="server" Text="重置学生密码为该学生学号" CssClass="redButtonCss" 
         onclick="btnOk_Click" Width="179px"/></td>
     </tr>
     <tr><td align="right">请输入需要重置密码的教师账号：</td><td style="width:10%"><asp:TextBox ID="tbTID" runat="server" Width="200px"></asp:TextBox></td><td>
                <asp:Button ID="btnTSelect" 
        runat="server" Text="查询" CssClass="redButtonCss" onclick="btnTSelect_Click"/><asp:Button ID="Button2" 
        runat="server" Text="重置教师密码为该教师的账号" CssClass="redButtonCss" Width="179px" 
                    onclick="Button2_Click"/></td></tr>
  </table>
<div>
<asp:GridView ID="gvStudent" runat="server" AutoGenerateColumns="False" Width="100%"
        UseAccessibleHeader="False">
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333"   Width="100%" 
                   HorizontalAlign="Center"/>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#337EB8" ForeColor="White" HorizontalAlign="Center"/>
                <AlternatingRowStyle BackColor="#E8F4FF" />
                   <Columns>
                   <asp:BoundField DataField="StudentID" HeaderText="学号" HeaderStyle-Width="5%">
<HeaderStyle Width="5%"></HeaderStyle>
                       </asp:BoundField>
                   <asp:BoundField DataField="StudentName"  HeaderText="姓名"  HeaderStyle-Width="10%">
<HeaderStyle Width="10%"></HeaderStyle>
                       </asp:BoundField>
                   <asp:BoundField DataField="Sex"  HeaderText="性别" HeaderStyle-Width="5%">
<HeaderStyle Width="5%"></HeaderStyle>
                       </asp:BoundField>
                    <asp:BoundField DataField="StudentLevel"  HeaderText="类别" HeaderStyle-Width="10%">
<HeaderStyle Width="10%"></HeaderStyle>
                       </asp:BoundField>
                   <asp:BoundField DataField="ProfessionName"  HeaderText="专业" HeaderStyle-Width="10%">
<HeaderStyle Width="10%"></HeaderStyle>
                       </asp:BoundField>
                   <asp:BoundField DataField="Class"  HeaderText="班级" HeaderStyle-Width="5%">
<HeaderStyle Width="5%"></HeaderStyle>
                       </asp:BoundField>
                   <asp:BoundField DataField="SubjectTime"  HeaderText="毕业设计选题时间" 
                           HeaderStyle-Width="10%">
<HeaderStyle Width="10%"></HeaderStyle>
                       </asp:BoundField>
                   <asp:BoundField DataField="Phone"  HeaderText="固定电话" HeaderStyle-Width="10%">
<HeaderStyle Width="10%"></HeaderStyle>
                       </asp:BoundField>
                   <asp:BoundField DataField="Telephone"  HeaderText="手机" HeaderStyle-Width="10%">
<HeaderStyle Width="10%"></HeaderStyle>
                       </asp:BoundField>
                   <asp:BoundField DataField="Email"  HeaderText="电子邮件" HeaderStyle-Width="10%">
<HeaderStyle Width="10%"></HeaderStyle>
                       </asp:BoundField>
                   <asp:TemplateField HeaderText="审核状态"  HeaderStyle-Width="3%"><ItemTemplate><asp:CheckBox ID="cbCheck" runat="server" Enabled="false" Checked='<%#Eval("IsAccept") %>'/></ItemTemplate>

<HeaderStyle Width="3%"></HeaderStyle>

                       </asp:TemplateField>
                </Columns>
</asp:GridView>
<asp:GridView ID="gvTeacher" runat="server" AutoGenerateColumns="False" Width="100%"
        UseAccessibleHeader="False">
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333"   Width="100%" 
                   HorizontalAlign="Center"/>
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#337EB8" ForeColor="White" HorizontalAlign="Center"/>
                <AlternatingRowStyle BackColor="#E8F4FF" />
                   <Columns>
                   <asp:BoundField DataField="TeacherID" HeaderText="账号" HeaderStyle-Width="10%">
<HeaderStyle Width="10%"></HeaderStyle>
                       </asp:BoundField>
                   <asp:BoundField DataField="TeacherName"  HeaderText="姓名"  HeaderStyle-Width="10%">
<HeaderStyle Width="10%"></HeaderStyle>
                       </asp:BoundField>
                   <asp:BoundField DataField="Sex"  HeaderText="性别" HeaderStyle-Width="10%">
<HeaderStyle Width="10%"></HeaderStyle>
                       </asp:BoundField>
                    <asp:BoundField DataField="Post"  HeaderText="职称" HeaderStyle-Width="10%">
<HeaderStyle Width="10%"></HeaderStyle>
                       </asp:BoundField>
                   <asp:BoundField DataField="Phone"  HeaderText="固定电话" HeaderStyle-Width="15%">
<HeaderStyle Width="15%"></HeaderStyle>
                       </asp:BoundField>
                   <asp:BoundField DataField="Telephone"  HeaderText="手机" HeaderStyle-Width="15%">
<HeaderStyle Width="15%"></HeaderStyle>
                       </asp:BoundField>
                   <asp:BoundField DataField="Email"  HeaderText="电子邮件" HeaderStyle-Width="20%">
<HeaderStyle Width="20%"></HeaderStyle>
                       </asp:BoundField>
                  
                </Columns>
</asp:GridView>
</div>
    </form>
</body>
</html>
