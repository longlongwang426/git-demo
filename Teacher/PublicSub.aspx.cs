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

public partial class Teacher_PublicSubject : System.Web.UI.Page
{
    static DataTable dtTea;
    static string t2ID = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!IsTime())
            {
                Response.Write("<script> alert('不在申报课题有效时间内，不能申报课题！');window.location.href='MySubjects.aspx'</script>");
            }
            else
            {
                if (Response.Cookies["user"] != null)
                {
                    tbT1Name.Text = Session["user"].ToString();
                    //HttpCookie cookie = new HttpCookie("login");
                    //System.Text.Encoding enc = System.Text.Encoding.GetEncoding("gb2312");
                    //tbT1Name.Text = HttpUtility.UrlDecode(cookie["user"].ToString(),enc);//获取用户姓名
                    tbT1Name.Enabled = false;
                    GetPost();
                }
                tbSubName.Focus();
                GetProfession();
                GetAnotherTeacher();
                SuitYear();
            }
        }
    }

    private void SuitYear()
    {
        int year = int.Parse(DateTime.Now.Year.ToString());
        for (int i = year; i <= year + 10; i++)
        {
            ListItem li = new ListItem();
            li.Text = i.ToString();
            ddlSuitYear.Items.Add(li);
            li = null;
        }
    }
    //***************************************************
    private void GetAnotherTeacher()
    {
        Fannie.Subjects sub = new Fannie.Subjects();
        DataTable dt = sub.GetAnotherTeacher(Request.Cookies["id"].Value.ToString());
        dtTea = dt;
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ListItem li = new ListItem();
            li.Text = dt.Rows[i][1].ToString();
            ddlT2Name.Items.Add(li);
            li = null;
        }
    }

    private void GetProfession()            //获取专业名称
    {
        Fannie.Subjects sub = new Fannie.Subjects();
        DataTable dt = sub.GetProfession();
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ListItem li = new ListItem();
            li.Text = dt.Rows[i][0].ToString();
            ddlMajor.Items.Add(li);
            li = null;
        }
    }


    private void GetPost()              //根据登录id获取教师职称
    {
        if (tbT1Name.Text.Trim() != "")
        {
            Fannie.Teacher teacher = new Fannie.Teacher();
            DataTable dt = teacher.GetTeacherPost(Request.Cookies["id"].Value.ToString());
            tbPost1.Text = dt.Rows[0][0].ToString();
            tbPost1.Enabled=false;
        }
    }


    protected void ddlMajor_SelectedIndexChanged(object sender, EventArgs e)    //选择适用专业
    {
        if (ddlMajor.SelectedIndex != 0)
        {
            if (tbMajor.Text == "")
            {
                tbMajor.Text = ddlMajor.SelectedValue;
            }
            else
            {
                if (!tbMajor.Text.Contains(ddlMajor.SelectedValue))
                {
                    tbMajor.Text += "," + ddlMajor.SelectedValue;
                }
            }
        }
        else
            tbMajor.Text = "";
    }


    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        if (IsTime())
        {
            string title = tbSubName.Text.Trim();//课题名称
            string level = ddlLevel.Text;
            string major = tbMajor.Text.Trim();//专业
            string type = rblType.SelectedValue.Trim();//课题类型
            string origin = rblOrigin.SelectedValue.Trim();//课题来源
            string isNew = rblIsNew.SelectedValue.Trim();//课题的新旧等等
            int isRight;//是否适中
            if (rblWorkLoad.SelectedValue == "是")
                isRight = 1;
            else
                isRight = 0;
            int isOk;//是否能达到训练要求
            if (rblIsOK.SelectedValue == "是")
                isOk = 1;
            else
                isOk = 0;
            string t1 = Request.Cookies["id"].Value.ToString();//教师编号1
            string t2 = t2ID;
            string about = tbAbout.Text.Trim();//课题内容
            int maxPeople = Convert.ToInt32(ddlMax.Text);//最大人数
            string year = ddlSuitYear.Text.Trim();
            object[] pt = new object[13] { title, major, level, type, origin, isNew, isRight, isOk, t1, t2, about, maxPeople, year };
            if (ddlLevel.SelectedIndex == 0 || ddlSuitYear.SelectedIndex == 0)
            {
                Response.Write("<script>alert('请检查是否选择了正确的适用层次或适用年份！')</script>");
            }
            else
            {
                Fannie.Subjects sub = new Fannie.Subjects();
                if (sub.InsertSubject(pt) > 0)
                {
                    Response.Write("<script>alert('课题申报成功！');location='PublicSub.aspx'</script>");
                }
                else
                {
                    Response.Write("<script>alert('课题申报失败，请重新申报！')</script>");
                }
            }
        }
        else
        {
            Response.Write("<script> alert('不在申报课题有效时间内，不能申报！');history.go(-1)</script>");
        }
    }


    protected void btnReset_Click(object sender, EventArgs e)       //重置
    {
        tbSubName.Text = "";
        tbMajor.Text = "";
        rblType.SelectedIndex = 0;
        rblOrigin.SelectedIndex = 0;
        rblIsNew.SelectedIndex = 0;
        rblWorkLoad.SelectedIndex = 0;
        rblIsOK.SelectedIndex = 0;
        ddlT2Name.SelectedIndex = 0;
        ddlLevel.SelectedIndex = 0;
        ddlMajor.SelectedIndex = 0;
        ddlMax.SelectedIndex = 0;
        ddlSuitYear.SelectedIndex = 0;
        tbPost2.Text = "";
        tbAbout.Text = "";
    }
    protected void ddlT2Name_SelectedIndexChanged(object sender, EventArgs e)   //选择教师名称返回职称和编号
    {
        if (ddlT2Name.SelectedIndex != 0)
        {
            tbPost2.Text = dtTea.Rows[ddlT2Name.SelectedIndex - 1][2].ToString();
            t2ID = dtTea.Rows[ddlT2Name.SelectedIndex - 1][0].ToString();
        }
        else
        {
            tbPost2.Text = "";
            t2ID = "";
        }
    }

    private bool IsTime()
    {
        DateTime dtm = DateTime.Now;
        DataTable dt = new DataTable();
        Fannie.Teacher tea = new Fannie.Teacher();
        dt = tea.GetChooseTime().Tables[0];
        DateTime begin = Convert.ToDateTime(dt.Rows[0]["SubjectBegin"].ToString());
        DateTime end = Convert.ToDateTime(dt.Rows[0]["SubjectEnd"].ToString());
        if (dtm < begin || dtm > end)
        {
            return false;
        }
        else
        {
            return true;
        }
    }
}
