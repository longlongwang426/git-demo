<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MyStudents.aspx.cs" Inherits="Teacher_MyStudents" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
                    <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;本组学生信息</font>
                </td>
            </tr>
    </table>
    <table>
            <tr>
                <td class="Labels"><a href="MyStudents.aspx" style="color:#fff">本组学生信息</a></td>
                <td align="right"><font>&nbsp;</font>
            </tr>
        </table>
          <div>
            <asp:GridView ID="gvStudent" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" AutoGenerateColumns="False"   Width="100%"
                   UseAccessibleHeader="False" 
                  AllowPaging="True" onpageindexchanging="gvStudent_PageIndexChanging" 
                  PageSize="20">
                <HeaderStyle BackColor="#337EB8" ForeColor="White" />
                <AlternatingRowStyle BackColor="#E8F4FF" />
                <Columns>
                   <asp:BoundField DataField="AutoId"  HeaderText="序号"/>
                   <asp:BoundField DataField="SubjectName"  HeaderText="课题名称"/>
                   <asp:HyperLinkField DataTextField="StudentID" HeaderText="学号" 
                        NavigateUrl="~/Teacher/StuDetail.aspx" DataNavigateUrlFields="StudentID" 
                        DataNavigateUrlFormatString="~/Teacher/StuDetail.aspx?id={0}" 
                        DataTextFormatString="{0}"/>
                   <asp:BoundField DataField="StudentName"  HeaderText="姓名"/>
                   <asp:BoundField DataField="Sex"  HeaderText="性别"/>
                    <asp:BoundField DataField="StudentLevel"  HeaderText="类别"/>
                   <asp:BoundField DataField="ProfessionName"  HeaderText="专业"/>
                   <asp:BoundField DataField="Class"  HeaderText="班级"/>
                   <asp:BoundField DataField="SubjectTime"  HeaderText="毕业设计选题时间"/>
                   <asp:BoundField DataField="Phone"  HeaderText="固定电话"/>
                   <asp:BoundField DataField="Telephone"  HeaderText="手机"/>
                   <asp:BoundField DataField="Email"  HeaderText="电子邮件"/>
                </Columns>
            </asp:GridView></div>
            <table style="width:100%;">
                <tr>
                <td height="40">
                    <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td align="center" width="100%" height="24">
                                <asp:Label ID="Label1" runat="server" Text="还没有学生选择您的课题！"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>            
            </tr>
            </table>
            <table style="width:100%;">
            <tr height="30">
                <td class="GbText" background = "../Image/treetopbg.jpg"></td>
            </tr>
        </table>         
        </div>
    </form>
</body>
</html>
