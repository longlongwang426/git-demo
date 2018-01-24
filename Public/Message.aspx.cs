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

public partial class Message : System.Web.UI.Page
{
    private string typeId;
    protected void Page_Load(object sender, EventArgs e)
    {
        GetAllNotice();
        if (!IsPostBack)
        {
            typeId = Request.Cookies["typeId"].Value.ToString();
            PersonCheck();
        }
    }
    private void PersonCheck()
    {
        if (typeId == "0")
        {
            aWrite.Visible = true;
            gvNotice.Columns[4].Visible = true;
        }
        else
        {
            aWrite.Visible = false;
            gvNotice.Columns[4].Visible = false;
        }

    }
    private void GetAllNotice()
    {
        Fannie.Message mes = new Fannie.Message();
        DataSet ds = mes.GetAllNotice();
        DataColumn dc = new DataColumn();
        dc.ColumnName = "PId";
        ds.Tables[0].Columns.Add(dc);
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["Pid"] = (i + 1).ToString();
        }
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["Title"] = SubStr(Convert.ToString(ds.Tables[0].Rows[i]["Title"]), 40);
            ds.Tables[0].Rows[i]["Contents"] = SubStr(Convert.ToString(ds.Tables[0].Rows[i]["Contents"]), 50);
        }
        gvNotice.DataKeyNames = new string[] { "NoticeNo" };
        gvNotice.DataSource = ds;
        gvNotice.DataBind();
    }
    protected void gvNotice_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Fannie.Message mes = new Fannie.Message();
        int id =Convert.ToInt32(gvNotice.DataKeys[e.RowIndex].Value);
        if (mes.DeleteNotice(id)>0)
        {
            Response.Write("<script>alert('删除成功')</script>");
            GetAllNotice();
        }
    }
    protected void gvNotice_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0)
        {
            e.Row.Cells[4].Attributes.Add("onclick", "return confirm('确定要删除该行吗？')");
        }
    }
    protected void gvNotice_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvNotice.PageIndex = e.NewPageIndex;
        GetAllNotice();
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

}
