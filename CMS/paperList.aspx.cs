using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class paperList : System.Web.UI.Page
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

        if (Session["USERSession"] != null)
        {
            SqlCommand cmd = new SqlCommand();
            SqlCommand cmd2 = new SqlCommand();
            SqlDataReader dr, dr2;
            string revID = Session["USERSession"].ToString();
            cmd.CommandText = "SELECT P.[paperID],U.[name],U.[surname],P.[title],C.[conferenceSubject],P.[status] FROM [dbo].[Paper] AS P INNER JOIN [dbo].[User] AS U ON U.userID = P.userID INNER JOIN [dbo].[Conference] AS C ON C.conferenceID = P.conferenceID INNER JOIN [dbo].[ReviewerResult] AS RR ON RR.paperID = P.paperID WHERE P.[status]=0 AND RR.[userID]=" + revID;
            cmd2.CommandText = "SELECT P.[paperID],U.[name],U.[surname],P.[title],C.[conferenceSubject],P.[status] FROM [dbo].[Paper] AS P INNER JOIN [dbo].[User] AS U ON U.userID = P.userID INNER JOIN [dbo].[Conference] AS C ON C.conferenceID = P.conferenceID INNER JOIN [dbo].[ReviewerResult] AS RR ON RR.paperID = P.paperID WHERE P.[status]=1 AND RR.[userID]=" + revID;
            cmd.Connection = conn;
            cmd2.Connection = conn;
            conn.Open();
            dr = cmd.ExecuteReader();
            dr2 = cmd2.ExecuteReader();
            rptr_PaperDone.DataSource = dr2;
            rptr_PaperDone.DataBind();
            rptr_Paper.DataSource = dr;
            rptr_Paper.DataBind();
            conn.Close();

            string paper = Request.QueryString["paper"];

            if (paper != null)
            {
                Response.Redirect("paperDetail.aspx?paper=" + paper);
            }
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