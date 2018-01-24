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

public partial class Admin_DetailSub : System.Web.UI.Page
{
   static private int id;
    protected void Page_Load(object sender, EventArgs e)
    {
       if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
            }
            GetOneSub();
        }
    }
    private void GetOneSub()
    {
        Fannie.Subjects sub = new Fannie.Subjects();
        DataSet ds= sub.GetOneSub(id);
        dvSub.DataSource = ds;
        dvSub.DataBind();
    }
    protected void ChangeChecked(object sender, EventArgs e)
    {
        Fannie.Subjects sub = new Fannie.Subjects();
        bool state = ((CheckBox)(dvSub.Rows[0].FindControl("cb"))).Checked;
        sub.MpdifyChecked(id, state);
    }
}
