using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls.WebParts;
using System.Data;
using System.Data.SqlClient;

public partial class Student_ChosenSub : System.Web.UI.Page
{
    string id;
    private SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        id = Request.Cookies["id"].Value.ToString();
        if (!IsPostBack)
        {
            databind();
        }
    }

    //数据绑定
    private void databind()
    {
        ChosenSub1.DataKeyNames = new string[] { "SubjectID" };
        Fannie.Student getSub = new Fannie.Student();
        DataTable dt = getSub.GetChosenSub(id).Tables[0];
        if (dt.Rows.Count == 0)
        {
            ChosenSub1.DataSource = getSub.GetChosenSub(id);
            ChosenSub1.DataBind();
            Label1.Visible = true;
        }
        else
        {
            ChosenSub1.DataSource = getSub.GetChosenSub(id);
            ChosenSub1.DataBind();
            Label1.Visible = false;
        }
    }

    //退选所选课程
    protected void DeleteChosenSub_Click(object sender, EventArgs e)
    {
        int count;
        Fannie.Student stu = new Fannie.Student();
        int subid = Convert.ToInt32(ChosenSub1.DataKey.Value.ToString());
        if (IsTime())
        {
            count = stu.DeleteChosen(id);
            if (count > 0)
            {
                stu.ReduceChosenPeople(subid);
                Response.Write("<script> alert('退选成功！')</script>");
                databind();
            }
            else
                Response.Write("<script> alert('退选失败！')</script>");
        }
        else
        {
            Response.Write("<script> alert('已超过选题时间，不能退选！');history.go(-1)</script>");
        }
    }

    //判断是否是选题时间
    private bool IsTime()
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
