using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatePharmaceuticalCooperations.SPCSuppliers
{
    public partial class RegSupplier : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                SPCService client = new SPCService();

                string Comname = txtCompanyName.Text;
                string ContPerson = txtContactPerson.Text;
                string email = txtEmail.Text;
                string phone = txtPhone.Text;
                string address = txtAddress.Text;
                string city = txtCity.Text;
                string country = txtCountry.Text;
                string licence = txtLicenseNumber.Text;
                string type = ddlBusinessType.Text;
                string regBranch = ddlBranch.Text;
                string pass = txtPassword.Text;

                int result = client.RegisterSupplier(Comname, ContPerson, email, phone, address, city, country, licence, type, regBranch, pass);

                if (result > 0)
                {
                    lblMessage.Text = "Registered Successfully!";
                    ClearFields();
                }
                else
                {
                    lblMessage.Text = "Registration Failed! Please Try Again!";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        private void ClearFields()
        {
            txtCompanyName.Text = "";
            txtContactPerson.Text = "";
            txtEmail.Text = "";
            txtPhone.Text = "";
            txtAddress.Text = "";
            txtCity.Text = "";
            txtCountry.Text = "";
            txtLicenseNumber.Text = "";
            ddlBusinessType.SelectedIndex = 0;
            ddlBranch.SelectedIndex = 0;
            txtPassword.Text = "";
        }
    }
}