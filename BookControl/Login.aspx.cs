using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Session["UserName"] = null;
        }
    }
    protected void btnEntry_Click(object sender, EventArgs e)
    {
        string userName = txtName.Text.ToString().Trim();
        string Pwd = txtPwd.Text.ToString().Trim();
        string sql = "select * from Admin where Name='" + userName + "' and Password='" + Pwd + "'";
        if (DBHelper.ReturnInflunceNumber(sql)==1)
        {
            Session["UserName"] = txtName.Text.ToString().Trim();
            DateTime time = DateTime.Now;
            String sqlstr = "update Admin set loginNum=loginNum+1,lastLogin='"+time+"' where ID=1";
            int i=DBHelper.DELE_UPDA(sqlstr);
            if (i != 1) {
                Response.Write("<script>alert('Wrong!')</script>");
            }
            Response.Redirect("Personal.aspx");
        }
        else
        {
           //Response.Write("<script>alert('登录失败！')</script>");
            this.txtName.Text = "输入有误";
            this.txtPwd.Text = "输入有误";
        }
    }
}