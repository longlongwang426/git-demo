using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;

public partial class Public_DownloadZone_ZoneDownload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Dtbind();
        }
    }

    public void Dtbind()
    {
        ZoneList.DataKeyNames = new string[] { "DataNo" };
        Fannie.DownloadZone dz1 = new Fannie.DownloadZone();
        DataSet ds1 =new DataSet();
        DataTable dt1 = new DataTable();
        ds1 = dz1.Getfile();
        dt1 = ds1.Tables[0];
        for (int i = 0; i < dt1.Rows.Count; i++)
        {
            dt1.Rows[i]["title"] = SubStr(Convert.ToString(dt1.Rows[i]["title"]), 40);
            dt1.Rows[i]["describe"] = SubStr(Convert.ToString(dt1.Rows[i]["describe"]), 50);
        }
        ZoneList.DataSource = dz1.Getfile();
        ZoneList.DataBind();
    }

    protected void DownloadBtn_Click(object sender, ImageClickEventArgs e)
    {
        Fannie.DownloadZone dz2 = new Fannie.DownloadZone();
        DataTable dt2 = new DataTable();
        ImageButton img = (ImageButton)sender;
        dt2 = dz2.Getonefile(Convert.ToInt32(img.CommandArgument)).Tables[0];
        if (dt2.Rows[0]["FilePath"].ToString() != "")
        {
            //if (!File.Exists(dt2.Rows[0]["FilePath"].ToString()))
            //{
            //    Response.Write("<script>alert('附件不存在！')<script>");
            //}
            //else
            //{
                //获取文件名
                string FileNameNoExtension = System.IO.Path.GetFileNameWithoutExtension(dt2.Rows[0]["FilePath"].ToString()).ToLower();
                //获取文件后缀
                string FileExtension = System.IO.Path.GetExtension(dt2.Rows[0]["filepath"].ToString()).ToLower();
                string FileFullName = FileNameNoExtension + FileExtension;
                string filepath = Server.MapPath("~/") + "DownloadZone\\" + FileFullName;
                Response.Clear();
                Response.Charset = "utf-8";
                Response.Buffer = true;
                this.EnableViewState = false;
                Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(FileFullName));
                Response.ContentType = "application/unknown";
                Response.WriteFile(filepath);
                Response.Flush();
                Response.Close();
                Response.End();
            //}
        }
        else
        {
            Response.Write("<script>alert('该文件不存在！');window.history.back();</script>");
        }
    }

    /// <summary>
    /// 用于截取指定长度的字符串内容
    /// </summary>
    /// <param name="sender">需要截取的字符串</param>
    /// <param name="e">需要截取的长度</param>
    public string SubStr(string sString, int nLeng)
    {
        if (sString.Length <= nLeng)
        {
            return sString;
        }
        else
        {
            string sNewStr = sString.Substring(0, nLeng);
            sNewStr = sNewStr + "...";
            return sNewStr;
        }
    }
    protected void ZoneList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ZoneList.PageIndex = e.NewPageIndex;
        Dtbind();
    }
}
