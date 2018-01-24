using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Teacher_MailManage : System.Web.UI.Page
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
        string mailtype = "答疑";
        Fannie.Mail ml = new Fannie.Mail();
        DataTable dt = new DataTable();
        DataSet ds = ml.GetMail("2", receiveid, mailtype);
        DataColumn dc = new DataColumn();
        dc.ColumnName = "DataNo";
        ds.Tables[0].Columns.Add(dc);
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["DataNo"] = (i + 1).ToString();
        }
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["Theme"] = SubStr(Convert.ToString(ds.Tables[0].Rows[i]["Theme"]), 40);
            ds.Tables[0].Rows[i]["Contents"] = SubStr(Convert.ToString(ds.Tables[0].Rows[i]["Contents"]), 50);
        }
        dt = ds.Tables[0];
        if (dt.Rows.Count == 0)
        {
            Label1.Visible = true;
        }
        else
        {
            Label1.Visible = false;
        }
        MailList.DataKeyNames = new string[] { "MailNo" };
        MailList.DataSource = ds;
        MailList.DataBind();
    }

    /// <summary>
    /// 用于截取指定长度的字符串内容
    /// </summary>
    /// <param name="sender">需要截取的字符串</param>
    /// <param name="e">需要截取的长度</param>
    public string SubStr(string sString, int nLeng)
    {
        if (sString.Length <= nLeng)
        {
            return sString;
        }
        else
        {
            string sNewStr = sString.Substring(0, nLeng);
            sNewStr = sNewStr + "...";
            return sNewStr;
        }
    }
    protected void MailList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        MailList.PageIndex = e.NewPageIndex;
        GetMail();
    }
}
