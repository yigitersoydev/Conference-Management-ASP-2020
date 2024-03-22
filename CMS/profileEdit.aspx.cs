using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Windows.Forms;

public partial class profileEdit : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=YIGIT\\SQLEXPRESS;Initial Catalog=CMS;Integrated Security=True;MultipleActiveResultSets=true;");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            if (Session["USERSession"] == null)
            {
                pnlProfileBtn.Visible = false;
                pnlSignOut.Visible = false;
                pnlLogReg.Visible = true;
                Response.Redirect("Login.aspx");
            }
            else
            {
                pnlProfileBtn.Visible = true;
                pnlSignOut.Visible = true;
                pnlLogReg.Visible = false;

                SqlCommand cmd = new SqlCommand();
                SqlDataReader dr;
                cmd.CommandText = "SELECT * FROM [User] " +
                                  " WHERE [userID]= '" + Session["USERSession"].ToString() + "'";
                cmd.Connection = conn;
                conn.Open();
                dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    TextBox1.Text = dr["name"].ToString();
                    TextBox2.Text = dr["surname"].ToString();
                    TextBox3.Text = dr["phoneNumber"].ToString();
                    TextBox4.Text = dr["email"].ToString();
                    TextBox5.Text = dr["department"].ToString();
                    TextBox6.Text = dr["address"].ToString();
                }

                conn.Close();

            }
        }
       

    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand update = new SqlCommand(); 
      
        string user = Request.QueryString["userIDDD"];
        
        update.CommandText = " UPDATE [User] " +
                              " SET [name]='" + TextBox1.Text + "', [surname]='" + TextBox2.Text + "', [phoneNumber]='" + TextBox3.Text + "', [email]='" + TextBox4.Text + "', [department]='" + TextBox5.Text + "', [address]='" + TextBox6.Text + "', [password]='" + TextBox8.Text + "' " +
                              " WHERE [userID]='" + user + "'";
        
        update.Connection = conn;
        conn.Open();
        update.ExecuteNonQuery();
        conn.Close();

        MessageBox.Show("Updated!");
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