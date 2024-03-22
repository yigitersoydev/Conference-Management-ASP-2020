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

public partial class applyToConference : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=CMS;Integrated Security=True;MultipleActiveResultSets=true");

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
            string session = Session["USERSession"].ToString();
            string conf = Request.QueryString["conf"];

            SqlCommand cmd = new SqlCommand();
            SqlCommand cmd2 = new SqlCommand();
            SqlDataReader dr, dr2;

            cmd.CommandText = "SELECT [name],[surname],[email] FROM [dbo].[User] WHERE [userID]=" + session;
            cmd2.CommandText = "SELECT [conferenceSubject],[date],[dueDate],[topic],[price] FROM [dbo].[Conference] WHERE [conferenceID]=" + conf;

            cmd.Connection = conn;
            cmd2.Connection = conn;
            conn.Open();

            dr = cmd.ExecuteReader();
            dr.Read();

            dr2 = cmd2.ExecuteReader();
            dr2.Read();


            txtName.Text = dr["name"].ToString();
            txtSurname.Text = dr["surname"].ToString();
            txtEmail.Text = dr["email"].ToString();

            lblConfSubject.Text = dr2["conferenceSubject"].ToString();
            lblStartDate.Text = Convert.ToDateTime(dr2["date"]).ToString("dd/MM/yyyy");
            lblDueDate.Text = Convert.ToDateTime(dr2["dueDate"]).ToString("dd/MM/yyyy");
            lblTopic.Text = dr2["topic"].ToString();
            lblPrice.Text = dr2["price"].ToString();


            conn.Close();
        }
        else
        {
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string conf = Request.QueryString["conf"];
        int defaultValue = 0;
        //SqlCommand cmd = new SqlCommand();
        //SqlDataReader dr;
        //cmd.CommandText = "SELECT [userID] FROM [dbo].[User] WHERE [name]='" + txtName.Text + "' AND [surname] = '" + txtSurname.Text + "'";
        //cmd.Connection = conn;

        //conn.Open();
        //dr = cmd.ExecuteReader();
        //dr.Read();

        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "Insert into ApplicantsOfConference(userID,conferenceID,statusOfPayment,statusOfApplication) VALUES ('" + Session["USERSession"] + "','" + conf + "','" + defaultValue + "','" + defaultValue + "')";
        cmd2.Connection = conn;
        conn.Open();
        cmd2.ExecuteNonQuery();

        SqlCommand cmd3 = new SqlCommand();
        cmd3.CommandText = "Insert into Paper(userID,conferenceID,title,summary,status) VALUES ('" + Session["USERSession"] + "','" + conf + "','" + txtTitle.Text + "','" + txtSummary.Text + "','" + defaultValue + "')";
        cmd3.Connection = conn;
        cmd3.ExecuteNonQuery();

        SqlCommand cmd4 = new SqlCommand();
        SqlDataReader dr2;
        cmd4.CommandText = "SELECT TOP 1 [paperID] FROM [dbo].[Paper] WHERE [userID]='" + Session["USERSession"] + "' AND [conferenceID]='" + conf + "' ORDER BY [paperID] DESC";
        cmd4.Connection = conn;
        dr2 = cmd4.ExecuteReader();
        dr2.Read();


        if (FileUpload1.HasFile)
        {
            byte[] fileData = FileUpload1.FileBytes;
            string type = FileUpload1.PostedFile.ContentType;
            string filename = FileUpload1.FileName;

            SqlCommand cmd5 = new SqlCommand();
            cmd5.CommandText = "Insert into Submission(userID,paperID,filename,extensionType,status,fileData) VALUES(@userID,@paperID,@filename,@extensionType,@status,@fileData)";
            cmd5.Connection = conn;
            cmd5.Parameters.AddWithValue("@userID", Session["USERSession"]);
            cmd5.Parameters.AddWithValue("@paperID", dr2["paperID"].ToString());
            cmd5.Parameters.AddWithValue("@filename", filename);
            cmd5.Parameters.AddWithValue("@extensionType", type);
            cmd5.Parameters.AddWithValue("@status", defaultValue);
            cmd5.Parameters.AddWithValue("@fileData", fileData);

            cmd5.ExecuteNonQuery();
        }

        conn.Close();

        MessageBox.Show("Your application has been submitted successfully!");

        Server.TransferRequest(Request.Url.AbsolutePath, false);
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
