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

public partial class NLendBook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindClass();
            Bindname();
        }
    }
    protected void SearchBook(object sender, EventArgs e)
    {
        String str = this.isbn.SelectedItem.Value.ToString();
        String sqlstr = "select Book.*,Class.Classname from Book,Class where Book.ISBN='" + str + "' and Book.ClassID=Class.ID";
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        SqlDataReader sqlreader = DBHelper.GetSqlDataReader(sqlstr, sqlconn);
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
        int temp = Convert.ToInt32(this.lnum.Text.ToString());
        if (temp == 0)
        {
            this.lend.Enabled = false;
          //  Response.Write("<script>alert('该图书已全部借出！')</script>");
        }
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
    protected void ClassChanged(object sender, EventArgs e)
    {
        //this.GridView1.PageSize = Convert.ToInt32(DropDownList1.SelectedValue);
        Bindname();
    }
    protected void LendOk(object sender, EventArgs e) {
        String IsBn = this.isbn.SelectedItem.Value.ToString();
        String rname = this.Label1.Text.ToString().Trim();
        String idcar = this.Label2.Text.ToString().Trim();
        String tel = this.Label3.Text.ToString().Trim();
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
        String sqlstr = "insert into RentB(ISBN,RentName,Idcard,Phone,Renttime) values('"+IsBn+"',N'"+rname+"','"+idcar+"','"+tel+"','"+time+"')";
        int i=DBHelper.AddInformation(sqlstr);
        if (i == 1)
        {
            String sqlstr2 = "update Book set CountBorrow=CountBorrow+1,RNum=RNum+1,LeftNum=LeftNum-1 where ISBN='" + IsBn + "'";
            DBHelper.DELE_UPDA(sqlstr2);
            float pr = (float)Convert.ToDouble(this.rprice.Text.ToString());
            String sqlstr4 = "insert into Profit(ISBN,Renttime,Price) values('" + IsBn + "','" + time + "','"+pr+"')";
            DBHelper.AddInformation(sqlstr4);
           // Response.Write("<script>alert('图书已借出！')</script>");
            Clear();
        }
        else {
           // Response.Write("<script>alert('图书未借出！')</script>");
        }
    }
    private void Clear() {
        this.Label1.Text = "";
        this.Label2.Text = "";
        this.Label3.Text = "";
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
