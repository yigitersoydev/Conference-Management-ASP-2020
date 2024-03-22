using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Home : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=YIGIT\\SQLEXPRESS;Initial Catalog=CMS;Integrated Security=True;");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERSession"] == null)
        {
            pnlProfileBtn.Visible = false;
            pnlSignOut.Visible = false;
            pnlLogReg.Visible = true;
        }
        else
        {
            pnlProfileBtn.Visible = true;
            pnlSignOut.Visible = true;
            pnlLogReg.Visible = false;
        }

        SqlCommand comm = new SqlCommand("SELECT TOP 5 conferenceSubject FROM Conference Order by conferenceID DESC", conn);

        SqlDataReader reader;
        SqlDataReader reader2;
        SqlDataReader reader3;

        SqlCommand comm2 = new SqlCommand("SELECT COUNT(*) userID FROM [User]   ORDER BY userID DESC", conn);
        SqlCommand comm3 = new SqlCommand("SELECT TOP 5 subject FROM Announcements Order by announcementID DESC", conn);

        conn.Open();

        reader = comm.ExecuteReader();
        Repeater1.DataSource = reader;
        Repeater1.DataBind();
        reader.Close();

        reader2 = comm2.ExecuteReader();
        Repeater2.DataSource = reader2;
        Repeater2.DataBind();
        reader2.Close();

        reader3 = comm3.ExecuteReader();
        Repeater3.DataSource = reader3;
        Repeater3.DataBind();


        conn.Close();

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
}