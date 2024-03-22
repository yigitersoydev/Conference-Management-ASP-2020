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

public partial class AnnouncementsForAll : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=YIGIT\\SQLEXPRESS;Initial Catalog=CMS;Integrated Security=True;");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERSession"] == null)
        {
            pnlProfileBtn.Visible = false;
            pnlSignOut.Visible = false;
            pnlLogReg.Visible = true;

            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            string list = Request.QueryString["announcementID"];
            cmd.CommandText = "SELECT [announcementID],[userID],[subject],[date] FROM [dbo].[Announcements]";
            cmd.Connection = conn;
            conn.Open();
            dr = cmd.ExecuteReader();
            rptr_announcement.DataSource = dr;
            rptr_announcement.DataBind();
            conn.Close();

            string detail = Request.QueryString["detail"];

            if (detail != null)
            {
                Response.Redirect("DetailAnnouncement.aspx?detail=" + detail);
            }
        }
        else
        {
            pnlProfileBtn.Visible = true;
            pnlSignOut.Visible = true;
            pnlLogReg.Visible = false;
            Response.Redirect("announcements.aspx");
        }

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