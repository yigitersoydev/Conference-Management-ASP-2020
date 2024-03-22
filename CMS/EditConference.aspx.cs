using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;
using System.Windows;

public partial class EditConference : System.Web.UI.Page
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

            conn.Open();
            SqlCommand komut = new SqlCommand();
            string id = Request.QueryString["editConf"];
            komut.Connection = conn;
            komut.CommandText = "SELECT [conferenceSubject],[topic],[date],[dueDate],[location],[price] FROM [dbo].[Conference] WHERE [conferenceID]=" + id;
            SqlDataReader dr = komut.ExecuteReader();

            while (dr.Read())
            {
                TextBox1.Text = dr[0].ToString();
                TextBox2.Text = dr[1].ToString();
                TextBox3.Text = Convert.ToDateTime(dr[2]).ToString("dd.MM.yyyy");
                TextBox4.Text = Convert.ToDateTime(dr[3]).ToString("dd.MM.yyyy");
                TextBox5.Text = dr[4].ToString();
                TextBox6.Text = dr[5].ToString();

            }

            conn.Close();

        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand update = new SqlCommand();
        string id = Request.QueryString["editConf"];
        conn.Open();
        update.Connection = conn;
        update.CommandText = ("UPDATE [dbo].[Conference] SET [conferenceSubject] = '" + TextBox1.Text + "', [topic] = '" + TextBox2.Text + "', [date] = '" + Convert.ToDateTime(TextBox3.Text).ToString("yyyy-MM-dd") + "', [dueDate]  = '" + Convert.ToDateTime(TextBox4.Text).ToString("yyyy-MM-dd") + "', [location] = '" + TextBox5.Text + "', [price] = '" + TextBox6.Text + "' WHERE [conferenceID]=" + id);
        update.ExecuteNonQuery();
        conn.Close();

        Response.Redirect("anyConference.aspx?conff=" + id);

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