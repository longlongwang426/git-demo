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

public partial class Admin_TeaDetail : System.Web.UI.Page
{
   static private string id="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            if(Request.QueryString["id"]!=null)
            {
                id=Request.QueryString["id"].ToString();
                GetOneTea();
            }
        }
    }
    private void GetOneTea()
    {
        Fannie.Teacher t = new Fannie.Teacher();
        DataSet ds = t.GetOneTea(id);
        dvTea.DataSource = ds;
        dvTea.DataBind();
    }
    protected void btnEditClick(object sender, EventArgs e)
    {
        if (((Button)(dvTea.FindControl("btnEdit"))).Text == "编辑")
        {
            ((Button)(dvTea.FindControl("btnEdit"))).Text = "取消";
            IsEnable(false);
        }
        else
        {
            GetOneTea();
            IsEnable(true);
        }
    }
    protected void rblSexSelectedChanged(object sender, EventArgs e)
    {
        ((TextBox)(dvTea.FindControl("tbSex"))).Text = ((RadioButtonList)(sender)).SelectedValue;
    }
    protected void ddlPostSexSelectedChanged(object sender, EventArgs e)
    {
        if (((DropDownList)(sender)).SelectedIndex != 0)
        {
            ((TextBox)(dvTea.FindControl("tbPost"))).Text = ((DropDownList)(sender)).SelectedValue;
        }
    }
    protected void btnUpdateClick(object sender, EventArgs e)
    {
        string name = ((TextBox)(dvTea.FindControl("tbName"))).Text;
        string sex = ((TextBox)(dvTea.FindControl("tbSex"))).Text;
        string post = ((TextBox)(dvTea.FindControl("tbPost"))).Text;
        string t1 = ((TextBox)(dvTea.FindControl("tbT1"))).Text;
        string t2 = ((TextBox)(dvTea.FindControl("tbT2"))).Text;
        string emai = ((TextBox)(dvTea.FindControl("tbE"))).Text;
        object[] obj = new object[7] { id, name, sex, post, t1, t2, emai };
        Fannie.Teacher t = new Fannie.Teacher();
        if (t.UpdateOneTea(obj) > 0)
        {
            GetOneTea();
            Response.Write("<script>alert('修改成功')</script>");
        }
    }
    private void IsEnable(bool b)
    {
       // ((TextBox)(dvTea.FindControl("tbID"))).ReadOnly = b;
        ((TextBox)(dvTea.FindControl("tbName"))).ReadOnly = b;
      //  ((TextBox)(dvTea.FindControl("tbSex"))).ReadOnly = b;
     //   ((TextBox)(dvTea.FindControl("tbPost"))).ReadOnly = b;
        ((TextBox)(dvTea.FindControl("tbT1"))).ReadOnly = b;
        ((TextBox)(dvTea.FindControl("tbT2"))).ReadOnly = b;
        ((TextBox)(dvTea.FindControl("tbE"))).ReadOnly = b;
        ((RadioButtonList)(dvTea.FindControl("rblSex"))).Visible= !b;
        ((DropDownList)(dvTea.FindControl("ddlPost"))).Visible = !b;
    }
     
}
