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

public partial class Main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            gridpage();
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.GridView1.PageIndex = e.NewPageIndex;
        gridpage();
    }
    private void gridpage()
    {
        String sqlstr = "select Book.*,Class.Classname from Book,Class where Book.ClassID=Class.ID order by CountBorrow desc";
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        DataSet daset = DBHelper.GetDataSet(sqlstr,sqlconn);
        GridView1.DataSource = daset;
        GridView1.DataBind();
        sqlconn.Close();
        this.lcurr.Text = "当前页为第" + (this.GridView1.PageIndex + 1).ToString() + "页　共有" + (this.GridView1.PageCount).ToString() + "页";
    }
    protected void GridView1_PageIndexChanged(object sender, EventArgs e)
    {
        this.lcurr.Text = "当前页为第" + (this.GridView1.PageIndex + 1).ToString() + "页　共有" + (this.GridView1.PageCount).ToString() + "页";
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.GridView1.PageSize = Convert.ToInt32(DropDownList1.SelectedValue);
        gridpage();
    }
    protected void Entry(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }
    protected void Rearch(object sender, EventArgs e)
    {
        int id = 0;
        String str = this.SearchName.Text.ToString().Trim();
        String sqlstr = "select * from Book where vname='"+str+"' or ISBN='"+str+"'";
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        SqlDataReader sqlreader = DBHelper.GetSqlDataReader(sqlstr,sqlconn);
        while (sqlreader.Read())
        {
            id = Convert.ToInt32(sqlreader["ID"].ToString());
        }
        sqlconn.Close();
        sqlconn = null;
        Response.Redirect("ShowBookInformation.aspx?BookId="+id);
    }
}