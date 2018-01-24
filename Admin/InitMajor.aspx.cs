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

public partial class Admin_InitMajor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetMajor();
        }
    }
    private void GetMajor()
    {
        Fannie.InitSystem init = new Fannie.InitSystem();
        DataSet ds = init.GetMajor();
        gvMajor.DataKeyNames = new string[] { "ProfessionID" };
        DataColumn dc = new DataColumn();
        dc.ColumnName = "AutoId";
        ds.Tables[0].Columns.Add(dc);
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["AutoId"]=i+1;
        }
        gvMajor.DataSource = ds;
        gvMajor.DataBind();
    }

    protected void gvMajor_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int id = Convert.ToInt32(gvMajor.DataKeys[e.RowIndex].Value.ToString());
        Fannie.InitSystem init = new Fannie.InitSystem();
        if (init.DeleteMajor(id)> 0)
        {
            GetMajor();
            Response.Write("<script>alert('删除成功')</script>");
        }
    }
    protected void gvMajor_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0)
        {
            e.Row.Cells[4].Attributes.Add("onclick","return confirm('确定要删除该行吗？')");
        }
    }
    protected void gvMajor_RowEditing(object sender, GridViewEditEventArgs e)
    {
        gvMajor.EditIndex = e.NewEditIndex;
        GetMajor();
        ((TextBox)(gvMajor.Rows[e.NewEditIndex].Cells[1].Controls[0])).ReadOnly = true;
        ((TextBox)(gvMajor.Rows[e.NewEditIndex].Cells[2].Controls[0])).ReadOnly = false;

    }
    protected void btEdit_Click(object sender, EventArgs e)
    {
        int j = 0;
        for (int i = 0; i < gvMajor.Rows.Count; i++)
        {
            if (((CheckBox)(gvMajor.Rows[i].Cells[0].Controls[0])).Checked)
            {
                ((TextBox)gvMajor.Rows[i].FindControl("tbMajor")).ReadOnly = false;
                gvMajor.Rows[i].Cells[3].Controls[0].Visible = false;
                gvMajor.Rows[i].Cells[4].Controls[0].Visible = false;
            }
            else
            {
                j++;
            }
        }
        if (j==gvMajor.Rows.Count)
        {
            Response.Write("<script>alert('请选择需要编辑的记录')</script>");
        }
        else
        {
            btnDelete.Enabled = false;
            btnNew.Enabled = false;
        }
    }
    protected void gvMajor_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        int id = Convert.ToInt32(gvMajor.DataKeys[e.RowIndex].Value.ToString());
        string name = ((TextBox)(gvMajor.Rows[e.RowIndex].Cells[2].Controls[0])).Text;
        Fannie.InitSystem init = new Fannie.InitSystem();
        if (init.ModifyMajor(id, name) > 0)
        {
            gvMajor.EditIndex = -1;
            GetMajor();
            Response.Write("<script>alert('修改成功')</script>");
        }
    }
    protected void gvMajor_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        gvMajor.EditIndex = -1;
        GetMajor();
    }
    protected void btnNew_Click(object sender, EventArgs e)
    {
        bool isnull = true;
        for (int i = 0; i < gvMajor.Rows.Count;i++ )
        {
            if (((TextBox)gvMajor.Rows[i].FindControl("tbMajor")).Text == tbNewMajor.Text)
            {
                isnull = false;
                break;
            }
        }
        if (isnull)
        {
            Fannie.InitSystem init = new Fannie.InitSystem();
            init.InsetMajor(tbNewMajor.Text);
            GetMajor();
            tbNewMajor.Text = "";
        }
        else
        {
            tbNewMajor.Text = "";
            Response.Write("<script>alert('该专业已经存在，请重新输入专业名称')</script>");
        }
    }
    protected void cb2_CheckedChanged(object sender, EventArgs e)
    {
        bool IsSelect = cb2.Checked;
        for (int i = 0; i < gvMajor.Rows.Count; i++)
        {
            ((CheckBox)(gvMajor.Rows[i].FindControl("cbSelect"))).Checked = IsSelect;
            gvMajor.Rows[i].Cells[3].Controls[0].Visible =!IsSelect;
            gvMajor.Rows[i].Cells[4].Controls[0].Visible = !IsSelect;
        }
        if (!IsSelect)
        {
            GetMajor();
            btnDelete.Enabled = !IsSelect;
        }
        btnNew.Enabled = !IsSelect;
        btnUpdate.Enabled = !IsSelect;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int m = 0;
        Fannie.InitSystem init = new Fannie.InitSystem();
        for (int i = 0; i < gvMajor.Rows.Count; i++)
        {
            if (((CheckBox)(gvMajor.Rows[i].FindControl("cbSelect"))).Checked)
            {
                int id = Convert.ToInt32(gvMajor.DataKeys[i].Value.ToString());
                init.DeleteMajor(id);
            }
            else
            {
                m++;
            }
        }
        if (m==gvMajor.Rows.Count)
        {
            Response.Write("<script>alert('请先选择需要删除的记录')</script>");
        }
        else
        {
            GetMajor();
        }
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Fannie.InitSystem init = new Fannie.InitSystem();
        int id;
        string name;
        for (int i = 0; i < gvMajor.Rows.Count; i++)
        {
            if (((CheckBox)(gvMajor.Rows[i].Cells[0].Controls[0])).Checked)
            {
                id = Convert.ToInt32(gvMajor.DataKeys[i].Value.ToString());
                name = ((TextBox)gvMajor.Rows[i].FindControl("tbMajor")).Text;
                init.ModifyMajor(id, name);
            }
        }
        GetMajor();
        btnDelete.Enabled = true;
        btnNew.Enabled = true;
    }
    protected void btnCancle_Click(object sender, EventArgs e)
    {
        btnDelete.Enabled = true;
        btnNew.Enabled = true;
        btnUpdate.Enabled = true;
        btEdit.Enabled = true;
        GetMajor();
    }
}
