using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatePharmaceuticalCooperations.SPCSuppliers
{
    public partial class RegistrationDetails : System.Web.UI.Page
    {
        localhost.SPCService client = new localhost.SPCService();
        private int supplierId;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //if (Session["SupplierID"] == null)
                //{
                //    Response.Redirect("~/Login.aspx");
                //    return;
                //}

                supplierId = Convert.ToInt32(Session["SupplierID"]);
                LoadSupplierDetails();
            }
        }

        private void LoadSupplierDetails()
        {
            try
            {
                DataSet supplierData = client.GetAllSuppliers();
                if (supplierData != null && supplierData.Tables[0].Rows.Count > 0)
                {
                    DataRow[] rows = supplierData.Tables[0].Select($"SupplierID = {supplierId}");
                    if (rows.Length > 0)
                    {
                        DataRow supplierRow = rows[0];
                        txtCompanyName.Text = supplierRow["CompanyName"].ToString();
                        txtContactPerson.Text = supplierRow["ContactPerson"].ToString();
                        txtEmail.Text = supplierRow["Email"].ToString();
                        txtPhone.Text = supplierRow["Phone"].ToString();
                        txtAddress.Text = supplierRow["Address"].ToString();
                        txtCity.Text = supplierRow["City"].ToString();
                        txtCountry.Text = supplierRow["Country"].ToString();
                        txtLicenseNumber.Text = supplierRow["LicenseNumber"].ToString();
                        txtBusinessType.Text = supplierRow["BusinessType"].ToString();
                        txtBranchRegistered.Text = supplierRow["BranchRegisteredAt"].ToString();
                    }
                    else
                    {
                        lblMessage.Text = "Supplier details not found.";
                        lblMessage.CssClass = "alert alert-warning";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error loading supplier details: " + ex.Message;
                lblMessage.CssClass = "alert alert-danger";
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                supplierId = Convert.ToInt32(Session["SupplierID"]);
                int result = client.UpdateSupplier(
                    supplierId,
                    txtCompanyName.Text.Trim(),
                    txtContactPerson.Text.Trim(),
                    txtEmail.Text.Trim(),
                    txtPhone.Text.Trim(),
                    txtAddress.Text.Trim(),
                    txtCity.Text.Trim(),
                    txtCountry.Text.Trim(),
                    txtLicenseNumber.Text.Trim(),
                    txtBusinessType.Text.Trim(),
                    txtBranchRegistered.Text.Trim(),
                    "Active",  // Maintaining active status when updating
                    true      // Keeping account active
                );

                if (result > 0)
                {
                    lblMessage.Text = "Your details have been updated successfully!";
                    lblMessage.CssClass = "alert alert-success";
                }
                else
                {
                    lblMessage.Text = "Failed to update details. Please try again.";
                    lblMessage.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error updating details: " + ex.Message;
                lblMessage.CssClass = "alert alert-danger";
            }
        }

        protected void btnDeleteAccount_Click(object sender, EventArgs e)
        {
            try
            {
                supplierId = Convert.ToInt32(Session["SupplierID"]);
                int result = client.DeleteSupplier(supplierId);

                if (result > 0)
                {
                    Session.Clear();
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    lblMessage.Text = "Failed to delete account. Please try again or contact support.";
                    lblMessage.CssClass = "alert alert-danger";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error deleting account: " + ex.Message;
                lblMessage.CssClass = "alert alert-danger";
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