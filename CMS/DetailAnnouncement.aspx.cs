using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class DetailAnnouncement : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=CMS;Integrated Security=True;");
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
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            string id = Request.QueryString["detail"];
            cmd.CommandText = "SELECT [announcementID],[userID],[subject],[date] FROM [dbo].[Announcements]  WHERE [announcementID]=" + id;
            cmd.Connection = conn;
            conn.Open();
            dr = cmd.ExecuteReader();
            rptr_Announcement.DataSource = dr;
            rptr_Announcement.DataBind();
            conn.Close();

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
