using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Register : System.Web.UI.Page
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
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        conn.Open();
        SqlCommand kontrol = new SqlCommand("SELECT * FROM [User] " +
                                            "WHERE email=@email", conn);
        kontrol.Parameters.AddWithValue("email", TextBox4.Text);
        SqlDataReader dr = kontrol.ExecuteReader();
        if (dr.Read())
        {
            Label1.Text = "This mail is already registered!";
        }
        else
        {   //Üye kaydetme bölümü
            dr.Close();
            int activated = 0;
            string code1, code2;
            code1 = System.DateTime.Now.Millisecond.ToString();
            Random rasgele = new Random();
            int rndsayi = rasgele.Next(1100, 99999999);
            code2 = rndsayi.ToString();
            SqlCommand sorgu = new SqlCommand("INSERT INTO [User] (username, name, surname, email, password, department, address, code1, code2, activated) " +
                                            "VALUES ('" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "', '" + TextBox4.Text + "', '" + TextBox5.Text + "', '" + TextBox6.Text + "', '" + TextBox7.Text + "', '" + code1 + "', '" + code2 + "', '" + activated + "')", conn);
            sorgu.ExecuteNonQuery();

            MailMessage message = new MailMessage();
            SmtpClient smtp = new SmtpClient();
            message.From = new MailAddress("conferencemanagecms@gmail.com", "Conference Management");    //maili gšnderen gmail
            message.To.Add(new MailAddress(TextBox4.Text));       //mailin gšnderileceÛi 
            message.Subject = "Activation Code";
            string yol = "https://" + Request.Url.Authority + "/linkedPage.aspx?kod=" + code2;
            message.IsBodyHtml = true; //to make message body as html  
            message.Body = "Click the link for activation " + yol;
            smtp.Port = 587;
            smtp.Host = "smtp.gmail.com"; //for gmail host  
            smtp.EnableSsl = true;
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = new NetworkCredential("conferencemanagecms@gmail.com", "ourSysTeam0017");
            smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            smtp.Send(message);
            Label1.Text = "Kayıt Başarılı bir şekilde sonlandı.";
            conn.Close();
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