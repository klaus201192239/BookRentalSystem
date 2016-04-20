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

public partial class ShowBookInformation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            page();
        }
    }
    private void page() {
        int id = Convert.ToInt32(Request["BookId"].ToString());
        if (id != 0)
        {
            String sqlstr = "select Book.*,Class.Classname from Book,Class where Book.ID='" + id + "' and Book.ClassID=Class.ID";
            BookInformation(sqlstr);
        }
        else {
            this.labe.Visible = true;
            
        }
    }
    private void BookInformation(String sql) {
       /* SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        SqlDataReader sqlreader = DBHelper.GetSqlDataReader(sql,sqlconn);
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
        }
        sqlconn.Close();
        sqlconn = null;*/
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        DataSet dtset = DBHelper.GetDataSet(sql,sqlconn);
        this.bname.Text = dtset.Tables[0].Rows[0]["vname"].ToString();
        this.isbnid.Text = dtset.Tables[0].Rows[0]["ISBN"].ToString();
        this.bnumber.Text =  dtset.Tables[0].Rows[0]["BNum"].ToString();
        this.pub.Text =  dtset.Tables[0].Rows[0]["Pbulish"].ToString();
        this.rprice.Text =dtset.Tables[0].Rows[0]["Rprice"].ToString();
        this.lnum.Text = dtset.Tables[0].Rows[0]["LeftNum"].ToString();
        this.count.Text =  dtset.Tables[0].Rows[0]["CountBorrow"].ToString();
        this.classdrop.Text =  dtset.Tables[0].Rows[0]["Classname"].ToString();
        sqlconn.Close();
        sqlconn = null;
    }
    protected void Entry(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    protected void Rearch(object sender, EventArgs e)
    {
        this.labe.Visible = false;
        int id = 0;
        String str = this.SearchName.Text.ToString().Trim();
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
            this.labe.Visible = true;
        }
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
    }
}