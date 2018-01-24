<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InitMajor.aspx.cs" Inherits="Admin_InitMajor" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>专业设置</title>
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
    <script language="javascript" type="text/javascript" src="../jquery/jquery.js"></script>
    <script language="javascript" type="text/javascript">
    $(document).ready(function(){
    $("#btnNew").click(function(){
      if($("#tbNewMajor").val()=="")
      {
         alert("请输入专业名");return false;
      }
    });
})
    </script>
</head>
<body>
    <form id="form1" runat="server">
             <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr height="30">
                        <td class="Header">
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;系统配置</font>
                        </td>
                    </tr>
                </table>
         <table><tr><td class="Labelf"><a href="SetCollege.aspx" class="Newbutton">学院设置</a></td><td  class="Labels"><a href="InitMajor.aspx" class="Newbutton">专业设置</a></td><td class="Labelf"><a href="SetTime.aspx" class="Newbutton">时间设置</a></td></tr></table>
            <asp:GridView ID="gvMajor" runat="server" CellPadding="4" ForeColor="#333333" 
                GridLines="None" AutoGenerateColumns="False"  Width="100%"
                onrowdatabound="gvMajor_RowDataBound" onrowdeleting="gvMajor_RowDeleting" 
                onrowcancelingedit="gvMajor_RowCancelingEdit" onrowediting="gvMajor_RowEditing" 
                onrowupdating="gvMajor_RowUpdating" AllowPaging="True" 
            UseAccessibleHeader="False">
                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                <HeaderStyle BackColor="#337EB8" ForeColor="White" />
                <AlternatingRowStyle BackColor="#E8F4FF" />
                <Columns>
                   <asp:TemplateField   HeaderStyle-Width="10%"><ItemTemplate><asp:CheckBox ID="cbSelect" runat="server"/></ItemTemplate></asp:TemplateField>
                   <asp:BoundField DataField="AutoId"  HeaderText="序号"  HeaderStyle-Width="10%"/>
                   <asp:TemplateField HeaderText="专业名称"  HeaderStyle-Width="30%"><ItemTemplate><asp:TextBox ID="tbMajor" runat="server" Text='<%#Bind("ProfessionName") %>' Width="200PX" ReadOnly="true"></asp:TextBox></ItemTemplate></asp:TemplateField>
                   <asp:CommandField ShowEditButton="true" HeaderText="编辑" />
                   <asp:CommandField ShowDeleteButton="true" HeaderText="删除" />
                </Columns>
            </asp:GridView>
            <div>
                <asp:CheckBox ID="cb2" runat="server" Text="全选" 
                    oncheckedchanged="cb2_CheckedChanged" AutoPostBack="True" />
                <asp:Button ID="btnDelete" runat="server"  Text="删除"  CssClass="redButtonCss" onclick="btnDelete_Click"/>
                <asp:Button ID="btEdit" runat="server"  Text="编辑"  CssClass="redButtonCss" onclick="btEdit_Click"/>
                 <asp:Button ID="btnUpdate" runat="server" Text="更新"  CssClass="redButtonCss" onclick="btnUpdate_Click" />
                 <asp:Button ID="btnCancle" runat="server"  Text="取消"  CssClass="redButtonCss"
                    onclick="btnCancle_Click"/>
                </div>
    <table class="GbText" style="BORDER-COLLAPSE:collapse" bordercolor="#93bee2"
					    cellspacing="1" cellpadding="1" width="100%" border="1"><tr bgcolor="#e8f4ff"><td align="right" width="25%">新建专业：</td><td>
            <asp:TextBox ID="tbNewMajor" runat="server" Width="263px"></asp:TextBox><asp:Button ID="btnNew" runat="server"  Text="插入专业"  CssClass="redButtonCss" onclick="btnNew_Click" /></td></tr></table></form>
</body>
</html>
