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

public partial class NGetBook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindClass();
            Bindname();
        }
    }
    protected void ClassChanged(object sender, EventArgs e)
    {
        //this.GridView1.PageSize = Convert.ToInt32(DropDownList1.SelectedValue);
        Bindname();
    }
    protected void Research(object sender, EventArgs e)
    {
        pagebind();
    }
    protected void lnkbtnOne_Click(object sender, EventArgs e)
    {
        this.lblPage.Text = "1";
        this.pagebind();
    }
    protected void lnkbtnLast_Click(object sender, EventArgs e)
    {
        this.lblPage.Text = this.lblBackPage.Text;
        this.pagebind();
    }
    protected void lnkbtnUp_Click(object sender, EventArgs e)
    {
        this.lblPage.Text = Convert.ToString(Convert.ToInt32(this.lblPage.Text) - 1);
        this.pagebind();
    }
    protected void lnkbtnNext_Click(object sender, EventArgs e)
    {
        this.lblPage.Text = Convert.ToString(Convert.ToInt32(this.lblPage.Text) + 1);
        this.pagebind();
    }
    public void pagebind()
    {
        int curpage = Convert.ToInt32(this.lblPage.Text);
        PagedDataSource ps = new PagedDataSource();
        String str = "select Book.ISBN,Book.vname,Book.Pbulish,RentB.Renttime,RentB.ID,RentB.RentName,RentB.Idcard,RentB.Phone from RentB,Book where RentB.ISBN=Book.ISBN and RentB.ISBN='" + this.isbn.SelectedItem.Value.ToString() + "' and RentB.Idcard='" + this.textbox.Text.ToString().Trim() + "' and RentB.Backtime is null";
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        SqlCommand sqlcommand = new SqlCommand(str, sqlconn);
        sqlconn.Open();
        SqlDataAdapter sqldata = new SqlDataAdapter();
        sqldata.SelectCommand = sqlcommand;
        DataSet daset = new DataSet();
        sqldata.Fill(daset);
        ps.DataSource = daset.Tables[0].DefaultView;
        ps.AllowPaging = true;
        ps.PageSize = 10;
        ps.CurrentPageIndex = curpage - 1;
        this.lnkbtnUp.Enabled = true;
        this.lnkbtnNext.Enabled = true;
        this.lnkbtnLast.Enabled = true;
        this.lnkbtnOne.Enabled = true;
        if (curpage == 1)
        {
            this.lnkbtnOne.Enabled = false;//不显示第一页按钮
            this.lnkbtnUp.Enabled = false;//不显示上一页按钮
        }
        if (curpage == ps.PageCount)
        {
            this.lnkbtnNext.Enabled = false;//不显示下一页
            this.lnkbtnLast.Enabled = false;//不显示最后一页
        }
        this.lblBackPage.Text = Convert.ToString(ps.PageCount);
        this.DataList1.DataSource = ps;
        this.DataList1.DataBind();
        sqlconn.Close();
    }
    protected void dLGoodsList_ItemCommand(object source, DataListCommandEventArgs e)
    {
        int id = Convert.ToInt32(e.CommandArgument.ToString());
        DateTime ti = DateTime.Now;
        String time = ti.Year.ToString();
        int x = ti.Month;
        int y = ti.Day;
        if (x < 10)
        {
            time = time + "0" + x.ToString();
        }
        else
        {
            time = time + x.ToString();
        }
        if (y < 10)
        {
            time = time + "0" + y.ToString();
        }
        else
        {
            time = time + y.ToString();
        }
        String sqlstr = "update RentB set Backtime='" + time + "' where ID='" + id + "'";
        int i = DBHelper.DELE_UPDA(sqlstr);
        updateBook(id);
        if (i == 1)
        {
            this.textbox.Text = "";
            //Response.Write("<script>alert('图书已归还！')</script>");
        }
        else
        {
           // Response.Write("<script>alert('图书归还失败！')</script>");
        }
        pagebind();
    }
    private void BindClass()
    {
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        String sqlstr = "select * from Class";
        DataSet daset = DBHelper.GetDataSet(sqlstr, sqlconn);
        this.Clas.DataSource = daset;
        this.Clas.DataTextField = "Classname";
        this.Clas.DataBind();
        sqlconn.Close();
    }
    private void Bindname()
    {
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        String sqlstr = "select Book.* from Book,Class where Book.ClassID=Class.ID and Class.Classname=N'" + Clas.SelectedItem.Value.ToString().Trim() + "'";
        DataSet daset = DBHelper.GetDataSet(sqlstr, sqlconn);
        this.isbn.DataSource = daset;
        this.isbn.DataTextField = "ISBN";
        this.isbn.DataBind();
        sqlconn.Close();
    }
    private void updateBook(int id)
    {
        int temp = 0;
        String sqlstr = "select Book.* from Book,RentB where RentB.ID='" + id + "' and RentB.ISBN=Book.ISBN";
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        SqlDataReader sqlreader = DBHelper.GetSqlDataReader(sqlstr, sqlconn);
        while (sqlreader.Read())
        {
            temp = Convert.ToInt32(sqlreader["ID"].ToString());
        }
        sqlconn.Close();
        sqlconn = null;
        String sqlstr1 = "update Book set LeftNum=LeftNum+1,RNum=RNum-1 where ID='" + temp + "'";
        DBHelper.DELE_UPDA(sqlstr1);
    }
}