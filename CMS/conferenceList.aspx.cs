using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class conferenceList : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=CMS;Integrated Security=True;");
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["USERSession"] != null)
        {
            pnlProfileBtn.Visible = true;
            pnlSignOut.Visible = true;
            pnlLogReg.Visible = false;

            SqlCommand cmd2 = new SqlCommand();
            cmd2.CommandText = "SELECT [name] FROM [dbo].[User] WHERE [userID]=" + Session["USERSession"];
            cmd2.Connection = conn;
            conn.Open();
            SqlDataReader dr2;
            dr2 = cmd2.ExecuteReader();
            dr2.Read();
            lblName.Text = dr2["name"].ToString();

            conn.Close();
        }
        else
        {
            pnlProfileBtn.Visible = false;
            pnlSignOut.Visible = false;
            pnlLogReg.Visible = true;
        }

        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        cmd.CommandText = "SELECT * FROM [dbo].[Conference]";
        cmd.Connection = conn;

        conn.Open();
        dr = cmd.ExecuteReader();
        rptr_Conference.DataSource = dr;
        rptr_Conference.DataBind();

        conn.Close();

        string conff = Request.QueryString["conff"];

        if (conff != null)
        {
            Response.Redirect("anyConference.aspx?conff=" + conff);
        }
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
