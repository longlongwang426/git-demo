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

public partial class Admin_StuDetail : System.Web.UI.Page
{
    private string  id="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            id = Request.QueryString["id"].ToString();
        }
        if (!IsPostBack)
        {
            GetStuDetail();
            GetAllProfession();
        }
    }
    private void GetStuDetail()
    {
        Fannie.Student s = new Fannie.Student();
        DataSet ds= s.GetOneStu(id);
        dvStu.DataKeyNames = new string[] { "StudentID"};
        dvStu.DataSource = ds;
        dvStu.DataBind();
    }
    private void GetAllProfession()
    {
        Fannie.Student s = new Fannie.Student();
        DataTable dt = s.GetAllMajor().Tables[0];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ListItem li = new ListItem();
            li.Text = dt.Rows[i][1].ToString();
            ((DropDownList)dvStu.FindControl("ddlMajor")).Items.Add(li);
            li = null;
        }
    }
    protected void ddlIndexChanged(object sender, EventArgs e)
    {
        if (((DropDownList)dvStu.FindControl("ddlMajor")).SelectedIndex!=0)
        {
            ((TextBox)(dvStu.FindControl("tbPro"))).Text = ((DropDownList)dvStu.FindControl("ddlMajor")).Text;
        }
    }
    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (((Button)(dvStu.FindControl("btnEdit"))).Text == "编辑")
        {
            ((Button)(dvStu.FindControl("btnEdit"))).Text = "取消";
            Set(false);
        }
        else
        {
            GetStuDetail();
            Set(true);
        }
    }
    protected void rblLevelChanged(object sender, EventArgs e)
    {
        ((TextBox)(dvStu.FindControl("tbLevel"))).Text = ((RadioButtonList)sender).SelectedValue;
    }
    protected void rblSexSelectedChanged(object sender, EventArgs e)
    {
        ((TextBox)(dvStu.FindControl("tbSex"))).Text = ((RadioButtonList)sender).SelectedValue;
    }

    private void Set(bool tf)
    {
        //((TextBox)(dvStu.FindControl("stuid"))).ReadOnly = tf;
        ((TextBox)(dvStu.FindControl("tbName"))).ReadOnly = tf;
        ((TextBox)(dvStu.FindControl("tbLevel"))).ReadOnly = tf;
      //  ((TextBox)(dvStu.FindControl("tbPro"))).ReadOnly = tf;
        ((TextBox)(dvStu.FindControl("tbClass"))).ReadOnly = tf;
        ((HtmlInputText)(dvStu.FindControl("subYear"))).Disabled=tf;
        ((TextBox)(dvStu.FindControl("tbPhone"))).ReadOnly = tf;
        ((TextBox)(dvStu.FindControl("tbTel"))).ReadOnly = tf;
        ((TextBox)(dvStu.FindControl("tbEmail"))).ReadOnly = tf;

        ((CheckBox)(dvStu.FindControl("cbAccept"))).Enabled = !tf;
        ((RadioButtonList)(dvStu.FindControl("rblSex"))).Visible = !tf;
        ((RadioButtonList)(dvStu.FindControl("rblLevil"))).Visible = !tf;
        ((DropDownList)dvStu.FindControl("ddlMajor")).Visible = !tf;
        ((DropDownList)dvStu.FindControl("ddlMajor")).AutoPostBack = !tf;
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (((Button)(dvStu.FindControl("btnEdit"))).Text == "取消")
        {
            string name = ((TextBox)(dvStu.FindControl("tbName"))).Text;
            string sex = ((TextBox)(dvStu.FindControl("tbSex"))).Text;
            string level = ((TextBox)(dvStu.FindControl("tbLevel"))).Text;
            string pname = ((TextBox)(dvStu.FindControl("tbPro"))).Text;
            string sclass = ((TextBox)(dvStu.FindControl("tbClass"))).Text;
            string year = ((HtmlInputText)(dvStu.FindControl("subYear"))).Value;
            string phone = ((TextBox)(dvStu.FindControl("tbPhone"))).Text;
            string Tel = ((TextBox)(dvStu.FindControl("tbTel"))).Text;
            string email = ((TextBox)(dvStu.FindControl("tbEmail"))).Text;
            bool b = ((CheckBox)(dvStu.FindControl("cbAccept"))).Checked;
            string[] pt = new string[11] { id, name, sex, level, pname, sclass, year, phone, Tel, email, b.ToString() };
            Fannie.Student s = new Fannie.Student();
            if (s.ModifyOneStu(pt) > 0)
            {
                Set(true);
                ((Button)(dvStu.FindControl("btnEdit"))).Text = "编辑";
            }
        }
        else
        {
            Response.Write("<script language='javascript'>alert('请点击编辑，修改信息后再点 更新')</script>");

        }
    }
}
