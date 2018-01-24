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
using System.IO;
using System.Data.OleDb;

public partial class Admin_ImportTe : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnImport_Click(object sender, EventArgs e)
    {
        if (fuTea.HasFile)
        {
            string filename = Server.HtmlEncode(fuTea.FileName);
            string extention = Path.GetExtension(filename);
            if (extention != ".xls" && extention != ".xlsx")
            {
                Response.Write("<script>alert('请选择正确的Excel文件!');</script>");
                return;
            }
            string upfilename = "~/DownLoadZone/" + DateTime.Now.ToString("yyyyMMddHHmmss") + extention;
            fuTea.SaveAs(Server.MapPath(upfilename));
            string ExcelConn = "";
            if (extention == ".xls")
            {
                // Excel 2007以前的版本
                ExcelConn = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + Server.MapPath(upfilename) + ";Extended Properties='Excel 8.0;HDR=YES;IMEX=2'";
            }
            else
            {
                // Excel 2007
                ExcelConn = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + Server.MapPath(upfilename) + ";Extended Properties='Excel 12.0 Xml;HDR=YES;IMEX=2'";
            }
            DataTable dt = GetData(ExcelConn);

            File.Delete(Server.MapPath(upfilename));
            Fannie.Teacher t = new Fannie.Teacher();
            if (t.ImportTea(dt))
            {
                Response.Write("<script>alert('导入成功!');</script>");
            }
            else
            {
                Response.Write("<script>alert('导入失败，请检查是否EXCEL按照模版的样式输入数据或者是否有重复的教师工资号');</script>");
            }
        }
    }
    private DataTable GetData(string connection)
    {
        DataTable dt = new DataTable();
        OleDbConnection conn = new OleDbConnection(connection);
        OleDbDataAdapter sda = new OleDbDataAdapter("select * from [Sheet1$]", conn);
        sda.Fill(dt);
        return dt;
    }
    protected void btnDownModle_Click(object sender, EventArgs e)
    {
        string path = Server.MapPath("~/Files//teacher.xls");
        //获取文件名
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
}
