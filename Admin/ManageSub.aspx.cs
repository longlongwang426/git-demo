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

public partial class Admin_ManageSub : System.Web.UI.Page
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
        DataColumn dc = new DataColumn();
        dc.ColumnName = "PId";
        ds.Tables[0].Columns.Add(dc);
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            ds.Tables[0].Rows[i]["Pid"] = (i + 1).ToString();
            //ds.Tables[0].Rows[i]["Memo"] = SubStr(Convert.ToString(ds.Tables[0].Rows[i]["Memo"]), 50);
        }
        gvSub.DataKeyNames = new string []{ "SubjectID"};
        gvSub.DataSource = ds;
        gvSub.DataBind();
    }
    protected void gvSub_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        Fannie.Subjects sub = new Fannie.Subjects();
        int id =Convert.ToInt32(gvSub.DataKeys[e.RowIndex].Value.ToString());
        sub.DeleteOneSub(id);
        GetAllSub();
    }
    protected void gvSub_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0)
        {
            e.Row.Cells[10].Attributes.Add("onclick", "return confirm('确定要删除这个课题的记录吗？')");
        }
    }

    protected void btnDelete_Click(object sender, EventArgs e)
    {
        btnDelete.Attributes.Add("onclick", "return confirm('确定要删除这些课题的记录吗？')");
        int count=0;
        Fannie.Subjects sub = new Fannie.Subjects();
        int key;
        for (int i = 0; i < gvSub.Rows.Count; i++)
        {
            if (((CheckBox)(gvSub.Rows[i].Cells[0].Controls[0])).Checked)
            {
                key = Convert.ToInt32(gvSub.DataKeys[i].Value.ToString());
                sub.DeleteOneSub(key);
            }
            else
            {
                count++;
            }
        }
        if (count == gvSub.Rows.Count)
        {
            Response.Write("<script>alert('请选择需要删除的记录')</script>");
        }
        else
        {
            GetAllSub();
        }
    }

    protected void btnCheck_Click(object sender, EventArgs e)
    {
        int count = 0;
        bool IsSelect = true;
        Fannie.Subjects sub = new Fannie.Subjects();
        for (int i = 0; i < gvSub.Rows.Count; i++)
        {
            if (((CheckBox)(gvSub.Rows[i].Cells[0].Controls[0])).Checked)
            {
                //((CheckBox)(gvSub.Rows[i].FindControl("cbCheck"))).Checked = IsSelect;
                //bool state = ((CheckBox)(gvSub.Rows[i].Cells[9].Controls[0])).Checked;
                //int key = Convert.ToInt32(gvSub.DataKeys[i].Value.ToString());
                //sub.MpdifyChecked(key, state);
                int key = Convert.ToInt32(gvSub.DataKeys[i].Value.ToString());
                sub.MpdifyChecked(key, IsSelect);
            }
            else
            {
                count++;
            }
        }
        if (count == gvSub.Rows.Count)
        {
            Response.Write("<script>alert('请选择需要审核的课题')</script>");
        }
        else
        {
            GetAllSub();
        }
    }

    protected void cb2_CheckedChanged(object sender, EventArgs e)
    {
        bool IsSelect = cb2.Checked;
        for (int i = 0; i < gvSub.Rows.Count; i++)
        {
            ((CheckBox)(gvSub.Rows[i].FindControl("cbSelect"))).Checked = IsSelect;
            gvSub.Rows[i].Cells[10].Controls[0].Visible = !IsSelect;
        }
    }

    protected void ChangeChecked(object sender, EventArgs e)
    {
        Fannie.Subjects sub = new Fannie.Subjects();
        int key;
        for (int i = 0; i < gvSub.Rows.Count; i++)
        {
            bool state = ((CheckBox)(gvSub.Rows[i].Cells[9].Controls[0])).Checked;
            key = Convert.ToInt32(gvSub.DataKeys[i].Value.ToString());
            sub.MpdifyChecked(key, state);
        }
       // GetAllSub();
    }
    //protected void gvSub_PageIndexChanging(object sender, GridViewPageEventArgs e)
    //{
    //    gvSub.PageIndex = e.NewPageIndex;
    //    GetAllSub();
    //}
    protected void btnDaochu_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=subjects.xls");
        Response.Charset = "gb2312";//设定输出的字符集
        Response.ContentType = "application/ms.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlwrite = new HtmlTextWriter(stringWrite);
        gvSub.AllowPaging = false;
        GetAllSub();
        gvSub.RenderControl(htmlwrite);
        Response.Write(stringWrite.ToString());
        Response.End();
        gvSub.AllowPaging = true;
        GetAllSub();
    }
    public override void VerifyRenderingInServerForm(Control control)
    {
        //base.VerifyRenderingInServerForm(control);
    }

    ///// <summary>
    ///// 用于截取指定长度的字符串内容
    ///// </summary>
    ///// <param name="sString">需要截取的字符串</param>
    ///// <param name="nLeng">需要截取的长度</param>
    ///// <returns>新的字符串</returns>
    //public string SubStr(string sString, int nLeng)
    //{
    //    if (sString.Length <= nLeng)
    //    {
    //        return sString;
    //    }
    //    else
    //    {
    //        string sNewStr = sString.Substring(0, nLeng);
    //        sNewStr = sNewStr + "...";
    //        return sNewStr;
    //    }
    //}

}
