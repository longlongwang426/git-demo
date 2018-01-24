using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Data.SqlClient;
using System.IO;

public partial class Admin_DataBackup : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //备份
    protected void btnBackup_Click(object sender, EventArgs e)
    {
　　    string path = Server.MapPath("~/DataBackup//") +tbBackName.Text+".bak";
        try 
        { 
　　        if (File.Exists(path)) 
           { 
               ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "alert('此文件已存在,请重新输入!')", true); 
　　         return; 
           }
          Fannie.DBOperate.DBBackup("GDS",path);
          ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "alert('数据库备份成功!')", true);
          string FileNameNoExtension = System.IO.Path.GetFileNameWithoutExtension(path).ToLower();
          //获取文件后缀
          string FileExtension = System.IO.Path.GetExtension(path).ToLower();
          string FileFullName = FileNameNoExtension + FileExtension;
          Response.Clear();
          Response.Charset = "utf-8";
          Response.Buffer = true;
          this.EnableViewState = false;
          Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(FileFullName));
          Response.ContentType = "application/unknown";
          Response.WriteFile(path);
          Response.Flush();
          Response.Close();
          Response.End();
        }
        catch (Exception ms) 
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "alert('数据库备份失败!')", true); 
            Label1.Text = ms.Message.ToString();
        }
    }
}
