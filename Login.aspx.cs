using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using EA.Classes;

namespace EA
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            DataTable dtLogin = new DataTable();
            dtLogin = ClsLogin.DtLogin(txtNo_badge.Text, txtPassword.Text);

            if (dtLogin.Rows.Count != 0)
            {
                Response.Redirect("~/Dashboard.aspx");
            }
            else
            {
                lblWarning.Text = "Your Username or Password Incorrect";
            }

        }
    }
}