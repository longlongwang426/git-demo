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

public partial class Admin_SetCollege : System.Web.UI.Page
{
    private string name;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Fannie.InitSystem init = new Fannie.InitSystem();
            name = init.GetAcademy();
            if (name != null)
            {
                tbCollege.Text = name;
            }
            else
                tbCollege.Text = "";
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        Fannie.InitSystem inits = new Fannie.InitSystem();
        if (tbCollege.Text != "")
        {
            int reslut= inits.InitCollege(tbCollege.Text.Trim());
            if (reslut>0)
            {
                Response.Write("<script>alert('设置成功')</script>");
            }
        }
    }
}
