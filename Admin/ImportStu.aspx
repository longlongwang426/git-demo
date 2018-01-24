<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ImportStu.aspx.cs" Inherits="Admin_ImportStu" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
        <link href="../css/L.layout.css" type="text/css" rel="Stylesheet"/>
        <style type="text/css">
     body{ margin:0;font-size:12px;}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
  <table cellspacing="0" cellpadding="0" width="100%" border="0">
    <tr>
       <td vAlign="top" height="38">
           <table borderColor="#111111" height="1" cellSpacing="0" cellPadding="0" width="100%" border="0">
                <tr height="30">
                    <td class="GbText" background = "../Image/treetopbg.jpg">
                    <font color="#003366" size="2">&nbsp;&nbsp;&nbsp;学生信息导入</font></td>
                </tr>

           </table>
       </td> 
    </tr>
  </table>
        <table width="100%">
        <tr align="center">
          <td><asp:FileUpload ID="fuStu" runat="server"  CssClass="redButtonCss" Width="400px" />
           <asp:Button ID="btnImport" runat="server" Text="导入"  CssClass="redButtonCss" onclick="btnImport_Click" />
              <asp:Button ID="btnDownModle" runat="server" Text="下载学生信息模板"  
                  CssClass="redButtonCss" onclick="btnDownModle_Click" Width="112px"/></td>
        </tr>
        <tr align="center"><td>注意：请先下载学生信息模版，根据模版的格式制作EXCEL文件，再通过此方式导入教师信息</td></tr>
        </table>
    </div>
    </form>
</body>
</html>
