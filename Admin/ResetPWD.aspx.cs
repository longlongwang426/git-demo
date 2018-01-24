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

public partial class Admin_ResetPWD : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        if (tbID.Text != "")
        {
            Fannie.Users user = new Fannie.Users();
            if (user.ModifyPwd(tbID.Text, tbID.Text, 2) > 0)
            {
                Response.Write("<script>alert('密码重置已经重置为该学生的学号')</script>");
            }
        }
    }
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        if (tbID.Text != "")
        {
            Fannie.Student stu = new Fannie.Student();
            DataSet ds = stu.GetOneStu(tbID.Text.Trim());
            if (ds.Tables[0].Rows.Count == 0)
            {
                Response.Write("<script>alert('该学生不存在')</script>");
            }
            else
            {
                gvTeacher.Visible = false;
                gvStudent.Visible = true;
                gvStudent.DataSource = ds;
                gvStudent.DataBind();
            }
        }
    }
    protected void btnTSelect_Click(object sender, EventArgs e)
    {
        if (tbTID.Text != "")
        {
            Fannie.Teacher tea = new Fannie.Teacher();
            DataSet ds = tea.GetOneTea(tbTID.Text.Trim());
            if (ds.Tables[0].Rows.Count == 0)
            {
                Response.Write("<script>alert('该教师不存在')</script>");
            }
            else
            {
                gvTeacher.Visible = true;
                gvStudent.Visible = false;
                gvTeacher.DataSource = ds;
                gvTeacher.DataBind();
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (tbTID.Text != "")
        {
            Fannie.Users user = new Fannie.Users();
            if (user.ModifyPwd(tbTID.Text, tbTID.Text, 1) > 0)
            {
                Response.Write("<script>alert('密码重置已经重置为该教师的账号')</script>");
            }
        }
    }
}
