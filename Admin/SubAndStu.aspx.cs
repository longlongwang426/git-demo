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

public partial class Admin_SubAndStu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetAllSub();
        }
    }
    private void GetAllSub()
    {
        Fannie.Subjects s = new Fannie.Subjects();
        DataSet ds = s.GetAllSub();
        DataColumn dc = new DataColumn();
        dc.ColumnName = "PId";
        ds.Tables[0].Columns.Add(dc);
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["Pid"] = (i + 1).ToString();
        }
        gvSub.DataKeyNames = new string[] { "SubjectID" };
        gvSub.DataSource = ds;
        gvSub.DataBind();
    }
    protected void gvSub_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvSub.PageIndex = e.NewPageIndex;
        GetAllSub();
    }
    protected void btnDown_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.AddHeader("content-disposition","attachment;filename=SubInfo.xls");
        Response.Charset = "gb2312";//设定输出的字符集
        Response.ContentType = "application/ms.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlwrite = new HtmlTextWriter(stringWrite);
        gvSub.AllowPaging = false;
        GetAllSub();
        gvSub.RenderControl(htmlwrite);
        Response.Write(stringWrite.ToString());
        Response.End();
        gvSub.AllowPaging = true;
        GetAllSub();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }
}
