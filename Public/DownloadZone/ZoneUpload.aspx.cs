using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Globalization;

public partial class Public_DownloadZone_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    /// <summary>
    /// 提交上传的文件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btn_Commit_Click(object sender, EventArgs e)
    {
        #region 属性
        string filetitle;
        string filedescribe;
        DateTime dt=DateTime.Now;
        string signdate = DateTime.Now.ToString("yyyyMMddHHmm");
        string filepath;
        DateTime uploadtime = dt.ToUniversalTime();
        #endregion

        #region 判断控件内是否添加了文件,如添加,则判断是否属于规定类型,否则警告
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
         }
         else 
         {
             Response.Write("<script>alert('您还没有选择上传文件！');history.go(-1)</script>");
             return;
         }
        #endregion

        #region 判断上传的文件是否大于50MB
        if (FileUploadMain.HasFile)
        {
            int filesize=(FileUploadMain.PostedFile.ContentLength);
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
        filepath = Server.MapPath("~/") + "DownloadZone\\" + signdate + "-" + FileUploadMain.FileName;
        if (File.Exists(filepath))
        {
            Response.Write("<script>alert('您即将上传的文件已在专区中存在，请重新选择文件或者更改文件名')<script>");
        }
        FileUploadMain.SaveAs(filepath);

        filetitle = txt_filetitle.Text;
        filedescribe = txt_discription.Text;
        Fannie.DownloadZone dz=new Fannie.DownloadZone();
        int flag = dz.Addfile(filetitle, filedescribe, uploadtime, filepath);
            if(flag > 0)
            {
                 Response.Write("<script language='javascript'>alert('上传文件成功！');window.location.href='ZoneManage.aspx';</script>");
            }
            else 
                 Response.Write("<script language='javascript'>alert('上传文件失败！');window.location.href='ZoneUpload.aspx';</script>");
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
        txt_filetitle.Text = "";
        txt_discription.Text = "";
    }
    #endregion
}
