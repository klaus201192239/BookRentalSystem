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

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.adminName.Text = Session["UserName"].ToString();
            String sqlstr = "select * from Admin";
            SqlConnection sqlconn = DBHelper.GetSqlConnection();
            sqlconn.Open();
            SqlDataReader sqlreader = DBHelper.GetSqlDataReader(sqlstr,sqlconn);
            while (sqlreader.Read())
            {
                this.la.Text = sqlreader["loginNum"].ToString();
                this.lab.Text = sqlreader["lastLogin"].ToString();
            }
            sqlconn.Close();
            sqlconn = null;
        }
    }
    protected void BookManegeMenu(object sender, MenuEventArgs e)
    {
        if (true)
        {
            if (e.Item.Value == "BookClass")
            {
                Response.Redirect("ClassManage.aspx");
            }
            if (e.Item.Value == "AddBook")
            {
                Response.Redirect("AddBookInformation.aspx");
            }
            if (e.Item.Value == "SearchBook")
            {
                Response.Redirect("ToSearchBook.aspx");
            }
        }
    }
    protected void PersonManegeMenu(object sender, MenuEventArgs e)
    {
        if (true)
        {
            if (e.Item.Value == "AddPerson")
            {
                Response.Redirect("AddPersonInformation.aspx");
            }
            if (e.Item.Value == "SearchPerson")
            {
                Response.Redirect("SearchPersonInformation.aspx");
            }
        }
    }
    protected void BusinessManegeMenu(object sender, MenuEventArgs e)
    {
        if (true)
        {
            if (e.Item.Value == "YLend")
            {
                Response.Redirect("LendBookaspx.aspx");
            }
            if (e.Item.Value == "YGet")
            {
                Response.Redirect("GetBook.aspx");
            }
            if (e.Item.Value == "NLend")
            {
                Response.Redirect("NLendBook.aspx");
            }
            if (e.Item.Value == "NGet")
            {
                Response.Redirect("NGetBook.aspx");
            }

        }
    }
    protected void ReportManegeMenu(object sender, MenuEventArgs e)
    {
        if (true)
        {
            if (e.Item.Value == "Profit")
            {
                Response.Redirect("ShowReport.aspx");
            }
            if (e.Item.Value == "LendRepor")
            {
                Response.Redirect("ShowLendReport.aspx");
            }
        }
        
    }
    protected void NoBookMenu(object sender, MenuEventArgs e)
    {
        if (true)
        {
            if (e.Item.Value == "YN")
            {
                Response.Redirect("YShowNoGet.aspx");
            }
            if (e.Item.Value == "NN")
            {
                Response.Redirect("NShowNoGet.aspx");
            }
        }

    }
}

