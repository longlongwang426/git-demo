using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class Student_ReportOutboxRead : System.Web.UI.Page
{
    private int MailID;
    int typeid = 2;
    protected void Page_Load(object sender, EventArgs e)
    {
        //获取ID
        MailID = Convert.ToInt32(Request.QueryString["id"].ToString());
        Fannie.Mail ml = new Fannie.Mail();
        DataSet ds = new DataSet();
        ds = ml.GetMyOneMail(typeid,MailID);
        DataTable dt1 = ds.Tables[0];
        if (dt1.Rows[0]["AccessoryPath"].ToString() == "")
        {
            IsAccessory.Visible = true;
            lnkdownfile.Visible = false;
        }
        else
        {
            IsAccessory.Visible = false;
            lnkdownfile.Visible = true;
        }
        if (!IsPostBack)
        {
            txt_theme.Text = dt1.Rows[0]["Theme"].ToString();
            txt_sender.Text = dt1.Rows[0]["TeacherName"].ToString();
        }
    }

    //删除本条记录
    protected void Delete_Click(object sender, EventArgs e)
    {
        Fannie.Mail ml = new Fannie.Mail();
        int flag = ml.DeleteMail(MailID);
        if (flag > 0)
        {
            Response.Write("<script>alert('此信息已被删除！');window.location='ReportOutbox.aspx';</script>");
        }
        else 
        {
            Response.Write("<script>alert('信息未被删除！');window.location='ReportOutboxRead.aspx';</script>");
        }
    }

    //下载该附件
    protected void lnkdownfile_Click(object sender, EventArgs e)
    {
        Fannie.Mail ml = new Fannie.Mail();
        DataSet ds = new DataSet();
        ds = ml.GetMyOneMail(typeid, MailID);
        DataTable dt = ds.Tables[0];
        if (dt.Rows[0]["AccessoryPath"].ToString() != "")
        {
            //if (!File.Exists(dt.Rows[0]["AccessoryPath"].ToString()))
            //{
            //    Response.Write("<script>alert('附件不存在！')<script>");
            //}
            //else
            //{
                //获取文件名
                string FileNameNoExtension = System.IO.Path.GetFileNameWithoutExtension(dt.Rows[0]["AccessoryPath"].ToString()).ToLower();
                //获取文件后缀
                string FileExtension = System.IO.Path.GetExtension(dt.Rows[0]["AccessoryPath"].ToString()).ToLower();
                string FileFullName = FileNameNoExtension + FileExtension;
                string filepath = Server.MapPath("~/") + "Mail\\" + FileFullName;
                Response.Clear();
                Response.Charset = "UTF-8";
                Response.Buffer = true;
                this.EnableViewState = false;
                Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(FileFullName));
                //Response.Redirect(dt.Rows[0]["filepath"].ToString());
                Response.ContentType = "application/unknown";
                Response.WriteFile(filepath);
                Response.Flush();
                Response.Close();
                Response.End();
            //}
        }
        else
        {
            Response.Write("<script>alert('文件不存在！');window.history.back();</script>");
        }
    }
}
