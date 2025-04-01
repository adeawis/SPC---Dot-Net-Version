using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatePharmaceuticalCooperations
{
    public partial class UserRegistration : System.Web.UI.Page
    {
        localhost.SPCService client = new localhost.SPCService();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {

                string Username = txtUsername.Text;
                string Password = txtPassword.Text;
                string UserType = ddlUserType.SelectedValue;
                string Email = txtEmail.Text;
                string ContactNo = txtContactNo.Text;
                bool IsActive = true;

                int result = client.RegisterUser(0, Username, Password, UserType, Email, ContactNo, IsActive);

                if (result > 0)
                {
                    lblMessage.Text = "Registration Successfull!";
                    clearForm();

                    lblMessage.Text += "<script>setTimeout(function() { document.getElementById('lblMessage').innerText = ''; }, 3000);</script>";
                }
                else
                {
                    lblMessage.Text = "Registration Failed! Try Again";

                    lblMessage.Text += "<script>setTimeout(function() { document.getElementById('lblMessage').innerText = ''; }, 3000);</script>";
                }
            }

            catch (Exception ex)
            {

                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        private void clearForm()
        {
            txtUsername.Text = "";
            txtPassword.Text = "";
            txtEmail.Text = "";
            txtContactNo.Text = "";
            txtConfirmPassword.Text = "";
            ddlUserType.SelectedIndex = 0;
        }
    }
}