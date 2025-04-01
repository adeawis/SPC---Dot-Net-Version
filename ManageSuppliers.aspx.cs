using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatePharmaceuticalCooperations.Admin
{
    public partial class ManageSuppliers : System.Web.UI.Page
    {
        localhost.SPCService client = new localhost.SPCService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadSuppliers();
            }
        }

        private void LoadSuppliers()
        {
            DataSet ds = client.GetAllSuppliers();
            if (ds != null && ds.Tables.Count > 0)
            {
                gvSuppliers.DataSource = ds.Tables[0];
                gvSuppliers.DataBind();
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                int result = client.RegisterSupplier(
                    txtCompanyName.Text,
                    txtContactPerson.Text,
                    txtEmail.Text,
                    txtPhone.Text,
                    txtAddress.Text,
                    txtCity.Text,
                    txtCountry.Text,
                    txtLicenseNumber.Text,
                    txtBusinessType.Text,
                    txtBranchRegisteredAt.Text,
                    "defaultpassword" // You might want to add a password field or generate one
                );

                if (result > 0)
                {
                    lblMessage.Text = "Supplier registered successfully!";
                    ClearForm();
                    LoadSuppliers();
                }
                else
                {
                    lblMessage.Text = "Failed to register supplier.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int supplierId = Convert.ToInt32(ViewState["SupplierID"]);
                int result = client.UpdateSupplier(
                    supplierId,
                    txtCompanyName.Text,
                    txtContactPerson.Text,
                    txtEmail.Text,
                    txtPhone.Text,
                    txtAddress.Text,
                    txtCity.Text,
                    txtCountry.Text,
                    txtLicenseNumber.Text,
                    txtBusinessType.Text,
                    txtBranchRegisteredAt.Text,
                    ddlStatus.SelectedValue,
                    //"Pending", // You might want to add a status dropdown
                    true // IsActive
                );

                if (result > 0)
                {
                    lblMessage.Text = "Supplier updated successfully!";
                    ClearForm();
                    LoadSuppliers();
                    btnSave.Visible = true;
                    btnUpdate.Visible = false;
                }
                else
                {
                    lblMessage.Text = "Failed to update supplier.";
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        protected void gvSuppliers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvSuppliers.Rows[index];
            int supplierId = Convert.ToInt32(gvSuppliers.DataKeys[index].Value);

            if (e.CommandName == "EditSupplier")
            {
                ViewState["SupplierID"] = supplierId;
                PopulateFormForEdit(row);
                btnSave.Visible = false;
                btnUpdate.Visible = true;
            }
            else if (e.CommandName == "DeleteSupplier")
            {
                try
                {
                    int result = client.DeleteSupplier(supplierId);
                    if (result > 0)
                    {
                        lblMessage.Text = "Supplier deleted successfully!";
                        LoadSuppliers();
                    }
                    else
                    {
                        lblMessage.Text = "Failed to delete supplier.";
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "Error: " + ex.Message;
                }
            }
        }

        private void PopulateFormForEdit(GridViewRow row)
        {
            txtCompanyName.Text = row.Cells[1].Text;
            txtContactPerson.Text = row.Cells[2].Text;
            txtEmail.Text = row.Cells[3].Text;
            txtPhone.Text = row.Cells[4].Text;
            txtAddress.Text = row.Cells[5].Text;
            txtCity.Text = row.Cells[6].Text;
            txtCountry.Text = row.Cells[7].Text;
            txtLicenseNumber.Text = row.Cells[8].Text;
            txtBusinessType.Text = row.Cells[9].Text;
            txtBranchRegisteredAt.Text = row.Cells[10].Text;
            DropDownList ddlStatus = (DropDownList)row.FindControl("ddlStatus");
            if (ddlStatus != null)
            {
                // Set the selected value of the dropdown
                ddlStatus.SelectedValue = row.Cells[11].Text;
            }
            // Add other fields as needed
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/WelcomeSPC.aspx");
        }

        private void ClearForm()
        {
            txtCompanyName.Text = string.Empty;
            txtContactPerson.Text = string.Empty;
            txtEmail.Text = string.Empty;
            txtPhone.Text = string.Empty;
            txtAddress.Text = string.Empty;
            txtCity.Text = string.Empty;
            txtCountry.Text = string.Empty;
            txtLicenseNumber.Text = string.Empty;
            txtBusinessType.Text = string.Empty;
            txtBranchRegisteredAt.Text = string.Empty;
            ViewState["SupplierID"] = null;
            btnSave.Visible = true;
            btnUpdate.Visible = false;
        }
    }
}