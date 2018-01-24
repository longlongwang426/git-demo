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

public partial class Admin_ManageStu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetAllProfession();
            GetAllStu();
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
        Fannie.Student s = new Fannie.Student();
        DataSet ds=s.GetAllStu();
        DataColumn dc=new DataColumn();
        dc.ColumnName="AutoId";
        ds.Tables[0].Columns.Add(dc);
        gvStudent.DataKeyNames = new string[] { "StudentID" };
        for(int i=0;i<ds.Tables[0].Rows.Count;i++)
        {
            ds.Tables[0].Rows[i]["AutoId"]=(i+1).ToString();
        }
        gvStudent.DataSource =ds ;
        gvStudent.DataBind();
    }
    protected void gvStudent_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Fannie.Student s = new Fannie.Student();
        s.DeletOneStu(gvStudent.DataKeys[e.RowIndex].Value.ToString());
        GetAllStu();
    }
    protected void gvStudent_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0)
        {
            e.Row.Cells[13].Attributes.Add("onclick", "return confirm('确定要删除该行吗？')");
        }
    }
    protected void cb2_CheckedChanged(object sender, EventArgs e)
    {
        bool IsSelect = cb2.Checked;
        for (int i = 0; i < gvStudent.Rows.Count; i++)
        {
            ((CheckBox)(gvStudent.Rows[i].FindControl("cbSelect"))).Checked = IsSelect;
            gvStudent.Rows[i].Cells[13].Controls[0].Visible = !IsSelect;
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int m = 0;
        Fannie.Student s = new Fannie.Student();
        for (int i = 0; i < gvStudent.Rows.Count; i++)
        {
            if (((CheckBox)(gvStudent.Rows[i].FindControl("cbSelect"))).Checked)
            {
                s.DeletOneStu(gvStudent.DataKeys[i].Value.ToString());
            }
            else
            {
                m++;
            }
        }
        if (m ==gvStudent.Rows.Count)
        {
            Response.Write("<script>alert('请先选择需要删除的记录')</script>");
        }
        else
        {
            GetAllStu();
        }
    }
    protected void ddlMajor_SelectedIndexChanged(object sender, EventArgs e)
    {
        gvStudent.PageIndex = 1;
        if (ddlMajor.SelectedIndex == 0)
        {
            GetAllStu();
        }
        else
        {
            GetOneMajorStu(ddlMajor.Text);
        }
    }
    private void GetOneMajorStu(string name)
    {
        Fannie.Student s = new Fannie.Student();
        DataSet ds = s.GetOneMajorStu(name);
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
    }
    protected void ChangeChecked(object sender, EventArgs e)
    {
        Fannie.Student s = new Fannie.Student();
        for (int i = 0; i < gvStudent.Rows.Count; i++)
        {
            bool b = ((CheckBox)(gvStudent.Rows[i]).Cells[12].Controls[0]).Checked;
            string id = gvStudent.DataKeys[i].Value.ToString();
            s.ModifyAccepted(id,b);
        }
    }
    protected void gvStudent_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvStudent.PageIndex = e.NewPageIndex;
        if (ddlMajor.SelectedIndex == 0)
        {
            GetAllStu();
        }
        else
        {
            GetOneMajorStu(ddlMajor.Text);
        }
    }
}
