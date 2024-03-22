using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Windows;
using System.Configuration;
using System.Windows.Forms;

public partial class AddAnnouncement : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=CMS;Integrated Security=True;MultipleActiveResultSets=true");
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

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand add = new SqlCommand();
        conn.Open();
        add.Connection = conn;
        add.CommandText = ("INSERT INTO [dbo].[Announcements] ([userID], [subject],[date]) VALUES(@userid, @subject, @date)");
        add.Parameters.AddWithValue("@userid", Session["USERSession"].ToString());
        add.Parameters.AddWithValue("@subject", TextBox2.Text);
        add.Parameters.AddWithValue("@date", DateTime.Now.ToString("yyyy-MM-dd"));


        add.ExecuteNonQuery();
        conn.Close();

        Response.Redirect("announcements.aspx");
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
