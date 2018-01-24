<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MySubjects.aspx.cs" Inherits="Teacher_MySubjects" %>

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
                            <td align="center" width="90" background="../image/maillistbutton2.gif" height="24" style=" border:0;">
                                <a href="MySubjects.aspx" class="Newbutton"><font>&nbsp;我的课题</font></a></td>
                            <td align="center" width="90" background="../image/maillistbutton1.gif" height="24" style=" border:0;">
                                <a href="PublicSub.aspx" class="Newbutton"><font>&nbsp;申报课题</font></a></td>
                            <td align="right"><font>&nbsp;</font></td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <table class="table">
            
            <tr>
        <td>
          <asp:GridView ID="gvSub" runat="server" CellPadding="4" ForeColor="#E8F4FF" 
                GridLines="None" AutoGenerateColumns="False"  Width="100%"
                onrowdeleting="gvSub_RowDeleting" 
               AllowPaging="True" UseAccessibleHeader="False" 
               onpageindexchanging="gvSub_PageIndexChanging" PageSize="20">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="White" ForeColor="#006699" />
                <PagerStyle BackColor="#E8F4FF" ForeColor="#006699" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#337FB2" Font-Bold="True" ForeColor="#E8F4FF" />
                <EditRowStyle BackColor="#CCCCFF"/>
                <AlternatingRowStyle BackColor="#E8F4FF" />
                <Columns>
                   <asp:BoundField DataField="PId"  HeaderText="序号">
                       <ItemStyle Width="4%" />
                    </asp:BoundField>
                   <asp:TemplateField HeaderText="课题名称">
                    <ItemTemplate>
                      <asp:HyperLink ID="HyperLink1" runat="server" Text='<%#Eval("SubjectName")%>' NavigateUrl='<%#string.Format("~/Teacher/ModifySub.aspx?id={0}",Eval("SubjectID"))%>' ></asp:HyperLink>
                    </ItemTemplate>
                       <ItemStyle Width="15%" />
                   </asp:TemplateField>
                   <asp:TemplateField HeaderText="主要内容">
                    <ItemTemplate>
                      <asp:HyperLink ID="HyperLink1" runat="server" Text='<%#Eval("Memo")%>' NavigateUrl='<%#string.Format("~/Teacher/ModifySub.aspx?id={0}",Eval("SubjectID"))%>' ></asp:HyperLink>
                    </ItemTemplate>
                       <ItemStyle Width="25%" />
                   </asp:TemplateField>
                   <asp:BoundField DataField="n1" HeaderText="指导教师" >
                       <ItemStyle Width="8%" />
                    </asp:BoundField>
                   <asp:BoundField DataField="n2" HeaderText="指导教师" >
                       <ItemStyle Width="8%" />
                    </asp:BoundField>

                   <asp:BoundField DataField="MaxPeople" HeaderText="最大选课人数" >
                       <ItemStyle Width="10%" />
                    </asp:BoundField>
                   
                   <asp:BoundField DataField="NowPeople" HeaderText="已选人数" >
                       <ItemStyle Width="8%" />
                    </asp:BoundField>
                   <asp:BoundField DataField="SuitYear" HeaderText="开题时间" >
                       <ItemStyle Width="8%" />
                    </asp:BoundField>
                   <asp:CheckBoxField DataField="IsCheck" HeaderText="审核状态">
                        <ItemStyle Width="8%" />
                    </asp:CheckBoxField>
                </Columns>   
            </asp:GridView>
            </td>
        </tr>
        <tr>
            <td height="40">
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                        <tr>
                            <td align="center" width="100%" height="24">
                                <asp:Label ID="Label1" runat="server" Text="您尚未申报课题！"></asp:Label>
                            </td>
                        </tr>
                    </table>
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
