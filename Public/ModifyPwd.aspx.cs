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

public partial class ModifyPwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnOk_Click(object sender, EventArgs e)
    {
        string id = Request.Cookies["id"].Value.ToString();
        int typeId=0;
      //  typeId =Convert.ToInt32(Session["typeId"].ToString());
        typeId = Convert.ToInt32(Request.Cookies["typeId"].Value);
        string pwd = tbANewPwd.Text;
        string oldPwd = tbOldPwd.Text;
        Fannie.Users user = new Fannie.Users();
        DataTable dt = user.IsPwdRight(id, oldPwd,typeId).Tables[0];
        if (dt.Rows.Count == 0)
        {
            Response.Write("<script>alert('原密码输入错误');location.href='ModifyPwd.aspx'</script>");
        }
        else
        {
            if (user.ModifyPwd(id, pwd,typeId) > 0)
            {
                Response.Write("<script>alert('修改成功');location.href='ModifyPwd.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('修改失败');location.href='ModifyPwd.aspx'</script>");
            }
        }
    }
}
