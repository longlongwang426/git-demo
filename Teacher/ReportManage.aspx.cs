using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Teacher_ReportManage : System.Web.UI.Page
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
        string receiverid = Request.Cookies["id"].Value.ToString();
        string mailtype = "开题材料";
        Fannie.Mail ml = new Fannie.Mail();
        DataTable dt = new DataTable();
        DataSet ds = ml.GetMail("2", receiverid, mailtype);
        DataColumn dc = new DataColumn();
        dc.ColumnName = "DataNo";
        ds.Tables[0].Columns.Add(dc);
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["DataNo"] = (i + 1).ToString();
        }
        ReportList.DataKeyNames = new string[] { "MailNo" };
        ReportList.DataSource = ds;
        ReportList.DataBind();
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

    /// <summary>
    /// 全选所有文件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSelectAll_Click(object sender, EventArgs e)
    {
        int count = this.ReportList.Rows.Count;
        for (int i = 0; i < count; i++)
        {
            CheckBox cb = (CheckBox)this.ReportList.Rows[i].FindControl("CB1");
            cb.Checked = true;
        }
    }

    /// <summary>
    /// 反选所勾选的文件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        int count = this.ReportList.Rows.Count;
        for (int i = 0; i < count; i++)
        {
            CheckBox cb = (CheckBox)this.ReportList.Rows[i].FindControl("CB1");
            cb.Checked = false;
        }
    }

    /// <summary>
    /// 删除所选文件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int count = 0;
        int flag = this.ReportList.Rows.Count;
        Fannie.Mail ml2= new Fannie.Mail();
        for (int i = 0; i < flag; i++)
        {
            CheckBox cb = (CheckBox)this.ReportList.Rows[i].FindControl("CB1");
            if (cb.Checked == true)
            {
                ml2.DeleteMail(Convert.ToInt32(ReportList.DataKeys[i].Value.ToString()));
            }
            else
            {
                count++;
            }
        }
        if (count == flag)
        {
            Response.Write("<script>alert('请先选择需要删除的记录');window.location.href='ReportManage.aspx';</script>");
        }
        else
        {
            Response.Write("<script>alert('已经删除所选记录');window.location.href='ReportManage.aspx';</script>");
        }
    }

    protected void ReportList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ReportList.PageIndex = e.NewPageIndex;
        GetMail();
    }
}
