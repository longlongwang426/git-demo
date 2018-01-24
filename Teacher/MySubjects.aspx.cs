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

public partial class Teacher_MySubjects : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetMySub();
        }
    }

    private void GetMySub()
    {
        string id = Request.Cookies["id"].Value.ToString();
        Fannie.Subjects s = new Fannie.Subjects();
        DataSet ds = s.GetMySub(id);
        DataTable dt = new DataTable();
        DataColumn dc = new DataColumn();
        dc.ColumnName = "PId";
        ds.Tables[0].Columns.Add(dc);
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["Pid"] = (i + 1).ToString();
            ds.Tables[0].Rows[i]["SubjectName"] = SubStr(Convert.ToString(ds.Tables[0].Rows[i]["SubjectName"]), 40);
            ds.Tables[0].Rows[i]["Memo"] = SubStr(Convert.ToString(ds.Tables[0].Rows[i]["Memo"]), 50);
        }
        gvSub.DataKeyNames = new string[] { "SubjectID" };
        gvSub.DataSource = ds;
        gvSub.DataBind();
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

    protected void gvSub_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Fannie.Subjects sub = new Fannie.Subjects();
        int id = Convert.ToInt32(gvSub.DataKeys[e.RowIndex].Value.ToString());
        sub.DeleteOneSub(id);
        GetMySub();
    }

    //protected void gvSub_RowDataBound(object sender, GridViewRowEventArgs e)
    //{
    //    if (e.Row.RowIndex >= 0)
    //    {
    //        e.Row.Cells[9].Attributes.Add("onclick", "return confirm('确定要删除该行吗？')");
    //    }
    //}

    protected void gvSub_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvSub.PageIndex = e.NewPageIndex;
        GetMySub();
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
