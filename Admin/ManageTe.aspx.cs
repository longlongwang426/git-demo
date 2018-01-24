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

public partial class Admin_ManageT : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetAllTea();
        }
    }
    private void GetAllTea()
    {
        Fannie.Teacher t = new Fannie.Teacher();
        DataSet ds = t.GetAllTea();
        DataColumn dc = new DataColumn();
        dc.ColumnName = "PId";
        ds.Tables[0].Columns.Add(dc);
        gvTeacher.DataKeyNames = new string[] { "TeacherID" };
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["PId"] = (i + 1).ToString();
        }
        gvTeacher.DataSource = ds;
        gvTeacher.DataBind();
    }
    protected void gvTeacher_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvTeacher.PageIndex = e.NewPageIndex;
        GetAllTea();
    }
    protected void gvTeacher_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Fannie.Teacher t = new Fannie.Teacher();
        t.DeleteOneTea(gvTeacher.DataKeys[e.RowIndex].Value.ToString());
        GetAllTea();
    }
    protected void gvTeacher_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0)
        {
            e.Row.Cells[9].Attributes.Add("onclick", "return confirm('确定要删除该行吗？')");
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        btnDelete.Attributes.Add("onclick", "return confirm('确定要删除这些老师的记录吗？')");
        int m = 0;
        Fannie.Teacher t = new Fannie.Teacher();
        for (int i = 0; i < gvTeacher.Rows.Count; i++)
        {
            if (((CheckBox)(gvTeacher.Rows[i].FindControl("cbSelect"))).Checked)
            {
                t.DeleteOneTea(gvTeacher.DataKeys[i].Value.ToString());
            }
            else
            {
                m++;
            }
        }
        if (m == gvTeacher.Rows.Count)
        {
            Response.Write("<script>alert('请先选择需要删除的记录')</script>");
        }
        else
        {
            GetAllTea();
        }
    }
    protected void cb2_CheckedChanged(object sender, EventArgs e)
    {
        bool IsSelect = cb2.Checked;
        for (int i = 0; i < gvTeacher.Rows.Count; i++)
        {
            ((CheckBox)(gvTeacher.Rows[i].FindControl("cbSelect"))).Checked = IsSelect;
            gvTeacher.Rows[i].Cells[9].Controls[0].Visible = !IsSelect;
        }
    }
}
