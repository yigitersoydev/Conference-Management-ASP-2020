using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class applicantsOfConference : System.Web.UI.Page
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

        if (!Page.IsPostBack)
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            string list = Request.QueryString["confID"];
            cmd.CommandText = "SELECT A.[conferenceID],U.[userID],U.[name],U.[surname],A.[dateOfApplication],A.[statusOfPayment] FROM [dbo].[ApplicantsOfConference] AS A INNER JOIN [dbo].[User] AS U ON U.userID = A.userID WHERE [conferenceID]='" + list + "'";
            cmd.Connection = conn;
            conn.Open();
            dr = cmd.ExecuteReader();
            rptr_Applicants.DataSource = dr;
            rptr_Applicants.DataBind();
            conn.Close();

            string conf = Request.QueryString["conf"];
            string userID = Request.QueryString["userID"];

            if (userID != null && conf != null)
            {
                Response.Redirect("applicationDetail.aspx?userID=" + userID + "&conf=" + conf);
            }
        }
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }
}