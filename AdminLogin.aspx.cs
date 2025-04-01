using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatePharmaceuticalCooperations
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        localhost.SPCService spc = new localhost.SPCService();
        protected void Page_Load(object sender, EventArgs e)
        {
            lblMessage.Text = ""; // Clear any previous error message
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string username = txtUsername.Text.Trim();
            string password = txtPassword.Text.Trim();

            // Hardcoded credentials
            if (username == "adminspc" && password == "SPC123")
            {
                // Store admin session
                Session["AdminUsername"] = username;
                Response.Redirect("~/Admin/Dashboard.aspx"); // Redirect to admin dashboard
            }
            else
            {
                lblMessage.Text = "Invalid username or password.";
            }
        }
    }
}