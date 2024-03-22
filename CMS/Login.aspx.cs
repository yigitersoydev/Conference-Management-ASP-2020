using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class Login : System.Web.UI.Page
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
            Response.Redirect("Home.aspx");
        }

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string usernamee = TextBox1.Text;
        string passwordd = TextBox2.Text;
        conn.Open();
        SqlCommand giris = new SqlCommand("SELECT * FROM [User]" +
                                          "WHERE username = '" + usernamee + "' AND password = '" + passwordd + "' ", conn);
        SqlDataReader oku = giris.ExecuteReader();


        if (oku.Read())
        {
            SqlCommand controll = new SqlCommand("SELECT * FROM [User]" +
                                                "WHERE username='" + usernamee + "' and activated =1 ", conn);
            SqlDataReader oku2 = controll.ExecuteReader();

            if (oku2.Read())
            {
                Session.Add("USERSession", oku2["userID"].ToString());
                Response.Redirect("Home.aspx");
                //Label1.Text = "Hoşgeldin " + " " + usernamee;
            }
            else
                Label1.Text = "This account is not activated!";
        }
        else
        {
            Label1.Text = "Wrong password or username!";
        }
        conn.Close();
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        Response.Redirect("Login.aspx");
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
    }

    protected void btnSignOut_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("Login.aspx");
    }
}
