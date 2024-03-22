using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Net.Mail;
using System.Windows.Forms;
using System.Net;
using CheckBox = System.Web.UI.WebControls.CheckBox;

public partial class applicationDetail : System.Web.UI.Page
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

        if (!Page.IsPostBack)
        {
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            string user = Request.QueryString["userID"];
            string conf = Request.QueryString["conf"];

            cmd.CommandText = "SELECT [name],[surname],[department],[email],[address] FROM [dbo].[ApplicantsOfConference] AS A INNER JOIN [dbo].[User] AS U ON U.userID = A.userID WHERE A.userID=" + user + "AND A.conferenceID=" + conf;
            cmd.Connection = conn;
            conn.Open();
            dr = cmd.ExecuteReader();
            rptr_User.DataSource = dr;
            rptr_User.DataBind();
            conn.Close();

        }
    }

    protected void btnConfirm_Click(object sender, EventArgs e)
    {
        string user = Request.QueryString["userID"];
        string conf = Request.QueryString["conf"];

        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        cmd.CommandText = "SELECT [name],[email] FROM [dbo].[ApplicantsOfConference] AS A INNER JOIN [dbo].[User] AS U ON U.userID = A.userID WHERE A.userID=" + user + "AND A.conferenceID=" + conf;
        cmd.Connection = conn;
        conn.Open();
        dr = cmd.ExecuteReader();
        dr.Read();

        for (int i = 0; i < rptr_User.Items.Count; i++)
        {
            CheckBox chk = ((CheckBox)rptr_User.Items[i].FindControl("chkPaid"));

            if (chk.Checked)
            {
                MailMessage message = new MailMessage();
                SmtpClient smtp = new SmtpClient();
                message.From = new MailAddress("conferencemanagecms@gmail.com");    //maili gšnderen gmail
                message.To.Add(new MailAddress(dr["email"].ToString()));       //mailin gšnderileceÛi 
                message.Subject = "FeedBack Mail From User";
                message.IsBodyHtml = true; //to make message body as html  
                message.Body = "Hi " + dr["name"].ToString() + ",<br/><br/>You're in!<br/><br/>Thank you for applying to our conference! We're excited to have you with us.<br/><br/>If you have any questions or run into any problems, you can reach out to us directly at conferencemanagecms@gmail.com<br/><br/>Best of luck!<br/><br/>-Conference Administrator";
                smtp.Port = 587;
                smtp.Host = "smtp.gmail.com"; //for gmail host  
                smtp.EnableSsl = true;
                smtp.UseDefaultCredentials = false;
                smtp.Credentials = new NetworkCredential("conferencemanagecms@gmail.com", "ourSysTeam0017");
                smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
                smtp.Send(message);
                MessageBox.Show("Information mail has been sent.!");

                SqlCommand cmd2 = new SqlCommand();
                cmd2.CommandText = "UPDATE [dbo].[ApplicantsOfConference] SET [statusOfPayment]=1,[statusOfApplication]=1 WHERE [userID]=" + user + " AND [conferenceID]=" + conf;
                cmd2.Connection = conn;
                cmd2.ExecuteNonQuery();
            }
            else
            {
                MessageBox.Show("If you approve, please tick the box!");
            }
        }

        conn.Close();
    }

    protected void btnReject_Click(object sender, EventArgs e)
    {
        string user = Request.QueryString["userID"];
        string conf = Request.QueryString["conf"];

        SqlCommand cmd = new SqlCommand();
        SqlDataReader dr;
        cmd.CommandText = "SELECT [name],[email] FROM [dbo].[ApplicantsOfConference] AS A INNER JOIN [dbo].[User] AS U ON U.userID = A.userID WHERE A.userID=" + user + "AND A.conferenceID=" + conf;
        cmd.Connection = conn;
        conn.Open();
        dr = cmd.ExecuteReader();
        dr.Read();

        MailMessage message = new MailMessage();
        SmtpClient smtp = new SmtpClient();
        message.From = new MailAddress("conferencemanagecms@gmail.com");    //maili gšnderen gmail
        message.To.Add(new MailAddress(dr["email"].ToString()));       //mailin gšnderileceÛi 
        message.Subject = "FeedBack Mail From User";
        message.IsBodyHtml = true; //to make message body as html  
        message.Body = "Hi " + dr["name"].ToString() + ",<br/><br/>Thank you for your application to our conference! We enjoyed getting to know more about you. We appreciate you sharing information about yourself with us.<br/><br/>Determining the recipient of the conference is always a difficult decision and is based on many factors.<br/><br/>I regret to inform you that you were not be able to attend our conference.<br/><br/>I wish you best of luck!<br/><br/>Sincerely,<br/><br/>Conference Administrator";
        smtp.Port = 587;
        smtp.Host = "smtp.gmail.com"; //for gmail host  
        smtp.EnableSsl = true;
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new NetworkCredential("conferencemanagecms@gmail.com", "ourSysTeam0017");
        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtp.Send(message);
        MessageBox.Show("Information mail has been sent.!");

        SqlCommand cmd2 = new SqlCommand();
        cmd2.CommandText = "DELETE FROM [dbo].[ApplicantsOfConference] WHERE [userID]=" + user + " AND [conferenceID]=" + conf;
        cmd2.Connection = conn;
        cmd2.ExecuteNonQuery();


        conn.Close();
    }

    protected void btnView_Click(object sender, EventArgs e)
    {
        string user = Request.QueryString["userID"];
        string conf = Request.QueryString["conf"];

        SqlDataReader dr;
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT S.[filename],S.[extensionType],S.[fileData] FROM [dbo].[Submission] AS S INNER JOIN [dbo].[Paper] AS P ON P.paperID = S.paperID WHERE P.[userID]=" + user + " AND P.[conferenceID]=" + conf + "";
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