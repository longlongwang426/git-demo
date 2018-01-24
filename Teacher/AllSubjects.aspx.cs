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

public partial class Teacher_AllSubjects : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetAllSub();
        }
    }
    private void GetAllSub()
    {
        Fannie.Subjects s = new Fannie.Subjects();
        DataSet ds= s.GetAllSub();
        //DataTable dt = new DataTable();
        DataColumn dc = new DataColumn();
        dc.ColumnName = "PId";
        ds.Tables[0].Columns.Add(dc);
        //dt=ds.Tables[0];
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["Pid"] = (i + 1).ToString();
            ds.Tables[0].Rows[i]["SubjectName"] = SubStr(Convert.ToString(ds.Tables[0].Rows[i]["SubjectName"]), 40);
            ds.Tables[0].Rows[i]["Memo"] = SubStr(Convert.ToString(ds.Tables[0].Rows[i]["Memo"]), 50);
            //dt.Rows[i]["SubjectName"] = SubStr(Convert.ToString(dt.Rows[i]["SubjectName"]), 40);
            //dt.Rows[i]["Memo"] = SubStr(Convert.ToString(dt.Rows[i]["Memo"]), 50);

        }
        gvSub.DataKeyNames = new string []{ "SubjectID"};
        gvSub.DataSource = ds;
        gvSub.DataBind();
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

    protected void gvSub_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        gvSub.PageIndex = e.NewPageIndex;
        GetAllSub();
    }
}
