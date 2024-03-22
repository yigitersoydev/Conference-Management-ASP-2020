using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net;
using System.Windows;
using System.Windows.Forms;

public partial class contact : System.Web.UI.Page
{
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
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string namme = TextBox1.Text;
        string emaill = TextBox2.Text;
        string messagess = TextBox3.Text;

        MailMessage message = new MailMessage();
        SmtpClient smtp = new SmtpClient();
        message.From = new MailAddress("conferencemanagecms@gmail.com");    //maili gšnderen gmail
        message.To.Add(new MailAddress("yigit_ersoy@hotmail.com.tr"));       //mailin gšnderileceÛi 
        message.Subject = "FeedBack Mail From User";
        message.IsBodyHtml = true; //to make message body as html  
        message.Body = "This message was sent to you by the " + namme + " and e mail address is " + emaill + " . The message is: " + messagess + ".";
        smtp.Port = 587;
        smtp.Host = "smtp.gmail.com"; //for gmail host  
        smtp.EnableSsl = true;
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new NetworkCredential("conferencemanagecms@gmail.com", "ourSysTeam0017");
        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
        smtp.Send(message);
        MessageBox.Show("Sent!");
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