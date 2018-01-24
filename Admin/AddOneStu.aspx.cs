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

public partial class Admin_AddOneStu : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetAllProfession();
        }
    }
    private void GetAllProfession()
    {
        Fannie.Student s = new Fannie.Student();
        DataTable dt = s.GetAllMajor().Tables[0];
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            ListItem li = new ListItem();
            li.Text = dt.Rows[i][1].ToString();
            ddlMajor.Items.Add(li);
            li = null;
        }
    }
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string id = tbNo.Text.Trim();
        string name = tbName.Text;
        string sex = rblSex.SelectedValue;
        string level = rblLeve.SelectedValue;
        string pname = ddlMajor.Text;
        string sclass = tbClass.Text;
        string year = tYeat.Value;
        string t1 = tbPhone.Text;
        string t2 = tbTel.Text;
        string emai = tbEmail.Text;
        string[] str = new string[10] { id, name, sex, level,pname,sclass,year, t1, t2, emai };
        Fannie.Student s = new Fannie.Student();
        if (s.InsertOneStu(str) > 0)
        {
            Response.Write("<script>alert('新建成功！')</script>");
            string link = string.Format("~/Admin/ManageStu.aspx?id={0}",id);
            Response.Redirect(link);
        }
    }
}
