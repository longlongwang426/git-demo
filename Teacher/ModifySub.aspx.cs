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

public partial class Teacher_ModifySub : System.Web.UI.Page
{
    static DataTable dtTea;
    static string t1ID;
    static string t2ID = "";
    int subId;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (!IsTime())
            {
                btnEdit.Enabled = false;
                btnDelete.Enabled = false;
            }
            if (Request.Cookies["id"].Value.ToString() != null)
            {
                t1ID = Request.Cookies["id"].Value.ToString();
            }
            SetLevel();
            GetAnotherTeacher();
            SuitYear();
            GetProfession();
            GetSubInfo();
        }
    }
//********************************************************************
    private void SetLevel()             //学生层次选择
    {
        ListItem l1 = new ListItem();
        l1.Text = "--选择层次--";
        ListItem l2 = new ListItem();
        l2.Text = "本科";
        ListItem l3 = new ListItem();
        l3.Text = "专科";
        ListItem l4 = new ListItem();
        l4.Text = "本专科";
        ddlLevel.Items.Add(l1);
        ddlLevel.Items.Add(l2);
        ddlLevel.Items.Add(l3);
        ddlLevel.Items.Add(l4);
        l1 = null;
        l2 = null;
        l3 = null;
        l4 = null;

    }
//******************************************************************

    private void GetSubInfo()
    {
        if(Request.QueryString["id"]!=null)
        {
            int id = Convert.ToInt32(Request.QueryString["id"].ToString());
            Fannie.Subjects sub = new Fannie.Subjects();
            DataTable dt = sub.GetOneSub(id).Tables[0];
            tbSubName.Text = dt.Rows[0]["SubjectName"].ToString();
            tbAbout.Text = dt.Rows[0]["Memo"].ToString();
            tbMajor.Text = dt.Rows[0]["SuitProfession"].ToString();
            tbT1Name.Text = dt.Rows[0]["n1"].ToString();
            tbPost1.Text=dt.Rows[0]["p1"].ToString();
            //tbLevel.Text = dt.Rows[0]["SuitLevel"].ToString();
           ddlLevel.Text= dt.Rows[0]["SuitLevel"].ToString();
           // tbT2Name.Text = dt.Rows[0]["n2"].ToString();
            ddlT2Name.Text= dt.Rows[0]["n2"].ToString();
            tbPost2.Text = dt.Rows[0]["p2"].ToString();
            ddlMax.Text = dt.Rows[0]["MaxPeople"].ToString();
            ddlSuitYear.Text = dt.Rows[0]["SuitYear"].ToString();
            for (int i = 0; i < rblType.Items.Count; i++)
            {
                if (rblType.Items[i].Text == dt.Rows[0]["SubjectType"].ToString())
                {
                    rblType.Items[i].Selected = true;
                }
            }
            for (int i = 0; i < rblOrigin.Items.Count; i++)
            {
                if (rblOrigin.Items[i].Text == dt.Rows[0]["SubjectOrigin"].ToString())
                {
                    rblOrigin.Items[i].Selected = true;
                }
            }
            for (int i = 0;i< rblIsNew.Items.Count; i++)
            {
                if (rblIsNew.Items[i].Text== dt.Rows[0]["SubjectNewOld"].ToString())
                {
                    rblIsNew.Items[i].Selected = true;
                }
            }

            if (dt.Rows[0]["SubjectWorkLoad"].ToString() == "True")
            {
                rblWorkLoad.Items[0].Selected = true;
            }
            else
            {
                rblWorkLoad.Items[1].Selected = true;
            }

            if (dt.Rows[0]["SubjectRequire"].ToString() == "True")
            {
                rblIsOK.Items[0].Selected = true;
            }
            else
            {
                rblIsOK.Items[1].Selected = true;
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

    private bool IsTime()           //是否课题发布时间
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

    private void SetEnable(bool tf)
    {
        tbSubName.Enabled = tf;
        ddlLevel.Enabled = tf;
        tbMajor.Enabled = tf;
        ddlMajor.Enabled = tf;
        ddlMajor.Visible = tf;
        rblIsNew.Enabled = tf;
        rblIsOK.Enabled = tf;
        rblOrigin.Enabled = tf;
        rblType.Enabled = tf;
        rblWorkLoad.Enabled = tf;
        ddlT2Name.Enabled = tf;
        ddlT2Name.Visible = tf;
        ddlT2Name.AutoPostBack = tf;
        tbAbout.Enabled = tf;
        ddlMax.Enabled = tf;
        ddlSuitYear.Enabled = tf;
    }

    protected void btnEdit_Click(object sender, EventArgs e)
    {
        if (btnEdit.Text == "编 辑")
        {
            btnEdit.Text = "更 新";
            SetEnable(true);
        }
        else if (btnEdit.Text == "更 新")
        {
            if (IsTime())
            {
                if (Request.QueryString["id"] != null)
                {
                    subId = Convert.ToInt32(Request.QueryString["id"].ToString());
                }
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
                int id = subId;
                string tid = t1ID;
                object[] pt = new object[15] { title, major, level, type, origin, isNew, isRight, isOk, t1, t2, about, maxPeople, year, id, tid};
                if (ddlLevel.SelectedIndex == 0 || ddlSuitYear.SelectedIndex == 0)
                {
                    Response.Write("<script>alert('请检查是否选择了正确的适用层次或适用年份！');history.go(-1)</script>");
                }
                else
                {
                    Fannie.Subjects sub = new Fannie.Subjects();
                    if (sub.UpdateSubject(pt) > 0)
                    {
                        Response.Write("<script>alert('课题更新成功！');location='MySubjects.aspx'</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('非本人自拟课题，无权修改！');history.go(-1)</script>");
                    }
                }
            }
            else
            {
                Response.Write("<script> alert('不在申报课题有效时间内，不能更新！');history.go(-1)</script>");
            }

            btnEdit.Text = "编 辑";
            SetEnable(false);
        }
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            subId = Convert.ToInt32(Request.QueryString["id"].ToString());
        }
        if (!IsChosenTime())
        {
            Fannie.Subjects sub = new Fannie.Subjects();
            //删除课题
            if (sub.DeleteOneSub(subId) > 0)
            {
                Response.Write("<script>alert('成功删除该课题！');location='MySubjects.aspx'</script>");
            }
            else 
            {
                Response.Write("<script>alert('删除该课题失败！');history.go(-1)</script>");
            }
        }
        else
        {
            Response.Write("<script>alert('学生选题中，无法删除！')</script>");
        }
    }


    //判断是否是选题时间
    private bool IsChosenTime()
    {
        DateTime dtm = DateTime.Now;
        DataTable dt = new DataTable();
        Fannie.Student stu = new Fannie.Student();
        dt = stu.GetChooseTime().Tables[0];
        DateTime begin = Convert.ToDateTime(dt.Rows[0]["ChooseBegin"].ToString());
        DateTime end = Convert.ToDateTime(dt.Rows[0]["ChooseEnd"].ToString());
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
