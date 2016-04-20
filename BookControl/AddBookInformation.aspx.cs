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

public partial class AddBookInformation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            BindClass();
        }
    }
    protected void AddOne(object sender, EventArgs e)
    {

        String van=this.bname.Text.ToString().Trim();
        int cla = GetClassId(this.classdrop.SelectedItem.Text);
        int buynumber = Convert.ToInt32(this.bnumber.Text.ToString().Trim());
        String isbn = this.isbnid.Text.ToString().Trim();
        String publisher = this.pub.Text.ToString().Trim();
        float bpri =(float) Convert.ToDouble(this.bprice.Text.ToString().Trim());
        float rentprice = (float)Convert.ToDouble(this.rprice.Text.ToString().Trim());
        DateTime ti = DateTime.Now;
        String time = ti.Year.ToString();
        int x = ti.Month;
        int y = ti.Day;
        if (x < 10)
        {
            time =time + "0" + x.ToString();
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
        int RnUm = 0;
        int Lenum = buynumber;
        String sqltemp = "select * from Book where ISBN='"+isbn+"'";
        int line = DBHelper.ReturnInflunceNumber(sqltemp);
        if (line == 0)
        {
            String sqlstr = "insert into Book(vname,ClassID,BNum,ISBN,Pbulish,Bprice,Rprice,Adddate," +
            "RNum,LeftNum,CountBorrow) values(N'" + van + "','" + cla + "','" + buynumber + "','" + isbn + "',N'" + publisher + "','" + bpri + "','" + rentprice + "','" + time + "','" + RnUm + "','" + Lenum + "',0)";
            DBHelper.AddInformation(sqlstr);
            this.bname.Text = "";
            this.isbnid.Text = "";
            this.bnumber.Text = "";
            this.pub.Text = "";
            this.bprice.Text = "";
            this.rprice.Text = "";
        }
        else {
            this.isbnid.Text = "此ISBN号码已存在，请重填！";
        }
    }
    private int GetClassId(String str) {
        int temp = 1;
        String sqlstr="select * from Class where Classname=N'"+str+"'";
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        SqlDataReader sqlreader = DBHelper.GetSqlDataReader(sqlstr,sqlconn);
        while (sqlreader.Read())
        {
            temp = Convert.ToInt32(sqlreader["ID"].ToString());
        }
        sqlconn.Close();
        sqlconn = null;
        return temp;
    }
    private void BindClass()
    {
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        String sqlstr = "select * from Class";
        DataSet daset = DBHelper.GetDataSet(sqlstr, sqlconn);
        this.classdrop.DataSource = daset;
        this.classdrop.DataTextField = "Classname";
        this.classdrop.DataBind();
        sqlconn.Close();
    }  
}