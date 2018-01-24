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

public partial class Student_SubList : System.Web.UI.Page
{
    string sid;
    protected void Page_Load(object sender, EventArgs e)
    {
        sid = Request.Cookies["id"].Value.ToString();
        if (!IsPostBack)
        {
            
            Ddind();
        }
    }

    private void Ddind()
    {
        Fannie.Student stu = new Fannie.Student();
        DataSet ds1 = new DataSet();
        DataSet ds2 = new DataSet();
        DataTable dt=new DataTable();
        dt = stu.GetProfession(sid).Tables[0];
        ds1 = stu.GetSuitSubject(sid);
        ds2 = ds1;
        //if (ds1.Tables[0].Rows.Count != 0)
        //{
        //    for (int j = 0; j < ds1.Tables[0].Rows.Count; j++)
        //    {
        //        bool bl = false;
        //        string[] prof;
        //        prof = ds1.Tables[0].Rows[j]["SuitProfession"].ToString().Split(',');
        //        for (int i = 0; i < prof.Length; i++)
        //        {
        //            if (prof[i] == dt.Rows[0][0].ToString())
        //            {
        //                bl = true;
        //                break;
        //            }
        //        }
        //        if (!bl)
        //        {
        //            ds2.Tables[0].Rows.RemoveAt(j);
        //        }
        //    }
        //}
        if (ds2.Tables[0].Rows.Count == 0)
            Label1.Visible = true;
        else
        {
            Label1.Visible = false;
            DataColumn dc = new DataColumn();
            dc.ColumnName = "SubNo";
            ds2.Tables[0].Columns.Add(dc);
            for (int i = 0; i < ds2.Tables[0].Rows.Count; i++)
            {
                ds2.Tables[0].Rows[i]["SubNo"] = (i + 1).ToString();
            }
            GridView1.DataKeyNames = new string[] { "SubjectID" };
            GridView1.DataSource = ds2;
            GridView1.DataBind();
        }

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        Ddind();
    }
}
