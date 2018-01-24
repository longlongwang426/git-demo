using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Student_TaskManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetMail();
        }
        
    }
    private void GetMail()
    {
        string receiveid = Request.Cookies["id"].Value.ToString();
        string mailtype = "任务书";
        Fannie.Mail ml = new Fannie.Mail();
        DataTable dt = new DataTable();
        DataSet ds = ml.GetMail("1", receiveid, mailtype);
        DataColumn dc = new DataColumn();
        dc.ColumnName = "DataNo";
        ds.Tables[0].Columns.Add(dc);
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["DataNo"] = (i + 1).ToString();
        }
        MailList.DataSource = ds;
        MailList.DataBind();
        dt = ds.Tables[0];
        if (dt.Rows.Count == 0)
        {
            Label1.Visible = true;
        }
        else
        {
            Label1.Visible = false;
        }
    }

    protected void MailList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        MailList.PageIndex = e.NewPageIndex;
        GetMail();
    }
}
