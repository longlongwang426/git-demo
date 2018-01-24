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
using System.IO;
public partial class Teacher_SendFinalData : System.Web.UI.Page
{
    private string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["id"] != null)
        {
            id = Request.Cookies["id"].Value.ToString();
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
        int flag1 = 0;
        string mailtheme;
        string mailcontent;
        string filepath;
        string mailtype = "归档材料";
        DateTime sendertime = DateTime.Now;
        string signdate = DateTime.Now.ToString("yyyyMMddHHmm");

        Fannie.Mail ml = new Fannie.Mail();
        #endregion

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
                Response.Write("<script>alert('上传的附件只能是.doc、.docx、.xls、.xlsx、.ppt、.pptx、.rar、zip类型！请重新上传。')</script>");
                return;
            }
            int filesize = (FileUploadMain.PostedFile.ContentLength);
            if (filesize > 200000000)
            {
                Response.Write("<script>alert('您上传的文件大于200MB，请重新选择')<script>");
                return;
            }
            else
            {
                //获取文件名
                string FileNameNoExtension = System.IO.Path.GetFileNameWithoutExtension(FileUploadMain.FileName).ToLower();
                //获取文件后缀
                string FileExtension = System.IO.Path.GetExtension(FileUploadMain.FileName).ToLower();
                filepath = Server.MapPath("~/") + "Mail\\" + signdate + "-" + FileUploadMain.FileName;
                if (File.Exists(filepath))
                {
                    Response.Write("<script>alert('您即将上传的附件已存在，请重新选择文件或者更改文件名')<script>");
                }
                FileUploadMain.SaveAs(filepath);
            }
        }
        else
        {
            filepath = "";
        }
        #endregion
        string[] name = tbSendTo.Text.Split(',');
        mailtheme = txt_theme.Text;
        mailcontent = "";
        Fannie.Manager man=new Fannie.Manager();
        string admin=man.GetAdminID().Tables[0].Rows[0][0].ToString();
        if (tbSendTo.Text != "")
        {
           flag1 = ml.AddMail(id,admin, mailtheme, mailcontent, sendertime, mailtype, filepath);
        }
        if (flag1 > 0)
        {
            Response.Write("<script language='javascript'>alert('发送成功！');window.location.href='FinalDataOutbox.aspx';</script>");
        }
        else
            Response.Write("<script language='javascript'>alert('发送失败！');window.location.href='SendFinalData.aspx';</script>");
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
