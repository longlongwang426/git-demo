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

public partial class Admin_SendMessage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        string title = tbTitle.Text;
        string manager = Request.Cookies["user"].Value.ToString();
        string content = tbContent.Text;
        string year = tYeat.Value;
        string[] str = new string[4] {title,manager,content,year};
        Fannie.Message mes = new Fannie.Message();
        if (mes.InsertNotice(str) > 0)
        {
            Response.Write("<script>alert('成功发布公告');location.href='../Public/Message.aspx'</script>");
        }
    }
}
