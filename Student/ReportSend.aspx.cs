using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Globalization;
using System.Data;

public partial class Student_ReportSend : System.Web.UI.Page
{
    private string id;
    private DataTable dt;
    private string tid1 = "";
    private string tid2 = "";
    string mailtype = "开题材料";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["id"] != null)
        {
            id = Request.Cookies["id"].Value.ToString();
        }
        Fannie.Mail mail = new Fannie.Mail();
        dt = mail.GetSendToTeacher(id).Tables[0];
        if (!IsPostBack)
        {
            GetTeacherName();
        }
    }
    //获取欲发送的教师名单
    private void GetTeacherName()
    {
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ListItem li = new ListItem();
            li.Text = dt.Rows[i][1].ToString();
            ddlTeacher.Items.Add(li);
            li = null;
        }
    }

    //选择要发送开题材料的指导教师
    protected void ddlTeacher_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlTeacher.SelectedIndex != 0)
        {
            if (!tbSendTo.Text.Contains(ddlTeacher.Text))
            {
                tbSendTo.Text += ddlTeacher.Text + ",";
                if (ddlTeacher.SelectedIndex == 1)
                {
                    tid1 = dt.Rows[0][0].ToString();
                    ViewState["tid1"] = tid1;
                }
                else
                {
                    tid2= dt.Rows[1][0].ToString();
                    ViewState["tid2"] = tid2;
                }
            }
        }
        else
        {
            tbSendTo.Text = "";
        }
    }

    /// <summary>
    /// 提交上传的文件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btn_Commit_Click(object sender, EventArgs e)
    {
        #region 属性
        int flag1;
        string mailtheme;
        string mailcontent;
        string filepath;
        DateTime sendertime = DateTime.Now;
        string signdate = DateTime.Now.ToString("yyyyMMddHHmm");
        
        Fannie.Mail ml = new Fannie.Mail();
        #endregion

        if (FileUploadMain.HasFile)
        {
            #region 判断控件内添加的文件是否属于规定类型,否则警告
            if (FileUploadMain.HasFile)
            {
                bool fileOK = false;
                string fileExtension = System.IO.Path.GetExtension(FileUploadMain.FileName).ToLower();
                String[] allowedExtensions = { ".doc", ".docx", ".xls", ".xlsx", ".ppt", ".pptx", ".rar", ".zip" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                    }
                }
                if (fileOK == false)
                {
                    Response.Write("<script>alert('上传的材料只能是.doc、.docx、.xls、.xlsx、.ppt、.pptx、.rar、zip类型！请重新上传。')</script>");
                    return;
                }
            }
            #endregion

            #region 判断上传的文件是否大于50MB
            if (FileUploadMain.HasFile)
            {
                int filesize = (FileUploadMain.PostedFile.ContentLength);
                if (filesize > 50000000)
                {
                    Response.Write("<script>alert('您上传的文件大于50MB，请重新选择')<script>");
                    return;
                }
            }
            #endregion

            //获取文件名
            string FileNameNoExtension = System.IO.Path.GetFileNameWithoutExtension(FileUploadMain.FileName).ToLower();
            //获取文件后缀
            string FileExtension = System.IO.Path.GetExtension(FileUploadMain.FileName).ToLower();

            #region 判断服务器是否存在同名文件,如是则要求更改,否则上传成功
            filepath = Server.MapPath("~/") + "Mail\\" + signdate + "-" + FileUploadMain.FileName;
            if (File.Exists(filepath))
            {
                Response.Write("<script>alert('您即将上传的材料已存在，请重新选择文件或者更改文件名')<script>");
            }
            FileUploadMain.SaveAs(filepath);
        }
        else
        {
            filepath = "";
        }
        mailtheme = txt_theme.Text;
        mailcontent = "";
        if (ViewState["tid1"] == null)
        {
            tid1 = "";
        }
        else
            tid1 = ViewState["tid1"].ToString();
        if (ViewState["tid2"] == null)
        {
            tid2 = "";
        }
        else
            tid2 = ViewState["tid2"].ToString();
        if (tid2=="")
        {
            flag1 = ml.AddMail(id, tid1, mailtheme, mailcontent, sendertime, mailtype, filepath);
        }
        else
        {
            flag1 = ml.AddMail(id, tid1, mailtheme, mailcontent, sendertime, mailtype, filepath);
            ml.AddMail(id, tid2, mailtheme, mailcontent, sendertime, mailtype, filepath);
        }
        if (flag1 > 0)
        {
            Response.Write("<script language='javascript'>alert('上传材料成功！');window.location.href='ReportSend.aspx';</script>");
        }
        else
            Response.Write("<script language='javascript'>alert('上传材料失败！');window.location.href='ReportSend.aspx';</script>");
        #endregion
    }
        
    /// <summary>
    /// 重置标题和描述
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    #region 重置按钮事件
    protected void btn_reset_Click1(object sender, EventArgs e)
    {
        tbSendTo.Text = "";
        txt_theme.Text = "";
    }
    #endregion


}
