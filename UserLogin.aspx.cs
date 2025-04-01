using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;

namespace StatePharmaceuticalCooperations
{
    public partial class UserLogin : System.Web.UI.Page
    {
        localhost.SPCService client = new localhost.SPCService();
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            //    Session.Clear();
            //}
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SPCService spcService = new SPCService();
                User user = spcService.ValidateUser(txtUsername.Text.Trim(), txtPassword.Text);

                if (user != null) // Ensure 'user' is not null before accessing properties
                {
                    if (!string.IsNullOrEmpty(user.UserType))
                    {
                        Session["UserId"] = user.UserId;
                        Session["Username"] = user.Username;
                        Session["UserType"] = user.UserType;

                        FormsAuthentication.SetAuthCookie(user.Username, false);

                        switch (user.UserType.ToLower())
                        {

                            case "pharmacy":
                                Response.Redirect("~/Pharmacy/PharmacyHome.aspx");
                                break;
                            case "staff":
                                Response.Redirect("~/Staff/StaffHome.aspx");
                                break;
                            default:
                                Response.Redirect("~/WelcomeSPC.aspx");
                                break;
                        }
                    }
                    else
                    {
                        lblMessage.Text = "UserType is not set. Please contact support.";
                    }
                }
                else
                {
                    lblMessage.Text = "Invalid username or password.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error during login: " + ex.Message;
            }
        }
    }
}