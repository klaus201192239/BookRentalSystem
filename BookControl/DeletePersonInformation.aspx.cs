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

public partial class DeletePersonInformation : System.Web.UI.Page
{
    private static int id = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Search(object sender, EventArgs e)
    {
        String cardid = this.TextBox.Text.ToString().Trim();
        String sqlstr = "select * from Member where CardNum='" + cardid + "'";
        int i = DBHelper.ReturnInflunceNumber(sqlstr);
        if (i == 1)
        {
            SqlConnection sqlconn = DBHelper.GetSqlConnection();
            sqlconn.Open();
            SqlDataReader sqlreader = DBHelper.GetSqlDataReader(sqlstr, sqlconn);
            while (sqlreader.Read())
            {
                id = Convert.ToInt32(sqlreader["ID"].ToString());
                this.Label1.Text = sqlreader["username"].ToString();
                this.Label2.Text = sqlreader["CardNum"].ToString();
                this.Label3.Text = sqlreader["tel"].ToString();
                this.Label4.Text = sqlreader["Address"].ToString();
                this.Label5.Text = sqlreader["Rnum"].ToString();
                this.Label6.Text = sqlreader["Btotal"].ToString();
                this.Label7.Text = sqlreader["Money"].ToString();
            }
            sqlconn.Close();
            sqlconn = null;
        }
        else
        {
            this.label.Visible = true;
        }
    }
    protected void DeleteOk(object sender, EventArgs e)
    {
        this.label.Visible = false;
        if (id != 0)
        {
            String sqlstr = "delete from Member where ID='" + id + "'";
            int i = DBHelper.DELE_UPDA(sqlstr);
            if (i == 1)
            {
                id = 0;
                this.TextBox.Text = "";
                this.Label1.Text = "";
                this.Label2.Text = "";
                this.Label3.Text = "";
                this.Label4.Text = "";
                this.Label5.Text = "";
                this.Label6.Text = "";
                this.Label7.Text = "";
            //    Response.Write("<script>alert('删除成功！')</script>");
            }
            else
            {
              //  Response.Write("<script>alert('删除失败！')</script>");
            }
        }
        else
        {
            //Response.Write("<script>alert('删除操作无效！')</script>");
        }
    }
}