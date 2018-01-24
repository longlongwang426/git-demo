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
using System.Data.SqlClient;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            tbName.Focus();
        }
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string id = tbName.Text;
        string pwd = tbPwd.Text;
        int type = 0;
        Fannie.Users user = new Fannie.Users();
        if (rblType.SelectedIndex == 0)
        {
            type = 2;
        }
        else if (rblType.SelectedIndex == 2)
        {
            type = 0;
        }
        else if (rblType.SelectedIndex == 1)
        {
            type = 1;
        }
        int re = user.IsUserExist(id,type);

        if (re == 0)
        {
            Response.Write("<script>alert('该用户不存在');location.href='Login.aspx'</script>");
        }
        else if (re == 1)
        {
            DataTable dt = user.IsPwdRight(id, pwd,type).Tables[0];
            if (dt.Rows.Count == 0)
            {
                Response.Write("<script>alert('密码错误');location.href='Login.aspx'</script>");
            }
            else
            {
                Response.Cookies["id"].Value = id.ToString();
                Session["id"] = id.ToString();
                Response.Cookies["typeId"].Value = type.ToString();
                Session["typeId"] = type.ToString();
                Response.Redirect("~/Default.aspx");
            }
        }
    }
}
