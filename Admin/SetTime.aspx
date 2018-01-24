<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SetTime.aspx.cs" Inherits="Admin_Time" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>无标题页</title>
    <script type="text/javascript" src="../js/My97DatePicker/WdatePicker.js"></script>
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
    <script language="ecmascript" src="../jquery/jquery.js" type="text/javascript"></script>
      <script language="ecmascript" type="text/javascript">
         $(document).ready(function(){
            $("#btnSave1").click(function(){
              if($("#tYeat").val()=="")
               { alert("毕业设计年份不能为空");return false;}
               });
                
           $("#btnSave2").click(function(){
             if($("#sBegin").val()=="")
               { alert("学生选题开始时间不能为空");return false;}
               });
                
          $("#btnSave3").click(function(){
           if($("#sEnd").val()=="")
              {  alert("学生选题结束时间不能为空");return false;}
              });
                
          $("#btnSave4").click(function(){
           if($("#tBegin").val()=="")
              { alert("教师课题上报开始时间不能为空");return false;}
              });    
              
          $("#btnSvae5").click(function(){
             if($("#tEnd").val()=="")
              { alert("教师课题上报结束时间不能为空");return false;}
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
    <table><tr><td class="Labelf"><a href="SetCollege.aspx" class="Newbutton">学院设置</a></td><td  class="Labelf"><a href="InitMajor.aspx" class="Newbutton">专业设置</a></td><td class="Labels"><a href="SetTime.aspx" class="Newbutton">时间设置</a></td></tr></table>
    <table class="GbText" style="BORDER-COLLAPSE:collapse" bordercolor="#93bee2"
					    cellspacing="1" cellpadding="1" width="100%" border="1">
       <tr bgcolor="#e8f4ff"><td align="right" width="25%">毕业设计年份：</td><td><input type="text" id="tYeat" runat="server"   readonly="readonly" onFocus="WdatePicker({startDate:'%y',dateFmt:'yyyy',alwaysUserStartDate:true})" />
           <asp:Button ID="btnSave1" runat="server" Text="保存" CssClass="redButtonCss" 
               onclick="btnSave1_Click" /></td></tr> 
        <tr><td style="height:30px; font-weight:bolder" colspan="2">教师上报课题时间设置</td></tr>
       <tr><td align="right" width="25%">开始时间：</td><td><input type="text" id="tBegin" runat="server"   readonly="readonly" onFocus="WdatePicker({startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUserStartDate:true})" />
                <asp:Button ID="btnSave4" runat="server" Text="保存" CssClass="redButtonCss" onclick="btnSave4_Click" /></td></tr>
       
       <tr bgcolor="#e8f4ff"><td align="right" width="25%">结束时间：</td><td><input type="text" id="tEnd" runat="server" readonly="readonly" onFocus="WdatePicker({startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUserStartDate:true})" />
                <asp:Button ID="btnSvae5" runat="server" Text="保存" CssClass="redButtonCss"  onclick="btnSvae5_Click" /></td></tr>
                
       <tr><td  style="height:30px; font-weight:bolder" colspan="2">学生选题时间设置</td></tr>
       <tr><td align="right" width="25%">开始时间：</td><td><input type="text" id="sBegin" runat="server"   readonly="readonly" onFocus="WdatePicker({startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUserStartDate:true})" />
           <asp:Button ID="btnSave2" runat="server" Text="保存" CssClass="redButtonCss" onclick="btnSave2_Click" /></td></tr>
           
       <tr bgcolor="#e8f4ff"><td align="right" width="25%">结束时间：</td><td><input type="text" id="sEnd" runat="server"  readonly="readonly" onFocus="WdatePicker({startDate:'%y-%M-01',dateFmt:'yyyy-MM-dd HH:mm:ss',alwaysUserStartDate:true})" />
           <asp:Button ID="btnSave3" runat="server" Text="保存" CssClass="redButtonCss" 
               onclick="btnSave3_Click" /></td></tr>
    
    </table>
    </form>
</body>
</html>
