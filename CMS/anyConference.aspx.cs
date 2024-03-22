using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class anyConference : System.Web.UI.Page
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
            string list = Request.QueryString["conff"];
            cmd.CommandText = "SELECT        *" +
                              "FROM         [dbo].[Conference]" +
                              "WHERE        [conferenceID] = '" + list + "'";
            cmd.Connection = conn;
            conn.Open();
            dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                rptr_Conference.DataSource = dr;
                rptr_Conference.DataBind();
            }

            conn.Close();

            string conf = Request.QueryString["conf"];
            string confID = Request.QueryString["confID"];
            string editConf = Request.QueryString["editConf"];

            if (conf != null)
            {
                Response.Redirect("applyToConference.aspx?conf=" + conf);
            }

            if (confID != null)
            {
                Response.Redirect("applicantsOfConference.aspx?confID=" + confID);
            }
            if (editConf != null)
            {
                Response.Redirect("EditConference.aspx?editConf=" + editConf);
            }

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
