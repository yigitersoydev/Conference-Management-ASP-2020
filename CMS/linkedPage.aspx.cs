using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class linkedPage : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection("Data Source=.\\SQLEXPRESS;Initial Catalog=CMS;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework");
    protected void Page_Load(object sender, EventArgs e)
    {
        conn.Open();
        int kod;
        kod = Convert.ToInt32(Request.QueryString["kod"]);
        try
        {
            SqlCommand guncelle = new SqlCommand();
            guncelle.CommandText = "UPDATE [User] SET activated = 1 WHERE code2=" + kod;
            guncelle.Connection = conn;
            guncelle.ExecuteNonQuery();
            Label1.Text = "Başarıyla aktifleştirildi!";
            pnlSuccess.Visible = true;
            pnlFailure.Visible = false;
        }
        catch (Exception)
        {
            Label1.Text = "Aktifleştirme Başarısız!";
            pnlSuccess.Visible = false;
            pnlFailure.Visible = true;
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
