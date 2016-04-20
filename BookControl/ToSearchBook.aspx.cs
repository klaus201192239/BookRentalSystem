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

public partial class ToSearchBook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Research(object sender, EventArgs e)
    {
        this.dele.Enabled = true;
        this.Button1.Enabled = true;
        this.LABEL.Visible = false;
        int id = 0;
        String str = this.researchname.Text.ToString().Trim();
        String sqlstr = "select * from Book where vname=N'" + str + "' or ISBN='" + str + "'";
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        SqlDataReader sqlreader = DBHelper.GetSqlDataReader(sqlstr, sqlconn);
        while (sqlreader.Read())
        {
            id = Convert.ToInt32(sqlreader["ID"].ToString());
        }
        sqlconn.Close();
        sqlconn = null;
        if (id != 0)
        {
            String sql = "select Book.*,Class.Classname from Book,Class where Book.ID='" + id + "' and Book.ClassID=Class.ID";
            BookInformation(sql);
        }
        else
        {
            Clear();
            this.LABEL.Visible = true;
            this.dele.Enabled = false;
            this.Button1.Enabled = false;
        }
    }
    private void BookInformation(String sql)
    {
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        SqlDataReader sqlreader = DBHelper.GetSqlDataReader(sql, sqlconn);
        while (sqlreader.Read())
        {
            this.bname.Text = sqlreader["vname"].ToString();
            this.isbnid.Text = sqlreader["ISBN"].ToString();
            this.bnumber.Text = sqlreader["BNum"].ToString();
            this.pub.Text = sqlreader["Pbulish"].ToString();
            this.rprice.Text = sqlreader["Rprice"].ToString();
            this.lnum.Text = sqlreader["LeftNum"].ToString();
            this.count.Text = sqlreader["CountBorrow"].ToString();
            this.classdrop.Text = sqlreader["Classname"].ToString();
            this.time.Text = sqlreader["Adddate"].ToString();
            this.rnum.Text = sqlreader["RNum"].ToString();
            this.bprice.Text = sqlreader["Bprice"].ToString();
        }
        sqlconn.Close();
        sqlconn = null;
    }
    protected void DeleBook(object sender, EventArgs e)
    {
        if (this.LABEL.Visible == false)
        {
            String str = this.bname.Text.ToString();
            String isBn = this.isbnid.Text.ToString();
            String sqlstr = "delete from Book where vname=N'" + str + "' and ISBN='" + isBn + "'";
            int i = DBHelper.DELE_UPDA(sqlstr);
            if (i == 1)
            {
                this.researchname.Text = "";
                this.bname.Text = "";
                this.isbnid.Text = "";
                this.bnumber.Text = "";
                this.pub.Text = "";
                this.rprice.Text = "";
                this.lnum.Text = "";
                this.count.Text = "";
                this.classdrop.Text = "";
                this.time.Text = "";
                this.rnum.Text = "";
                this.bprice.Text = "";
                //   Response.Write("<script>alert('删除成功！')</script>");
            }
            else
            {
                //   Response.Write("<script>alert('删除失败！')</script>");
            }
        }
    }
    protected void ChangeBook(object sender, EventArgs e)
    {
            int id = GetBookId(this.isbnid.Text.ToString());
            Response.Redirect("ChangeBookInformation.aspx?Id=" + id);  
    }
    private int GetBookId(String str) {
        int temp = 0;
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        String sqlstr = "select * from Book where ISBN=N'"+str+"'";
        SqlDataReader sqlreader = DBHelper.GetSqlDataReader(sqlstr,sqlconn);
        while (sqlreader.Read())
        {
            temp = Convert.ToInt32(sqlreader["ID"].ToString());
        }
        sqlconn.Close();
        sqlconn = null;
        return temp;
    }
    private void Clear() {
        this.bname.Text = "";
        this.isbnid.Text = "";
        this.bnumber.Text = "";
        this.pub.Text = "";
        this.rprice.Text = "";
        this.lnum.Text = "";
        this.count.Text = "";
        this.classdrop.Text = "";
        this.time.Text = "";
        this.rnum.Text = "";
        this.bprice.Text = "";
    }
}