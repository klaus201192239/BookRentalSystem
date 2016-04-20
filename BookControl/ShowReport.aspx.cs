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

public partial class ShowReport : System.Web.UI.Page
{
    private static String sqlstr;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            this.Class.Text = "日利润报表";
            sqlstr = "select tim,sum(price)as SP from (select price,SUBSTRING(Renttime,0,9) tim from Profit) as temp group by tim order by tim desc";
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
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        DataSet daset = DBHelper.GetDataSet(sqlstr, sqlconn);
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
    protected void Year(object sender, EventArgs e)
    {
        this.Class.Text = "年利润报表";
        sqlstr = "select tim,sum(price)as SP from (select price,SUBSTRING(Renttime,0,5) tim from Profit) as temp group by tim order by tim desc";
        gridpage();
    }
    protected void Month(object sender, EventArgs e)
    {
        this.Class.Text = "月利润报表";
        sqlstr = "select tim,sum(price)as SP from (select price,SUBSTRING(Renttime,0,7) tim from Profit) as temp group by tim order by tim desc";
        gridpage();
    }
    protected void Day(object sender, EventArgs e)
    {
        this.Class.Text = "日利润报表";
        sqlstr = "select tim,sum(price)as SP from (select price,SUBSTRING(Renttime,0,9) tim from Profit) as temp group by tim order by tim desc";
        gridpage();
    }
}