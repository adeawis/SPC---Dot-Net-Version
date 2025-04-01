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
    public partial class SupplierLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                SPCService spcService = new SPCService();
                Supplier sup = spcService.LoginSupplier(txtEmail.Text.Trim(), txtPassword.Text.Trim());

                if (sup != null)
                {
                    Session["SupplierID"] = sup.SupplierID;
                    Session["Email"] = sup.Email;
                    Session["Password"] = sup.Password;

                    FormsAuthentication.SetAuthCookie(sup.Email, false);
                    Response.Redirect("~/SPCSuppliers/SupplierHome.aspx");
                }
                else
                {
                    lblMessage.Text = "Invalid email or password.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Login error: " + ex.Message;
            }
        }
    }
}