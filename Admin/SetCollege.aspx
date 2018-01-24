<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SetCollege.aspx.cs" Inherits="Admin_SetCollege" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <link href="../css/L.layout.css" type="text/css" rel="Stylesheet"/>
    <style type="text/css">
        body{ margin: 0px; padding:0;}
    </style>
    <script language="javascript" type="text/javascript" src="../jquery/jquery.js"></script>
    <script language="javascript" type="text/javascript">
    $(document).ready(function(){
        $("#btnOK").click(function(){
          if($("#tbCollege").val()=="")
          {
             alert("请输入学院名称");return false;
          }
        });
})
    </script>
</head>
<body>
    <form id="form1" runat="server">
<div style="margin:0">

            <table bordercolor="#111111" height="1" cellspacing="0" cellpadding="0" width="100%" border="0">
                    <tr height="30">
                        <td class="Header">
                            <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;系统配置</font>
                        </td>
                    </tr>
                </table>
    <table>
       <tr> 
          <td class="Labels"><a href="SetCollege.aspx" class="Newbutton">学院设置</a></td>
          <td  class="Labelf"><a href="InitMajor.aspx" class="Newbutton">专业设置</a></td>
          <td class="Labelf"><a href="SetTime.aspx" class="Newbutton">时间设置</a></td>
      </tr>
   </table>
        <table class="GbText" style="BORDER-COLLAPSE:collapse" bordercolor="#93bee2"
					    cellspacing="0" cellpadding="0" width="100%" border="1">
           <tr bgcolor="#e8f4ff"><td align="right" width="25%">学院名称:</td><td>
               <asp:TextBox ID="tbCollege" runat="server" Width="361px"></asp:TextBox>
                    <asp:Button ID="btnOK" runat="server" CssClass="redButtonCss" Text="保存" 
                        onclick="btnOK_Click" /></td></tr>
        </table>
</div>
    </form>
</body>
</html>
