using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;

public partial class Teacher_StuList : System.Web.UI.Page
{
    private int id;
    private SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            id = Convert.ToInt32(Request.QueryString["id"].ToString());
            GetOneSubStu();
        }
    }

    private void GetOneSubStu()
    {
        Fannie.Subjects sub = new Fannie.Subjects();
        DataSet ds = sub.GetOneSubStu(id);
        gvStu.DataSource = ds;
        gvStu.DataBind();
        if (ds.Tables[0].Rows.Count == 0)
        {
            //btnDown.Enabled = false;
            title.InnerText = "该课题还未被学生选";
        }
        else
        {
            title.InnerText = "选择该课题的学生信息";
            //title.InnerText = ds.Tables[0].Rows[0][0].ToString();
            //btnDown.Enabled = true;
        }
    }
    protected void gvStu_SelectedIndexChanging(object sender, GridViewSelectEventArgs e)
    {
        gvStu.PageIndex = e.NewSelectedIndex;
        GetOneSubStu();
    }
    //protected void btnDown_Click(object sender, EventArgs e)
    //{
    //    Response.Clear();
    //    Response.AddHeader("content-disposition", "attachment;filename=subinfo.xls");
    //    Response.Charset = "utf-8";//设定输出的字符集
    //    Response.ContentType = "application/ms.xls";
    //    System.IO.StringWriter stringWrite = new System.IO.StringWriter();
    //    System.Web.UI.HtmlTextWriter htmlwrite = new HtmlTextWriter(stringWrite);
    //    gvStu.AllowPaging = false;
    //    GetOneSubStu();
    //    gvStu.RenderControl(htmlwrite);
    //    Response.Write(stringWrite.ToString());
    //    Response.End();
    //    gvStu.AllowPaging = true;
    //    GetOneSubStu();
    //}

    protected void RefuseStu_Click(object sender, EventArgs e)          //退选学生
    {
        LinkButton lb = sender as LinkButton;
        int count;
        string sid = lb.CommandArgument;
        Fannie.Student stu = new Fannie.Student();
        int subid = Convert.ToInt32(id);
        count = stu.DeleteChosen(sid);
        if (count > 0)
        {
            stu.ReduceChosenPeople(subid);
            Response.Write("<script> alert('退选成功！')</script>");
            GetOneSubStu();
        }
        else
            Response.Write("<script> alert('退选失败！')</script>");
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }
    protected void gvStu_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvStu.PageIndex = e.NewPageIndex;
        GetOneSubStu();
    }
}
