<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AllStuSub.aspx.cs" Inherits="Admin_AllStuSub" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="../css/L.layout.css" type="text/css" rel="Stylesheet"/>
    <style type="text/css">
       *{ font-size:"宋体"; font-size:12px;}
       #title{ text-align:center; font-size:18px; font-weight:bolder; margin-bottom:0px;}
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
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;已选题学生信息</font>
                        </td>
                    </tr>
                </table>
 <table><tr>
 <td  class="Labels"><a href="AllStuSub.aspx" class="Newbutton">已选题学生信息</a></td>
 <td class="Labelf"><a href="NoChoose.aspx" class="Newbutton">未选题学生信息</a></td>
 <td class="Labelf"><a href="HasChoosenSub.aspx" class="Newbutton">已被选题信息</a></td>
 <td class="Labelf"><a href="NoChoosenSub.aspx" class="Newbutton">未被选题信息</a></td>
 <td class="Labelf"><a href="SubAndStu.aspx" class="Newbutton">所有课题信息</a></td>
 <td><asp:DropDownList ID="ddlMajor" runat="server"  AutoPostBack="true" 
             onselectedindexchanged="ddlMajor_SelectedIndexChanged">
             <asp:ListItem Selected="True">----选择专业----</asp:ListItem></asp:DropDownList></td>
 <td><asp:Button ID="btnDown" runat="server" Text="导出已选题学生信息" CssClass="redButtonCss" 
                onclick="btnDown_Click" Width="137px"/></td>
 </tr></table>

        <div><asp:GridView ID="gvStu" runat="server" AllowPaging="true"  Width="100%"
            AutoGenerateColumns="False" UseAccessibleHeader="False" CellPadding="4"  
            PageSize="20" onselectedindexchanging="gvStu_SelectedIndexChanging" 
                onpageindexchanging="gvStu_PageIndexChanging">
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#337EB8" ForeColor="White" />
                <AlternatingRowStyle BackColor="#E8F4FF" />
                <Columns>
                <asp:BoundField DataField="PId"  HeaderText="序号"/>
                <asp:BoundField DataField="SubjectName" HeaderText="课题名" />
                <asp:BoundField DataField="StudentID" HeaderText="学号" />
                   <asp:BoundField DataField="StudentName" HeaderText="姓名" />
                   <asp:BoundField DataField="TeacherName" HeaderText="指导教师" />
                   <asp:BoundField DataField="Post" HeaderText="教师职称" />
                   <asp:BoundField DataField="SubjectType" HeaderText="课题类型" />
                   <asp:BoundField DataField="SubjectOrigin" HeaderText="课题来源" />
                   <asp:BoundField DataField="StudentLevel" HeaderText="培养层次" />
                   <asp:BoundField DataField="ProfessionName" HeaderText="专业" />
                   <asp:BoundField DataField="Class" HeaderText="班级" />
                </Columns>
        </asp:GridView></div> 
    </div>
    </form>
</body>
</html>
