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

public partial class Admin_Time : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetSys();
        }
    }
    private void GetSys()
    {
        Fannie.InitSystem init = new Fannie.InitSystem();
        DataSet ds=init.GetSysSet();
        if (ds.Tables[0].Rows.Count!= 0)
        {
            tYeat.Value = ds.Tables[0].Rows[0]["SubjectTime"].ToString();
            tBegin.Value = ds.Tables[0].Rows[0]["SubjectBegin"].ToString();
            tEnd.Value = ds.Tables[0].Rows[0]["SubjectEnd"].ToString();
            sBegin.Value = ds.Tables[0].Rows[0]["ChooseBegin"].ToString();
            sEnd.Value = ds.Tables[0].Rows[0]["ChooseEnd"].ToString();
        }
    }
    //毕业设计年份设置
    protected void btnSave1_Click(object sender, EventArgs e)
    {
        string year = tYeat.Value;
        Fannie.InitSystem ini = new Fannie.InitSystem();
        if (ini.SetYear(year)>0)
        {
            Response.Write("<script>alert(设置成功')</script>");
        }
    }
    //课题申报开始时间
    protected void btnSave4_Click(object sender, EventArgs e)
    {
        Fannie.InitSystem init = new Fannie.InitSystem();
        DateTime begin =Convert.ToDateTime(tBegin.Value);
        if(init.SetTime(1,begin)>0)
            Response.Write("<script>alert(设置成功')</script>");
    }
    //课题申报结束时间
    protected void btnSvae5_Click(object sender, EventArgs e)
    {
        Fannie.InitSystem init = new Fannie.InitSystem();
        DateTime end = Convert.ToDateTime(tEnd.Value);
        if (init.SetTime(2, end) > 0)
            Response.Write("<script>alert(设置成功')</script>");
    }
    //开始选题时间
    protected void btnSave2_Click(object sender, EventArgs e)
    {
        Fannie.InitSystem init = new Fannie.InitSystem();
        DateTime begin = Convert.ToDateTime(sBegin.Value);
        if (init.SetTime(3, begin) > 0)
            Response.Write("<script>alert(设置成功')</script>");
    }
    //选题结束时间
    protected void btnSave3_Click(object sender, EventArgs e)
    {
        Fannie.InitSystem init = new Fannie.InitSystem();
        DateTime end = Convert.ToDateTime(sEnd.Value);
        if (init.SetTime(4, end) > 0)
            Response.Write("<script>alert(设置成功')</script>");
    }    
}
