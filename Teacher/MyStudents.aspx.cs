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

public partial class Teacher_MyStudents : System.Web.UI.Page
{
    string id;
    //onclientclick="javascript:return confirm('确定要提交吗？')" 
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.Cookies["id"].Value.ToString() != null)
            {
                id = Request.Cookies["id"].Value.ToString();
            }
            GetMyStu();
        }
    }

    private void GetMyStu()
    {
        Fannie.Teacher t = new Fannie.Teacher();
        DataSet ds = t.GetMyStu(id);
        DataTable dt = new DataTable();
        DataColumn dc = new DataColumn();
        dc.ColumnName = "AutoId";
        ds.Tables[0].Columns.Add(dc);
        gvStudent.DataKeyNames = new string[] { "StudentID" };
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["AutoId"] = (i + 1).ToString();
        }
        gvStudent.DataSource = ds;
        gvStudent.DataBind();
        dt = ds.Tables[0];
        if (dt.Rows.Count == 0)
        {
            Label1.Visible = true;
        }
        else
        {
            Label1.Visible = false;
        }
    }

    protected void gvStudent_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvStudent.PageIndex = e.NewPageIndex;
        GetMyStu();
    }
}
