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

public partial class SearchPersonInformation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Search(object sender, EventArgs e)
    {
        this.label.Visible = false;
        this.btc.Enabled = true;
        this.btd.Enabled = true;
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
            Clear();
            this.label.Visible = true;
            this.btc.Enabled = false;
            this.btd.Enabled = false;
        }
    }
    protected void Change(object sender, EventArgs e)
    {
        int id = GetId(this.Label2.Text.ToString().Trim());
        Response.Redirect("ChangePersonInformation.aspx?Id="+id);
    }
    protected void Dele(object sender, EventArgs e)
    {
        int id = GetId(this.Label2.Text.ToString().Trim());
        String sqlstr = "delete from Member where ID='" + id + "'";
        int i = DBHelper.DELE_UPDA(sqlstr);
        if (i == 1)
        {
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
    private int GetId(String str) {
        int temp = 0;
        String sqlstr = "select * from Member where CardNum=N'"+str+"'";
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        SqlDataReader sqlreader = DBHelper.GetSqlDataReader(sqlstr, sqlconn);
        while (sqlreader.Read())
        {
            temp = Convert.ToInt32(sqlreader["ID"].ToString());
        }
        sqlconn.Close();
        sqlconn = null;
        return temp;
    }
    private void Clear() {
        this.Label1.Text = "";
        this.Label2.Text = "";
        this.Label3.Text = "";
        this.Label4.Text = "";
        this.Label5.Text = "";
        this.Label6.Text = "";
        this.Label7.Text = "";
    }
}