using System;using System.Collections.Generic;using System.Linq;using System.Web;using System.Web.UI;using System.Web.UI.WebControls;using System.Data.SqlClient;using System.Windows;

public partial class ConferencesAsApplicant : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=YIGIT\\SQLEXPRESS;Initial Catalog=CMS; integrated security = True; MultipleActiveResultSets = True; App=EntityFramework");

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
            SqlCommand veriOkuma = new SqlCommand();            conn.Open();            veriOkuma.Connection = conn;

            veriOkuma.CommandText = ("SELECT C.[conferenceSubject],C.[date],C.[dueDate],C.[topic] FROM [dbo].[Conference] AS C INNER JOIN [dbo].[ConferenceUsers] AS CU ON CU.conferenceID = C.conferenceID WHERE [userID]='" + Session["USERSession"] + "'  "); //from olcak hangi tablodan ekiceÛini gšsterecek
            SqlDataReader reader;            reader = veriOkuma.ExecuteReader();            rptr_ConferenceAsApplicant.DataSource = reader;            rptr_ConferenceAsApplicant.DataBind();            reader.Close();            conn.Close();
        }


        else {
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