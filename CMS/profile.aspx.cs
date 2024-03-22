using System;using System.Collections.Generic;using System.Linq;using System.Web;using System.Web.UI;using System.Web.UI.WebControls;using System.Data.SqlClient;using System.Windows;

public partial class profile : System.Web.UI.Page
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

        if (Session["USERSession"] != null)
        {
            pnlProfileBtn.Visible = true;

            //string userIDD = Session["USERSession"].ToString();
            SqlCommand veriOkuma = new SqlCommand();
            conn.Open();

            veriOkuma.CommandText = ("SELECT * " +
                                    "FROM     [User]"+
                                    "WHERE      [userID]='" + Session["USERSession"] + "'");
            veriOkuma.Connection = conn;
            SqlDataReader reader;
            reader = veriOkuma.ExecuteReader();
            Repeater4.DataSource = reader;
            Repeater4.DataBind();

            reader.Close();

            conn.Close();

            string userrr = Request.QueryString["userIDDD"];

            if (userrr != null)
            {
                Response.Redirect("profileEdit.aspx?userID=" + userrr);
            }
        }
        else
        {
            pnlProfileBtn.Visible = false;
            Response.Redirect("Login.aspx");
        }
    }

    protected void btnRegister_Click(object sender, EventArgs e)
    {
        Response.Redirect("Register.aspx");
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
}