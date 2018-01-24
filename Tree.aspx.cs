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

public partial class Tree : System.Web.UI.Page
{
   private int TypeId;
   private string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            id = Request.Cookies["id"].Value.ToString();
            TypeId = Convert.ToInt32(Request.Cookies["typeId"].Value.ToString());
            GetRole();
        }
    }
    private void GetRole()
    {
        Fannie.Role role = new Fannie.Role();
        DataTable dt = role.GetUserRole(TypeId);
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            TreeNode tn = new TreeNode();
            tn.Text = dt.Rows[i]["AuthorityName"].ToString();
            tn.NavigateUrl = dt.Rows[i]["AuthorityLink"].ToString();
            tn.ImageUrl = dt.Rows[i]["AuthorityIcon"].ToString();
            tn.Target = "main";
            tvRole.Nodes[0].ChildNodes.Add(tn);
            tn = null;
            dt.Dispose();
        }
        SetUserName();
    }
    private void SetUserName()
    {
        Fannie.Users user = new Fannie.Users();
        string name=user.GetUserName(id, TypeId);
        Session["user"] = name;
        Response.Cookies["user"].Value =name;
        //HttpCookie cookie = new HttpCookie("login");
        //System.Text.Encoding enc = System.Text.Encoding.GetEncoding("gb2312");
        //cookie["user"] = HttpUtility.UrlEncode(name, enc);
        tvRole.Nodes[0].Text = "桌面" + "(" +name+ ")";
    }
}
