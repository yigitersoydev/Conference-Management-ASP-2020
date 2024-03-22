using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Windows.Forms;

public partial class createConference : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERSession"] == null)
        {
            pnlProfileBtn.Visible = false;
            pnlSignOut.Visible = false;
            pnlLogReg.Visible = true;
            Response.Redirect("Login.aspx");
        }
        else
        {
            pnlProfileBtn.Visible = true;
            pnlSignOut.Visible = true;
            pnlLogReg.Visible = false;
        }
    }

    protected void Submit_Click(object sender, EventArgs e)
    {
        string cName = TextBox1.Text;
        string acronym = TextBox2.Text;
        string webPage = TextBox3.Text;
        string address = TextBox4.Text;
        string startdate = TextBox5.Text;
        string enddate = TextBox6.Text;
        string areaNotes = TextBox7.Text;
        string topic = TextBox8.Text;
        string price = TextBox9.Text;

        int idi = 5;

        SqlConnection baglanti = new SqlConnection("Data Source=YIGIT\\SQLEXPRESS;Initial Catalog=CMS;Integrated Security=True;MultipleActiveResultSets=True;App=EntityFramework");
        SqlCommand komut = new SqlCommand();


        baglanti.Open();
        komut.Connection = baglanti;

        komut.CommandText = ("Insert into Conference(primaryArea, conferenceType, date, dueDate, acronym, userIDofAdmin, conferenceSubject, conferenceWebPage, Location, areaNotes, topic, price) Values ('" + typelist2.SelectedItem.Value + "','" + typelist.SelectedItem.Value + "','" + Convert.ToDateTime(startdate).ToString("yyyy-MM-dd") + "','" + Convert.ToDateTime(enddate).ToString("yyyy-MM-dd") + "','" + acronym + "','" + idi + "','" + cName + "','" + webPage + "','" + address + "','" + areaNotes + "','" + topic + "', '" + price + "')");

        komut.ExecuteNonQuery();
        baglanti.Close();

        MessageBox.Show("Conference Created!");
    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
}