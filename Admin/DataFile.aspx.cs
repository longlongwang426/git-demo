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

public partial class Admin_DataFile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetFileBind();
        }
    }

    private void GetFileBind()
    {
        Fannie.Mail mail = new Fannie.Mail();
        DataSet ds = mail.GetMail("1",Request.Cookies["id"].Value.ToString(),"归档材料");
        DataColumn dc = new DataColumn();
        dc.ColumnName = "AID";
        ds.Tables[0].Columns.Add(dc);
        for (int i = 0; i < ds.Tables[0].Rows.Count;i++ )
        {
            ds.Tables[0].Rows[i]["AID"] = (i + 1).ToString();
        }
        gvDataFile.DataSource = ds;
        gvDataFile.DataBind();
    }

    protected void DownloadBtn_Click(object sender, EventArgs e)
    {
        Fannie.Mail dz2 = new Fannie.Mail();
        DataTable dt2 = new DataTable();
        ImageButton img = (ImageButton)sender;
       dt2 = dz2.GetOneMail(1,Convert.ToInt32(img.CommandArgument.ToString())).Tables[0];
       //dt2 = dz2.GetOneMail(1,8).Tables[0];
        //获取文件名
        string FileNameNoExtension = System.IO.Path.GetFileNameWithoutExtension(dt2.Rows[0]["AccessoryPath"].ToString()).ToLower();
        //获取文件后缀
        string FileExtension = System.IO.Path.GetExtension(dt2.Rows[0]["AccessoryPath"].ToString()).ToLower();
        string FileFullName = FileNameNoExtension + FileExtension;
        string filepath = Server.MapPath("~/") + "Mail\\" + FileFullName;
        if (dt2.Rows[0]["AccessoryPath"].ToString() != "")
        {
            Response.Clear();
            Response.Charset = "utf-8";
            Response.Buffer = true;
            this.EnableViewState = false;
            Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(FileFullName));
            //Response.Redirect(dt2.Rows[0]["filepath"].ToString());
            Response.ContentType = "application/unknown";
            Response.WriteFile(filepath);
            Response.Flush();
            Response.Close();
            Response.End();
        }
        else
        {
            Response.Write("<script>alert('该文件不存在！');window.history.back();</script>");
        }
    }
    protected void gvDataFile_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvDataFile.PageIndex = e.NewPageIndex;
        GetFileBind();
    }

    protected void btByTea_Click(object sender, EventArgs e)
    {
        Fannie.Mail mail = new Fannie.Mail();
        DataSet ds = mail.GetMailByTea(Request.Cookies["id"].Value.ToString(), "归档材料");
        DataColumn dc = new DataColumn();
        dc.ColumnName = "AID";
        ds.Tables[0].Columns.Add(dc);
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["AID"] = (i + 1).ToString();
        }
        gvDataFile.DataSource = ds;
        gvDataFile.DataBind();
    }
    protected void btByDate_Click(object sender, EventArgs e)
    {
        GetFileBind();
    }
}
