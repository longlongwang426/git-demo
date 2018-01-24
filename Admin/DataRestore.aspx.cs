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

public partial class Admin_DataRestore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    //还原
    protected void btnRestor_Click(object sender, EventArgs e)
    {
        if (fupload.HasFile)
        {
            string fileExtension = System.IO.Path.GetExtension(fupload.FileName).ToLower();
            if (fileExtension != ".bak")
            {
                ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "alert('请选择正确的数据库备份文件!')", true);
            }
            else
            {
                //获取文件名
                string FileNameNoExtension = System.IO.Path.GetFileNameWithoutExtension(fupload.FileName).ToLower();
                //获取文件后缀
                string FileExtension = System.IO.Path.GetExtension(fupload.FileName).ToLower();

                string filepath = Server.MapPath("~/DataBackup//") + fupload.FileName;
                if (!File.Exists(filepath))
                {
                    fupload.SaveAs(filepath);
                }
                else
                {
                    try
                    {
                        Fannie.DBOperate.DBRestore("GDS", filepath);
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "alert('数据库还原成功!')", true);
                    }
                    catch (Exception mes)
                    {
                        ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "alert('数据库还原失败!')", true);
                        Label1.Text = mes.Message;
                    }
                }
            }
        }
        else
        {
            ClientScript.RegisterClientScriptBlock(this.GetType(), "Error", "alert('请选择数据库备份文件!')", true);
        }
    }
}
