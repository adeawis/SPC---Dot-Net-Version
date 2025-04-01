using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatePharmaceuticalCooperations.Pharmacy
{
    public partial class PlaceOrder : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                if (Session["UserId"] == null)
                {
                    Response.Redirect("~/UserLogin.aspx");
                }

                LoadAvailableDrugs();
            }
        }

        private void LoadAvailableDrugs()
        {
            SPCService service = new SPCService();
            DataSet ds = service.GetAllDrugs();
            gvProducts.DataSource = ds;
            gvProducts.DataBind();
        }

        protected void gvProducts_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Order")
            {
                int rowIndex = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = gvProducts.Rows[rowIndex];

                int drugId = Convert.ToInt32(gvProducts.DataKeys[rowIndex].Value);
                TextBox txtQuantity = (TextBox)row.FindControl("txtQuantity");
                int quantity;

                if (int.TryParse(txtQuantity.Text, out quantity) && quantity > 0)
                {
                    SPCService service = new SPCService();
                    int userId = Convert.ToInt32(Session["UserId"]);
                    DateTime orderDate = DateTime.Now;
                    string status = "Pending";

                    int result = service.InsertOrder(drugId, userId, quantity, orderDate, status);

                    if (result > 0) // If order is successful
                    {
                        // Update the drug quantity
                        int updateResult = service.UpdateDrugQuantity(drugId, quantity);

                        if (updateResult > 0)
                        {
                            lblMessage.Text = "<span class='text-success'>Order placed successfully!</span>";
                            LoadAvailableDrugs(); // Refresh the GridView
                        }
                        else
                        {
                            lblMessage.Text = "<span class='text-danger'>Failed to update drug quantity.</span>";
                        }
                    }
                    else
                    {
                        lblMessage.Text = "<span class='text-danger'>Order placement failed.</span>";
                    }
                }
                else
                {
                    lblMessage.Text = "<span class='text-danger'>Please enter a valid quantity.</span>";
                }
            }
        }
        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                SPCService service = new SPCService();
                string searchTerm = txtSearch.Text.Trim();
                if (string.IsNullOrEmpty(searchTerm))
                {
                    lblMessage.Text = "<span class='text-danger'>Please enter a drug name to search.</span>";
                    return;
                }

                List<string> searchResults = service.searchByDrugName(searchTerm);

                if (searchResults != null && searchResults.Any())
                {
                    // Get all drugs and filter based on search results
                    DataSet allDrugs = service.GetAllDrugs();
                    DataTable dt = allDrugs.Tables[0];

                    DataTable filteredDt = dt.Clone(); // Create new table with same structure
                    foreach (DataRow row in dt.Rows)
                    {
                        if (searchResults.Contains(row["DrugName"].ToString()))
                        {
                            filteredDt.ImportRow(row);
                        }
                    }

                    gvProducts.DataSource = filteredDt;
                    gvProducts.DataBind();
                    lblMessage.Text = "<span class='text-success'>Search results found.</span>";
                }
                else
                {
                    lblMessage.Text = "<span class='text-warning'>No drugs found matching your search.</span>";
                    gvProducts.DataSource = null;
                    gvProducts.DataBind();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "<span class='text-danger'>Error during search: " + ex.Message + "</span>";
            }
        }

        protected void btnShowAll_Click(object sender, EventArgs e)
        {
            txtSearch.Text = string.Empty;
            LoadAvailableDrugs();
            lblMessage.Text = string.Empty;
        }
        protected void btnCancelOrder_Click(object sender, EventArgs e)
        {
            Response.Redirect("HomePharmacy.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/WelcomeSPC.aspx");
        }
    }
}