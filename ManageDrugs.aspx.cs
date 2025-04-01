using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Business;

namespace StatePharmaceuticalCooperations.Admin
{
    public partial class ManageDrugs : System.Web.UI.Page
    {
        localhost.SPCService client = new localhost.SPCService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadDrugs();
            }
        }

        private void ClearForm()
        {
            txtDrugName.Text = "";
            txtDescription.Text = "";
            txtQuantity.Text = "";
            txtUnitPrice.Text = "";
            ddlPlant.SelectedIndex = 0;
            ddlStatus.SelectedIndex = 0;
        }

        private void loadDrugs()
        {
            try
            {
                DataSet ds = client.GetAllDrugs(); // Fetch all drugs

                if (ds != null && ds.Tables.Count > 0)
                {
                    gvProducts.DataSource = ds.Tables[0]; // Bind data to GridView
                    gvProducts.DataBind();
                }
                else
                {
                    gvProducts.DataSource = null;
                    gvProducts.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Handle errors
                lblMessage.Text = "Error loading drugs: " + ex.Message;
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/WelcomeSPC.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                SPCService client = new SPCService();

                string name = txtDrugName.Text;
                string description = txtDescription.Text;
                int quantity = Convert.ToInt32(txtQuantity.Text);
                decimal unitPrice = Convert.ToDecimal(txtUnitPrice.Text);
                string plant = ddlPlant.Text;
                string status = ddlStatus.Text;

                int result = client.addDrugs(name, description, quantity, unitPrice, plant, status);

                if (result > 0)
                {
                    lblMessage.Text = "Drug Added Successfully!";
                    ClearForm();
                    loadDrugs();

                    lblMessage.Text += "<script>setTimeout(function() { document.getElementById('lblMessage').innerText = ''; }, 3000);</script>";
                }
                else
                {
                    lblMessage.Text = "Drug Adding Failed! Try Again";

                    lblMessage.Text += "<script>setTimeout(function() { document.getElementById('lblMessage').innerText = ''; }, 3000);</script>";
                }
            }

            catch (Exception ex)
            {

                lblMessage.Text = "Error: " + ex.Message;
            }
        }

        protected void btnClear_Click(object sender, EventArgs e)
        {
            ClearForm();
        }

        protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {
                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvProducts.Rows[index];

                txtDrugName.Text = row.Cells[1].Text;
                txtDescription.Text = row.Cells[2].Text;
                txtQuantity.Text = row.Cells[3].Text;
                txtUnitPrice.Text = row.Cells[4].Text;
                ddlPlant.SelectedValue = row.Cells[5].Text;
                ddlStatus.SelectedValue = row.Cells[6].Text;

                ViewState["EditingProductId"] = gvProducts.DataKeys[index].Value;
            }
        }

        protected void gvProducts_RowEditing(object sender, System.Web.UI.WebControls.GridViewEditEventArgs e)
        {
            gvProducts.EditIndex = e.NewEditIndex;
            loadDrugs();
        }

        protected void gvProducts_RowUpdating(object sender, System.Web.UI.WebControls.GridViewUpdateEventArgs e)
        {
            try
            {
                SPCService client = new SPCService();
                string name = ((TextBox)gvProducts.Rows[e.RowIndex].Cells[1].Controls[0]).Text;
                string description = ((TextBox)gvProducts.Rows[e.RowIndex].Cells[2].Controls[0]).Text;
                int quantity = Convert.ToInt32(((TextBox)gvProducts.Rows[e.RowIndex].Cells[3].Controls[0]).Text);
                decimal unitPrice = Convert.ToDecimal(((TextBox)gvProducts.Rows[e.RowIndex].Cells[4].Controls[0]).Text);

                // Check if the control is a DropDownList, otherwise treat as a TextBox
                string plant = string.Empty;
                string status = string.Empty;

                var plantControl = gvProducts.Rows[e.RowIndex].Cells[5].Controls[0];
                if (plantControl is DropDownList)
                {
                    plant = ((DropDownList)plantControl).SelectedItem.Text;
                }
                else if (plantControl is TextBox)
                {
                    plant = ((TextBox)plantControl).Text;
                }

                var statusControl = gvProducts.Rows[e.RowIndex].Cells[6].Controls[0];
                if (statusControl is DropDownList)
                {
                    status = ((DropDownList)statusControl).SelectedItem.Text;
                }
                else if (statusControl is TextBox)
                {
                    status = ((TextBox)statusControl).Text;
                }

                int result = client.updateDrug(Convert.ToInt32(ViewState["EditingProductId"]), name, description, quantity, (decimal)unitPrice, plant, status);

                if (result > 0)
                {
                    lblMessage.Text = "Drug Updated Successfully!";
                }
                else
                {
                    lblMessage.Text = "Drug Updating Failed! Try Again";
                }

                gvProducts.EditIndex = -1;
                loadDrugs();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }


        protected void gvProducts_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gvProducts.EditIndex = -1;
            loadDrugs();
        }

        protected void gvProducts_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                // Find the delete button inside the row
                LinkButton lnkDelete = (LinkButton)e.Row.Cells[e.Row.Cells.Count - 1].Controls[2]; // Adjust index if necessary

                if (lnkDelete != null && lnkDelete.CommandName == "Delete")
                {
                    lnkDelete.OnClientClick = "return confirm('Are you sure you want to delete this drug?');";
                }
            }
        }
        protected void gvProducts_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                

                SPCService client = new SPCService();
                int result = client.deleteDrug(Convert.ToInt32(gvProducts.DataKeys[e.RowIndex].Value));
                if (result > 0)
                {
                    lblMessage.Text = "Drug Deleted Successfully!";

                }
                else
                {
                    lblMessage.Text = "Drug Deleting Failed! Try Again";
                }
                loadDrugs();
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error: " + ex.Message;
            }
        }
    }
}