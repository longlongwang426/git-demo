using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Public_DownloadZone_ZoneManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Dtbind();
        }
    }

    public void Dtbind()
    {
        ZoneList.DataKeyNames = new string[] { "DataNo" };
        Fannie.DownloadZone dz1 = new Fannie.DownloadZone();
        DataSet ds1 = new DataSet();
        DataTable dt1 = new DataTable();
        ds1 = dz1.Getfile();
        dt1 = ds1.Tables[0];
        for (int i = 0; i < dt1.Rows.Count; i++)
        {
            dt1.Rows[i]["title"] = SubStr(Convert.ToString(dt1.Rows[i]["title"]), 40);
            dt1.Rows[i]["describe"] = SubStr(Convert.ToString(dt1.Rows[i]["describe"]), 50);
        }
        ZoneList.DataSource = dz1.Getfile();
        ZoneList.DataBind();
    }

    /// <summary>
    /// 全选所有文件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSelectAll_Click(object sender, EventArgs e)
    {
        int count = this.ZoneList.Rows.Count;
        for (int i = 0; i < count; i++)
        {
            CheckBox cb = (CheckBox)this.ZoneList.Rows[i].FindControl("CB1");
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
        int count = this.ZoneList.Rows.Count;
        for (int i = 0; i < count; i++)
        {
            CheckBox cb = (CheckBox)this.ZoneList.Rows[i].FindControl("CB1");
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
        int flag = this.ZoneList.Rows.Count;
        Fannie.DownloadZone dz2 = new Fannie.DownloadZone();
        for (int i = 0; i < flag; i++)
        {
            CheckBox cb = (CheckBox)this.ZoneList.Rows[i].FindControl("CB1");
            if (cb.Checked == true)
            {
                dz2.Deletefile(Convert.ToInt32(ZoneList.DataKeys[i].Value.ToString()));
            }
            else
            {
                count++;
            }
        }
        if (count == flag)
        {
            Response.Write("<script>alert('请先选择需要删除的记录');window.location.href='ZoneManage.aspx';</script>");
        }
        Dtbind();
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
    protected void ZoneList_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        ZoneList.PageIndex = e.NewPageIndex;
        Dtbind();
    }
}
