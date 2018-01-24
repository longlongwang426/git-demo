<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Message.aspx.cs" Inherits="Message" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
     <link href="../css/L.layout.css" type="text/css" rel="stylesheet"/>
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
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;查看公告</font>
                        </td>
                    </tr>
                </table>
       <table><tr><td class="Labels"><a href="Message.aspx" style="color:#fff">查看公告</a></td><td class="Labelf"  id="aWrite" runat="server"><a  href="../Admin/SendMessage.aspx" runat="server" style="color:#fff">发布公告</a></td></tr></table>
       <div>
          <asp:GridView ID="gvNotice" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" AutoGenerateColumns="False"  Width="100%"
               AllowPaging="True" UseAccessibleHeader="False" 
               onpageindexchanging="gvNotice_PageIndexChanging" 
               onrowdatabound="gvNotice_RowDataBound" onrowdeleting="gvNotice_RowDeleting">
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#337EB8" ForeColor="White" />
                <AlternatingRowStyle BackColor="#E8F4FF" />
                <Columns>
                   <asp:BoundField DataField="PId"  HeaderText="序号"/>
                    <asp:TemplateField HeaderText="标题">
                    <ItemTemplate>
                      <asp:HyperLink ID="HyperLink1" runat="server" Text='<%#Eval("Title")%>' NavigateUrl='<%#string.Format("DetailMessage.aspx?id={0}",Eval("NoticeNo"))%>' ></asp:HyperLink>
                      </ItemTemplate>
                      </asp:TemplateField>
                   <asp:BoundField DataField="Contents" HeaderText="内容" HeaderStyle-Width="50%"/>
                   <asp:BoundField DataField="SenderTime" HeaderText="发布时间"/>
                   <asp:CommandField ShowDeleteButton="true" HeaderText="删除" />
                </Columns> 
            </asp:GridView>
       </div>  
       <table style="width:100%;">
            <tr height="30">
                <td class="GbText" background = "../Image/treetopbg.jpg"></td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
