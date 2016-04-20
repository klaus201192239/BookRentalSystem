using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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

public partial class ClassManage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            gridpage();
        }
    }
    protected void AddClass(object sender, EventArgs e)
    {
        String cla = this.text.Text.ToString().Trim();
        String sqlstr = "insert into Class(Classname) values(N'" + cla + "')";
        DBHelper.AddInformation(sqlstr);
        this.text.Text = null;
        gridpage();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        this.GridView1.PageIndex = e.NewPageIndex;
        gridpage();
    }
    private void gridpage()
    {
        String sqlstr = "select * from Class";
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
    protected void RowEditing(object sender,  GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        gridpage();
    }
    protected void RowUpdating(object sender,GridViewUpdateEventArgs e)
    {
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString());
        String text = ((TextBox)GridView1.Rows[e.RowIndex].Cells[1].FindControl("clname")).Text.ToString();
        String sqlstr = "update Class set ClassName=N'"+text+"' where ID='"+id+"'";
        SqlCommand cmd = new SqlCommand(sqlstr,sqlconn);
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch {
            return;
        }
        GridView1.EditIndex = -1;
        sqlconn.Close();
        gridpage();
    }
    protected void GCancel(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        gridpage();
    }
}