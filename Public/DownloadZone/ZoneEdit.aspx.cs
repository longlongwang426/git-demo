using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.IO;

public partial class Public_DownloadZone_ZoneEdit : System.Web.UI.Page
{
    private int StrID;
    protected void Page_Load(object sender, EventArgs e)
    {
        //获取ID
        StrID = Convert.ToInt32(Request.QueryString["id"].ToString());
        Fannie.DownloadZone dz1 = new Fannie.DownloadZone();
        DataSet ds1 = new DataSet();
        ds1 = dz1.Getonefile(StrID);
        DataTable dt1 = ds1.Tables[0];
        
        if (!IsPostBack)
        {
            txt_filetitle.Text = dt1.Rows[0]["title"].ToString();
            txt_discription.Text = dt1.Rows[0]["describe"].ToString();
        }
    }

    //重新上传
    protected void lnkUpfile_Click(object sender, EventArgs e)
    {
        this.FileUploadMain.Visible = true;
        this.Label1.Visible = false;
    }

    //修改文档信息
    protected void btnModify_Click1(object sender, EventArgs e)
    {
        #region 属性
        string filetitle;
        string filedescribe;
        string filepath;
        DateTime dtm = DateTime.Now;
        string signdate = DateTime.Now.ToString("yyyyMMddHHmm");
        DateTime uploadtime = dtm.ToUniversalTime();
        Fannie.DownloadZone dz2 = new Fannie.DownloadZone();
        DataSet ds1 = new DataSet();
        ds1 = dz2.Getonefile(StrID);
        DataTable dt2 = ds1.Tables[0];
        #endregion

        if (this.FileUploadMain.Visible == true)
        {
            #region 判断控件内是否添加了文件,如添加,则判断是否属于规定类型,否则警告
            if (FileUploadMain.HasFile)
            {
                bool fileOK = false;
                string fileExtension = System.IO.Path.GetExtension(FileUploadMain.FileName).ToLower();
                String[] allowedExtensions = { ".doc", ".docx", ".xls", ".ppt", ".rar", ".zip" };
                for (int i = 0; i < allowedExtensions.Length; i++)
                {
                    if (fileExtension == allowedExtensions[i])
                    {
                        fileOK = true;
                    }
                }
                if (fileOK == false)
                {
                    Response.Write("<script>alert('上传的附件只能是.doc、.docx、.xls、.ppt、.rar、.zip类型！请重新上传。')</script>");
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
                int filesize = (FileUploadMain.PostedFile.ContentLength);
                if (filesize > 51200)
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
            int flag1 = dz2.Updatefile(StrID, filetitle, filedescribe, uploadtime, filepath);
            if (flag1 > 0)
            {
                Response.Write("<script language='javascript'>alert('上传文件成功！');window.location.href='ZoneManage.aspx';</script>");
            }
            else
                Response.Write("<script language='javascript'>alert('上传文件失败！');window.location.href='ZoneUpload.aspx';</script>");
            #endregion
        }
        else
        {
            filetitle = txt_filetitle.Text;
            filedescribe = txt_discription.Text;
            uploadtime = Convert.ToDateTime( dt2.Rows[0]["uploadtime"].ToString());
            filepath = dt2.Rows[0]["filepath"].ToString();
            int flag2 = dz2.Updatefile(StrID, filetitle, filedescribe, uploadtime, filepath);
            if (flag2 > 0)
            {
                Response.Write("<script language='javascript'>alert('修改成功！');window.location.href='ZoneManage.aspx';</script>");
            }
        }
    }
}
