using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Windows.Forms;
using TextBox = System.Web.UI.WebControls.TextBox;
using Button = System.Web.UI.WebControls.Button;

public partial class paperDetail : System.Web.UI.Page
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
            SqlDataReader dr;
            string paperID = Request.QueryString["paper"];

            cmd.CommandText = "SELECT S.[filename],P.[title],P.[summary],U.[name],U.[surname],U.[department],U.[email],C.[conferenceSubject] FROM [dbo].[Submission] AS S INNER JOIN [dbo].[Paper] AS P ON P.paperID = S.paperID INNER JOIN [dbo].[User] AS U ON U.userID = P.userID INNER JOIN [dbo].[Conference] AS C ON C.conferenceID = P.conferenceID WHERE P.[paperID]=" + paperID;

            cmd.Connection = conn;
            conn.Open();
            dr = cmd.ExecuteReader();

            rptr_paperDetail.DataSource = dr;
            rptr_paperDetail.DataBind();
            conn.Close();
        }

        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        string paperID = Request.QueryString["paper"];
        string revID = Session["USERSession"].ToString();
        int value = 1;

        RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
        string text = (item.FindControl("txtSummary") as TextBox).Text;


        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "INSERT INTO ReviewerResult(userID,paperID,summary,status) VALUES ('" + Session["USERSession"] + "','" + paperID + "','" + text + "','" + value + "')";
        cmd.Connection = conn;
        conn.Open();
        cmd.ExecuteNonQuery();

        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "UPDATE [dbo].[Paper] SET [status]=1 WHERE [paperID]=" + paperID;
        cmd2.Connection = conn;
        cmd2.ExecuteNonQuery();

        conn.Close();

        MessageBox.Show("Successfully!");
    }

    protected void btnReject_Click(object sender, EventArgs e)
    {
        string paperID = Request.QueryString["paper"];
        string revID = Session["USERSession"].ToString();
        int value = 0;

        RepeaterItem item = (sender as Button).NamingContainer as RepeaterItem;
        string text = (item.FindControl("txtSummary") as TextBox).Text;


        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "INSERT INTO ReviewerResult(userID,paperID,summary,status) VALUES ('" + Session["USERSession"] + "','" + paperID + "','" + text + "','" + value + "')";
        cmd.Connection = conn;
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();

        MessageBox.Show("Successfully!");
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        string paperID = Request.QueryString["paper"];
        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT S.[filename],S.[extensionType],S.[fileData] FROM [dbo].[Submission] AS S WHERE S.[paperID] =" + paperID;
        cmd.Connection = conn;
        conn.Open();
        dr = cmd.ExecuteReader();

        while (dr.Read())
        {
            byte[] file = (byte[])dr["fileData"];
            string type = (string)dr["extensionType"];
            string filename = (string)dr["filename"];

            Response.Clear();
            Response.ContentType = type;
            Response.BinaryWrite(file);
        }

        conn.Close();
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