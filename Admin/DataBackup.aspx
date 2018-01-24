<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DataBackup.aspx.cs" Inherits="Admin_DataBackup" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="../css/L.layout.css" type="text/css" rel="Stylesheet"/>
    <style type="text/css">
        *{ font-size:"宋体"; font-size:12px;
            margin-left: 0px;
        }
        body{ margin:0px;}
    </style>
        <script language="javascript" type="text/javascript" src="../jquery/jquery.js"></script>
    <script language="javascript" type="text/javascript">
    $(document).ready(function(){
        $("#btnBackup").click(function(){
          if($("#tbBackName").val()=="")
          {
             alert("请输入数据库备份文件的名称");return false;
          }
        });
})
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr height="30">
                        <td class="Header">
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;数据库维护</font>
                        </td>
                    </tr>
                </table>
         <tr>
            <td>
                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr>
                        <td class = "Labels">
                            <a href="../Admin/DataBackup.aspx" class="Newbutton"><font>&nbsp;数据库备份</font></a></td>
                        <td class = "Labelf">
                            <a href="../Admin/DataRestore.aspx" class="Newbutton"><font>&nbsp;数据库还原</font></a></td>
                        <td align="right"><font>&nbsp;</font>
					    </td>
                    </tr>
                </table>
            </td>
          </tr>
    <table cellspacing="0" cellpadding="0" width="100%" border="0">
        <tr><td style="height: 50px"><span>&nbsp;</span></td></tr>
        <tr>
         <td align="right" style="width:30%">请输入数据库备份的名称：</td>
         <td ><asp:TextBox ID="tbBackName" runat="server" Width="215px" 
                 CssClass="redButtonCss"></asp:TextBox><asp:Button ID="btnBackup" runat="server" Text="备份" CssClass="redButtonCss" onclick="btnBackup_Click"/></td>
         </tr>
         
         <tr><td><asp:Label ID="Label1" runat="server" Text=""></asp:Label></td></tr>
    </table>
    </div>
    </form>
</body>
</html>
