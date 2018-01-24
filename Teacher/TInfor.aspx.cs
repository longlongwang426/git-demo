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

public partial class Teacher_TInfor : System.Web.UI.Page
{
    private string  id="";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["id"].Value.ToString() != null)
        {
            id = Request.Cookies["id"].Value.ToString();
        }
        if (!IsPostBack)
        {
            GetTeacherInfo();
            //GetAllProfession();
        }
    }
    private void GetTeacherInfo()
    {
        Fannie.Teacher t = new Fannie.Teacher();
        DataSet ds = t.GetOneTea(id);
        dvTea.DataKeyNames = new string[] { "TeacherID" };
        dvTea.DataSource = ds;
        dvTea.DataBind();
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (((Button)(dvTea.FindControl("btnEdit"))).Text == "编辑")
        {
            ((Button)(dvTea.FindControl("btnEdit"))).Text = "取消";
            Set(false);
        }
        else
        {
            GetTeacherInfo();
            Set(true);
        }
    }

    //protected void rblSexSelectedChanged(object sender, EventArgs e)
    //{
    //    ((TextBox)(dvStu.FindControl("tbSex"))).Text = ((RadioButtonList)sender).SelectedValue;
    //}

    private void Set(bool tf)
    {
        //((TextBox)(dvStu.FindControl("stuid"))).ReadOnly = tf;
        //((TextBox)(dvStu.FindControl("tbName"))).ReadOnly = tf;
        //((TextBox)(dvStu.FindControl("tbSex"))).ReadOnly = tf;
        //((TextBox)(dvStu.FindControl("tbPost"))).ReadOnly = tf;
        //((HtmlInputText)(dvStu.FindControl("subYear"))).Disabled = tf;
        ((TextBox)(dvTea.FindControl("tbPhone"))).ReadOnly = tf;
        ((TextBox)(dvTea.FindControl("tbTel"))).ReadOnly = tf;
        ((TextBox)(dvTea.FindControl("tbEmail"))).ReadOnly = tf;
    }
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        if (((Button)(dvTea.FindControl("btnEdit"))).Text == "取消")
        {
            string id = ((TextBox)(dvTea.FindControl("tbID"))).Text;
            string name = ((TextBox)(dvTea.FindControl("tbName"))).Text;
            string sex = ((TextBox)(dvTea.FindControl("tbSex"))).Text;
            string post = ((TextBox)(dvTea.FindControl("tbPost"))).Text;
            string t1 = ((TextBox)(dvTea.FindControl("tbPhone"))).Text;
            string t2 = ((TextBox)(dvTea.FindControl("tbTel"))).Text;
            string email = ((TextBox)(dvTea.FindControl("tbEmail"))).Text;
            string[] pt = new string[7] { id, name, sex, post, t1, t2, email };
            Fannie.Teacher t = new Fannie.Teacher();
            if (t.UpdateOneTea(pt) > 0)
            {
                Set(true);
                ((Button)(dvTea.FindControl("btnEdit"))).Text = "编辑";
                Response.Write("<script language='javascript'>alert('更新成功！')</script>");
            }
        }
        else
        {
            Response.Write("<script language='javascript'>alert('请点击编辑，修改信息后再点 更新')</script>");

        }
    }
}
