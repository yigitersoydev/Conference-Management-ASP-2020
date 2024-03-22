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

public partial class announcements : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=YIGIT\\SQLEXPRESS;Initial Catalog=CMS;Integrated Security=True;");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERSession"] != null)
        {
            pnlProfileBtn.Visible = true;
            pnlSignOut.Visible = true;
            pnlLogReg.Visible = false;

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


            string del = Request.QueryString["del"];

            if (del != null)
            {

                SqlCommand delete = new SqlCommand();
                delete.CommandText = "DELETE FROM [dbo].[Announcements] WHERE [announcementID]=" + del;
                delete.Connection = conn;
                conn.Open();
                delete.ExecuteNonQuery();
                conn.Close();

                if (Session["USERSession"] != null)
                {
                    Response.Redirect("announcements.aspx");
                }
                else
                {
                    Response.Redirect("AnnouncementsForAll.aspx");
                }

            }


            string ann = Request.QueryString["ann"];

            if (ann != null)
            {

                Response.Redirect("UpdateAnnouncement.aspx?ann=" + ann);
            }




            string add = Request.QueryString["add"];

            if (add != null)
            {

                Response.Redirect("AddAnnouncement.aspx?add=" + add);
            }

        }

        else
        {
            pnlProfileBtn.Visible = false;
            pnlSignOut.Visible = false;
            pnlLogReg.Visible = true;
            Response.Redirect("Login.aspx");
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