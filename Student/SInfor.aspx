<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SInfor.aspx.cs" Inherits="Student_SInfor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学生个人信息管理</title>
    <link href="../css/L.layout.css"type="text/css" rel="stylesheet"/>
    <style type="text/css">
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
                    <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;学生个人信息</font></td>
                </tr>
           </table>
       </td> 
    </tr>
    <tr>
        <td>
            <table cellspacing="0" cellpadding="0" width="100%" border="0">
                <tr>
                    <td align="center" width="90" background="../image/maillistbutton2.gif" height="24">
                        <a href="../Student/SInfor.aspx" class="Newbutton"><font>&nbsp;个人信息</font></a>
                    </td>
                    <td align="right"><font>&nbsp;</font>
					</td>
                </tr>
            </table>
            <asp:DetailsView id="StudentInfomation1" runat="server" cellpadding="3" 
                bordercolor="#93BEE2" Width="100%" 
                AutoGenerateRows="False" DataKeyNames="StudentID" 
                DataSourceID="SqlDataSource1" >
                <CommandRowStyle BackColor="#337EB8" ForeColor="White" />
                <RowStyle Height="25" />
                <FieldHeaderStyle Width="150px" />
                <Fields>
                    <asp:BoundField DataField="StudentID" HeaderText="学号" ReadOnly="True" 
                        SortExpression="StudentID" />
                    <asp:BoundField DataField="StudentName" HeaderText="姓名" 
                        SortExpression="StudentName" ReadOnly="True" />
                    <asp:BoundField DataField="Sex" HeaderText="性别" SortExpression="Sex" 
                        ReadOnly="True" />
                    <asp:BoundField DataField="ProfessionName" HeaderText="专业" ReadOnly="True" 
                        SortExpression="ProfessionName" />
                    <asp:BoundField DataField="Class" HeaderText="班级" 
                        SortExpression="Class" ReadOnly="True" />
                    <asp:BoundField DataField="SubjectTime" HeaderText="开题时间" 
                        SortExpression="SubjectTime" ReadOnly="True" />
                    <asp:BoundField DataField="Phone" HeaderText="固定电话" 
                        SortExpression="Phone" />
                    <asp:BoundField DataField="Telephone" HeaderText="联系电话" 
                        SortExpression="Telephone" />
                    <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                    <asp:CommandField ShowEditButton="True" EditText="修改联系方式" />
                </Fields>
                <AlternatingRowStyle BackColor="#E8F4FF"/>
            </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:GDSConnectionString %>" 
                SelectCommand="SELECT StudentID, StudentName, Sex, StudentLevel, ProfessionName, Class, SubjectTime, Phone, Telephone, Email FROM Student WHERE (StudentID = @StudentID)" 
                
                UpdateCommand="UPDATE Student SET Phone = @Phone, Telephone = @Telephone, Email = @Email WHERE (StudentID = @StudentID)">
                <SelectParameters>
                    <asp:CookieParameter CookieName="id" DefaultValue="" Name="StudentID" 
                        Type="String" />
                </SelectParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Phone" />
                    <asp:Parameter Name="Telephone" />
                    <asp:Parameter Name="Email" Type="String" />
                    <asp:Parameter Name="StudentID" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr height="30">
        <td class="GbText" background = "../Image/treetopbg.jpg"></td>
    </tr>
    </table>
    </form>
</body>
</html>
