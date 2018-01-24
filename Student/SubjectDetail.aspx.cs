using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
public partial class Student_SubjectDetail : System.Web.UI.Page
{
    static public string studentid;
    public int  subid;
    private SqlConnection conn = new SqlConnection(ConfigurationManager.AppSettings["connection"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["id"] != null)
        {
            studentid = Request.Cookies["id"].Value.ToString();
        }
        else 
            Response.Write("<script> alert('请重新登录！')</script>");
        if (Request.QueryString["id"] != null)
        {
            subid = Convert.ToInt32(Request.QueryString["id"].ToString());
        }
        //if (!IsMax())
        //{
        //    ((Button)(SubjectDetail1.FindControl("ChooseSubject"))).Enabled = false;
        //}
        if (!IsPostBack)
        {
            GetSubDetail();
        }
    }

    private void GetSubDetail()
    {
        SubjectDetail1.DataKeyNames = new string[] { "SubjectID" };
        Fannie.Subjects getsub = new Fannie.Subjects();
        SubjectDetail1.DataSource = getsub.GetOneSub(subid);
        SubjectDetail1.DataBind();
    }

    protected void ChooseSubject_Click(object sender, EventArgs e)
    {
        Fannie.Student stu = new Fannie.Student();
        if (IsTime())
        {
            if (IsChosen())
            {
                if (IsMax())
                {
                    //conn.Open();
                    //string str = "insert into ChosenSubject values(@studentid,@subid)";
                    //SqlParameter[] pt = new SqlParameter[2] {
                    //    new SqlParameter("@studentid",studentid),
                    //    new SqlParameter("@subid",subid)};
                    //SqlCommand mycom = new SqlCommand(str, conn);
                    //mycom.Parameters.Add(pt[0]);
                    //mycom.Parameters.Add(pt[1]);
                    //int count = mycom.ExecuteNonQuery();
                    //conn.Close();
                    int count = stu.InsertChosen(studentid, subid);
                    if (count > 0)
                    {
                        //string sql = "update Subjects set NowPeople = NowPeople + 1 where SubjectID =" + subid;
                        //SqlCommand cmd2 = new SqlCommand();
                        //conn.Open();
                        //cmd2.CommandText = sql;
                        //cmd2.Connection = conn;
                        //cmd2.ExecuteNonQuery();
                        //conn.Close();
                        //stu.AddChosenPeople(subid);
                        Response.Write("<script> alert('选题成功！');window.location.href='ChosenSub.aspx';</script>");
                    }
                    else
                        Response.Write("<script> alert('选题失败！')</script>");
                }
                else
                {
                    Response.Write("<script> alert('此课题已被选满，请选其他课题');window.location.href='SubList.aspx';</script>");
                }
            }
        }
    }

    private bool IsTime()
    {
        DateTime dtm = DateTime.Now;
        DataTable dt = new DataTable();
        Fannie.Student stu = new Fannie.Student();
        dt = stu.GetChooseTime().Tables[0];
        DateTime begin = Convert.ToDateTime( dt.Rows[0]["ChooseBegin"].ToString());
        DateTime end = Convert.ToDateTime( dt.Rows[0]["ChooseEnd"].ToString());
        if (dtm < begin || dtm > end)
        {
            Response.Write("<script> alert('还未到选题时间，不能选题！');history.go(-1)</script>");
            return false;
        }
        else
            return true;
    }

    private bool IsMax()
    {
        int max;
        int count;
        DataSet ds = new DataSet();
        Fannie.Student stu = new Fannie.Student();
        //string ifcan = "select MaxPeople, NowPeople from Subjects where SubjectID =" + subid;
        //SqlDataAdapter sda = new SqlDataAdapter(ifcan,conn);
        //sda.Fill(ds);
        ds = stu.GetMaxandNowPeople(subid);
        max=Convert.ToInt32(ds.Tables[0].Rows[0][0].ToString());
        count=Convert.ToInt32(ds.Tables[0].Rows[0][1].ToString());
        if (max > count)
            return true;
        else
            return false;
    }

    private bool IsChosen()
    {
        Fannie.Student stu = new Fannie.Student();
        DataTable dt = stu.GetChosenSub(studentid).Tables[0];
        if (dt.Rows.Count != 0)
        {
            Response.Write("<script> alert('您已经选择了课题，请不要重复选择！')</script>");
            return false;
        }
        else
            return true;
    }
}
