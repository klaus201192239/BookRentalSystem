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

public partial class ChangeBookInformation : System.Web.UI.Page
{
    private static int bookid = 0;
    private static int rentnum = 0;
    private static String bookisbn;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            BindClass();
            bookid = Convert.ToInt32(Request["Id"].ToString());
            BookInformation();
        }
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
    private void BookInformation()
    {
        String sql = "select Book.* from Book where Book.ID='" + bookid + "'";
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        SqlDataReader sqlreader = DBHelper.GetSqlDataReader(sql, sqlconn);
        while (sqlreader.Read())
        {
            this.bname.Text = sqlreader["vname"].ToString();
            this.isbnid.Text = sqlreader["ISBN"].ToString();
            bookisbn = sqlreader["ISBN"].ToString().Trim();
            this.bnumber.Text = sqlreader["BNum"].ToString();
            this.pub.Text = sqlreader["Pbulish"].ToString();
            this.rprice.Text = sqlreader["Rprice"].ToString();
            this.bprice.Text = sqlreader["Bprice"].ToString();
            rentnum = Convert.ToInt32(sqlreader["RNum"].ToString());
        }
        sqlconn.Close();
        sqlconn = null;
    }
    protected void ChangeBook(object sender, EventArgs e)
    {
       
        if (bookid != 0) {
            String van = this.bname.Text.ToString().Trim();
            int claid = GetClassId(this.classdrop.SelectedItem.Text.ToString());
            int buynumber = Convert.ToInt32(this.bnumber.Text.ToString().Trim());
            String isbn = this.isbnid.Text.ToString().Trim();
            String publisher = this.pub.Text.ToString().Trim();
            float bpri = (float)Convert.ToDouble(this.bprice.Text.ToString().Trim());
            float rentprice = (float)Convert.ToDouble(this.rprice.Text.ToString().Trim());
            int Lenum = buynumber - rentnum;
            String sqltemp = "select * from Book where ISBN=N'" + isbn + "'";
            int line = DBHelper.ReturnInflunceNumber(sqltemp);            
            if ((line == 0)||(line==1&&isbn.Equals(bookisbn)))
            {
                String sqlstr = "update Book set vname=N'" + van + "',ClassID='" + claid + "'," +
               " BNum='" + buynumber + "',ISBN='" + isbn + "',Pbulish=N'" + publisher + "'," +
               "Bprice='" + bpri + "',Rprice='" + rentprice + "',LeftNum='" + Lenum + "' where ID='" + bookid + "'";
                int i = DBHelper.DELE_UPDA(sqlstr);
                if (i == 1)
                {
                    this.bname.Text = "";
                    this.isbnid.Text = "";
                    this.bnumber.Text = "";
                    this.pub.Text = "";
                    this.rprice.Text = "";
                    this.bprice.Text = "";
                    bookid = 0;
                    //   Response.Write("<script>alert('修改成功!')</script>");
                }
                else
                {
                    //   Response.Write("<script>alert('修改失败!')</script>");
                }
            }
            else
            {
                this.isbnid.Text = "此ISBN号码已存在，请重填！";
            }
           
        }
        
    }
    private int GetClassId(String str)
    {
        int temp = 0;
        String sqlstr = "select * from Class where Classname=N'" + str + "'";
        SqlConnection sqlconn = DBHelper.GetSqlConnection();
        sqlconn.Open();
        SqlDataReader sqlreader = DBHelper.GetSqlDataReader(sqlstr, sqlconn);
        while (sqlreader.Read())
        {
            temp = Convert.ToInt32(sqlreader["ID"].ToString().Trim());
        }
        sqlconn.Close();
        sqlconn = null;
        return temp;
    }
}