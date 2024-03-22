using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class ConferencesAsAdmin : System.Web.UI.Page
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

        if (Session["USERSession"] != null)
        {
            //string usernamee = Session["USERSession"].ToString();
            SqlCommand veriOkuma = new SqlCommand();
            conn.Open();
            veriOkuma.Connection = conn;

            veriOkuma.CommandText = ("SELECT [conferenceSubject],[date],[dueDate],[topic] FROM [dbo].[Conference] WHERE [userIDofAdmin]='" + Session["USERSession"] + "'  "); //from olcak hangi tablodan ekiceÛini gšsterecek
            SqlDataReader reader;
            reader = veriOkuma.ExecuteReader();

            rptr_ConferenceAsAdmin.DataSource = reader;
            rptr_ConferenceAsAdmin.DataBind();
            reader.Close();

            conn.Close();
        }


        else
        {
            Response.Redirect("Login.aspx");
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
