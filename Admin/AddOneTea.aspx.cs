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

public partial class Admin_AddOneTea : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string id = tbNo.Text.Trim();
        string name = tbName.Text;
        string sex = rblSex.SelectedValue;
        string post = ddlPost.SelectedValue;
        string t1 = tbPhone.Text;
        string t2 = tbTel.Text;
        string emai = tbEmail.Text;
        object[] obj = new object[7] { id,name,sex,post,t1,t2,emai};
        Fannie.Teacher t = new Fannie.Teacher();
        if (t.InsertOneTea(obj) > 0)
        {
            Response.Write("<script>alert('成功保存')';location.href='~/Admin/ManageTe.aspx'</script>");
        }
    }
}
