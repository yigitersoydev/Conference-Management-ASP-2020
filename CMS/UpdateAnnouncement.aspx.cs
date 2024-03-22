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

public partial class UpdateAnnouncement : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=YIGIT\\SQLEXPRESS;Initial Catalog=CMS;Integrated Security=True;MultipleActiveResultSets=true");

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

        if (!Page.IsPostBack)
        {
            conn.Open();
            SqlCommand komut = new SqlCommand();
            string id = Request.QueryString["ann"];
            komut.Connection = conn;
            komut.CommandText = "SELECT [announcementID],[userID],[subject],[date] " +
                                "FROM [dbo].[Announcements] " +
                                "WHERE [announcementID]="+id;
            SqlDataReader dr = komut.ExecuteReader();

            while (dr.Read())
            {
                TextBox1.Text = dr[2].ToString();
            }

            conn.Close();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        //string date = DateTime.Now.ToString();
        SqlCommand update = new SqlCommand();
        string id = Request.QueryString["ann"];
        conn.Open();
        update.Connection = conn;
        update.CommandText = ("UPDATE [dbo].[Announcements] SET [subject] = '" + TextBox1.Text + "',[date] = '" + DateTime.Now.ToString("yyyy-MM-dd") + "' WHERE [announcementID]=" + id);
        update.ExecuteNonQuery();
        conn.Close();

        Response.Redirect("announcements.aspx");
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