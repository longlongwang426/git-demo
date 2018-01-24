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

public partial class Admin_MInfor : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetManagerInfo();
        }
    }
    private void GetManagerInfo()
    {
        Fannie.Manager m = new Fannie.Manager();
        DataSet ds = m.GetOneManager(Request.Cookies["id"].Value.ToString());
        dvManage.DataSource = ds;
        dvManage.DataBind();
    }
    protected void rblSexSelectedChanged(object sender, EventArgs e)
    {
        ((TextBox)(dvManage.FindControl("tbSex"))).Text = ((RadioButtonList)(sender)).SelectedValue;
    }
    protected void btnEditClick(object sender, EventArgs e)
    {
        if (((Button)(dvManage.FindControl("btnEdit"))).Text == "编辑")
        {
            ((Button)(dvManage.FindControl("btnEdit"))).Text = "取消";
            IsEnable(false);
        }
        else
        {
            GetManagerInfo();
            IsEnable(true);
        }
    }
    private void IsEnable(bool b)
    {
        ((TextBox)(dvManage.FindControl("tbName"))).ReadOnly = b;
        ((TextBox)(dvManage.FindControl("tbT1"))).ReadOnly = b;
        ((TextBox)(dvManage.FindControl("tbT2"))).ReadOnly = b;
        ((TextBox)(dvManage.FindControl("tbE"))).ReadOnly = b;
        ((RadioButtonList)(dvManage.FindControl("rblSex"))).Visible = !b;
        ((RadioButtonList)(dvManage.FindControl("rblSex"))).Enabled = !b;
    }
    protected void btnUpdateClick(object sender, EventArgs e)
    {
        if (((Button)(dvManage.FindControl("btnEdit"))).Text == "取消")
        {
            Fannie.Manager m = new Fannie.Manager();
            string name = ((TextBox)(dvManage.FindControl("tbName"))).Text;
            string sex = ((TextBox)(dvManage.FindControl("tbSex"))).Text;
            string t1 = ((TextBox)(dvManage.FindControl("tbT1"))).Text;
            string t2 = ((TextBox)(dvManage.FindControl("tbT2"))).Text;
            string emai = ((TextBox)(dvManage.FindControl("tbE"))).Text;
            string[] pt = new string[6] { Request.Cookies["id"].Value.ToString(), name, sex, t1, t2, emai };
            if (m.ModifyManager(pt) > 0)
            {
                GetManagerInfo();
                Response.Write("<script>alert('修改成功')</script>");
            }
        }
        else
            Response.Write("<script>alert('若需要修改信息，请先点击编辑')</script>");
    }
}
