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

public partial class Admin_NoChoose : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetAllStu();
            GetAllProfession();
        }
    }
    private void GetAllProfession()
    {
        Fannie.Student s = new Fannie.Student();
        DataTable dt = s.GetAllMajor().Tables[0];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ListItem li = new ListItem();
            li.Text = dt.Rows[i][1].ToString();
            ddlMajor.Items.Add(li);
            li = null;
        }
    }
    private void GetAllStu()
    {
        Fannie.Subjects sub = new Fannie.Subjects();
        DataSet ds = sub.GetStuNoChoose();
        DataColumn dc = new DataColumn();
        dc.ColumnName = "AutoId";
        ds.Tables[0].Columns.Add(dc);
        gvStu.DataKeyNames = new string[] { "StudentID" };
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["AutoId"] = (i + 1).ToString();
        }
        gvStu.DataSource = ds;
        gvStu.DataBind();
        if (ds.Tables[0].Rows.Count == 0)
        {
            btnDown.Enabled = false;
        }
        else
            btnDown.Enabled = true;
    }
    protected void gvStu_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvStu.PageIndex = e.NewPageIndex;
        if (ddlMajor.SelectedIndex == 0)
        {
            GetAllStu();
        }
        else
        {
            GetStuNoChooseByMajor(ddlMajor.Text);
        }
    }
    protected void btnDown_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=NotChooseStu.xls");
        Response.Charset = "gb2312";//设定输出的字符集
        Response.ContentType = "application/ms.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlwrite = new HtmlTextWriter(stringWrite);
        gvStu.AllowPaging = false;
        if (ddlMajor.SelectedIndex == 0)
        {
            GetAllStu();
        }
        else
        {
            GetStuNoChooseByMajor(ddlMajor.Text);
        }
        gvStu.RenderControl(htmlwrite);
        Response.Write(stringWrite.ToString());
        Response.End();
        gvStu.AllowPaging = true;
        if (ddlMajor.SelectedIndex == 0)
        {
            GetAllStu();
        }
        else
        {
            GetStuNoChooseByMajor(ddlMajor.Text);
        }
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }
    private void GetStuNoChooseByMajor(string name)
    {
        Fannie.Subjects s = new Fannie.Subjects();
        DataSet ds = s.GetStuNoChooseByMajor(name);
        DataColumn dc = new DataColumn();
        dc.ColumnName = "AutoId";
        ds.Tables[0].Columns.Add(dc);
        gvStu.DataKeyNames = new string[] { "StudentID" };
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["AutoId"] = (i + 1).ToString();
        }
        gvStu.DataSource = ds;
        gvStu.DataBind();
        if (ds.Tables[0].Rows.Count == 0)
        {
            btnDown.Enabled = false;
        }
        else
            btnDown.Enabled = true;
    }
    protected void ddlMajor_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvStu.PageIndex = 0;
        if (ddlMajor.SelectedIndex == 0)
        {
            GetAllStu();
        }
        else
        {
            GetStuNoChooseByMajor(ddlMajor.Text);
        }
    }
}
