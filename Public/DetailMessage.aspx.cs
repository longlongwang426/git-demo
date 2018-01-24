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

public partial class DetailMessage : System.Web.UI.Page
{
    public int id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            id = Convert.ToInt32(Request.QueryString["id"].ToString());
            GetOneMessage();
        }
    }
    public void GetOneMessage()
    {
        Fannie.Message mess = new Fannie.Message();
        DataSet ds = mess.GetOneNotice(id);
        tbTitle.Text=ds.Tables[0].Rows[0]["Title"].ToString();
        tbContent.Text = ds.Tables[0].Rows[0]["Contents"].ToString();
        lbTime.Text =ds.Tables[0].Rows[0]["SenderTime"].ToString();
    }
}
