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

public partial class NShowNoGet : System.Web.UI.Page
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
        String sqlstr = "select Book.vname,Book.ISBN,Book.Rprice,Book.LeftNum,RentB.RentName,RentB.Idcard,RentB.Phone,RentB.Renttime from Book,RentB where Book.ISBN=RentB.ISBN and RentB.Backtime is null order by RentB.Renttime asc";
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
}