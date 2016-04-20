using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddPersonInformation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void AddOne(object sender, EventArgs e)
    {
        String user = this.TextBox1.Text.ToString().Trim();
        String card = this.TextBox2.Text.ToString().Trim();
        String phone = this.TextBox3.Text.ToString().Trim();
        String add = this.TextBox4.Text.ToString().Trim();
        float mone = (float)Convert.ToDouble(this.TextBox5.Text.ToString().Trim());
        String sqltemp = "select * from Member where CardNum=N'"+card+"'";
        int line = DBHelper.ReturnInflunceNumber(sqltemp);
        if (line == 0)
        {
            String sqlstr = "insert into Member(username,CardNum,tel,Address,Rnum,Btotal,Money) values" +
           "(N'" + user + "',N'" + card + "','" + phone + "',N'" + add + "',0,0,'" + mone + "')";
            int i = DBHelper.AddInformation(sqlstr);
            if (i == 1)
            {
                this.TextBox1.Text = "";
                this.TextBox2.Text = "";
                this.TextBox3.Text = "";
                this.TextBox4.Text = "";
                this.TextBox5.Text = "";
                //Response.Write("<script>alert('添加成功！)</script>");
            }
            if (i == 0)
            {
                // Response.Write("<script>alert('添加失败!')</script>");
            }
        }
        else {
            this.TextBox2.Text = "此卡号已被使用，请重填！";
        }
       
    }
}
