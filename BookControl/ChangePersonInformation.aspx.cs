using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

public partial class ChangePersonInformation : System.Web.UI.Page
{
    private static int id = 0;
    private static String mid;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            id = Convert.ToInt32(Request["Id"].ToString());
            Search();
        }
    }
    protected void ChangOk(object sender, EventArgs e)
    {
        if (id != 0)
        {
            String user = this.TextBox1.Text.ToString().Trim();
            String car = this.TextBox2.Text.ToString().Trim();
            String phon = this.TextBox3.Text.ToString().Trim();
            String addre = this.TextBox4.Text.ToString().Trim();
            float sumMoney = (float)Convert.ToDouble(this.TextBox7.Text.ToString().Trim());
            String sqltemp = "select * from Member where CardNum=N'"+car+"'";
            int line = DBHelper.ReturnInflunceNumber(sqltemp);
            if ((line == 0)||(line==1&&car==mid))
           {  
               String sqlstr = "update Member set username=N'" + user + "',CardNum=N'" + car + "'," +
                   " tel='" + phon + "',Address=N'" + addre + "',Money='" + sumMoney + "' where ID='" + id + "'";
               int i = DBHelper.DELE_UPDA(sqlstr);
               if (i == 1)
               {
                   id = 0;
                   this.TextBox1.Text = "";
                   this.TextBox2.Text = "";
                   this.TextBox3.Text = "";
                   this.TextBox4.Text = "";
                   this.Label1.Text = "";
                   this.Label2.Text = "";
                   this.TextBox7.Text = "";
                   // Response.Write("<script>alert('修改成功！')</script>");
               }
               else
               {
                   // Response.Write("<script>alert('修改失败！')</script>");
               }
           }
           else {
               this.TextBox2.Text = "此卡号已被使用，请重填！";
           }
            
        }
        else {
            //Response.Write("<script>alert('修改操作无效！')</script>");
        }
    }
    private void Search()
    {
        String sqlstr = "select * from Member where ID='" + id + "'";
        int i = DBHelper.ReturnInflunceNumber(sqlstr);
        if (i == 1)
        {
            SqlConnection sqlconn = DBHelper.GetSqlConnection();
            sqlconn.Open();
            SqlDataReader sqlreader = DBHelper.GetSqlDataReader(sqlstr, sqlconn);
            while (sqlreader.Read())
            {
                id = Convert.ToInt32(sqlreader["ID"].ToString());
                this.TextBox1.Text = sqlreader["username"].ToString();
                this.TextBox2.Text = sqlreader["CardNum"].ToString();
                mid = sqlreader["CardNum"].ToString().Trim();
                this.TextBox3.Text = sqlreader["tel"].ToString();
                this.TextBox4.Text = sqlreader["Address"].ToString();
                this.Label1.Text = sqlreader["Rnum"].ToString();
                this.Label2.Text = sqlreader["Btotal"].ToString();
                this.TextBox7.Text = sqlreader["Money"].ToString();
            }
            sqlconn.Close();
            sqlconn = null;
        }
        else
        {
        }
    }
}
