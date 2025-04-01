using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatePharmaceuticalCooperations.SPCSuppliers
{
    public partial class SubmitTender : System.Web.UI.Page
    {
        localhost.SPCService client = new localhost.SPCService();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void clearForm()
        {
            txtCompanyName.Text = string.Empty;
            txtContactPerson.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtProductName.Text = string.Empty;
            txtManufacturer.Text = string.Empty;
            txtUnitPrice.Text = string.Empty;
            txtQuantity.Text = string.Empty;
            txtDeliveryTime.Text = string.Empty;
            txtComments.Text = string.Empty;
            txtCompanyName.Focus();
        }
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            try
            {
                string company = txtCompanyName.Text;
                string person = txtContactPerson.Text;
                string email = txtEmail.Text;
                string phone = txtPhone.Text;
                string product = txtProductName.Text;
                string manufac = txtManufacturer.Text;
                decimal unit = Convert.ToDecimal(txtUnitPrice.Text);
                int quantity = Convert.ToInt32(txtQuantity.Text);
                int timeline = Convert.ToInt32(txtDeliveryTime.Text);
                string comment = txtComments.Text;

                if (client.insertTender(company, person, email, phone, product, manufac, unit, quantity, timeline, comment) > 0)
                {
                    lblMessage.Text = "Tender Successfully Submitted!";
                    clearForm();
                }
                else
                {
                    lblMessage.Text = "Submittion failed! Try Again!";
                }
            }
            catch (Exception ex)
            {

                lblMessage.Text = ex.Message;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/WelcomeSPC.aspx");
        }
    }
}