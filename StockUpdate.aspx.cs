using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatePharmaceuticalCooperations.Staff
{
    public partial class StockUpdate : System.Web.UI.Page
    {
        localhost.SPCService client = new localhost.SPCService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDrugs();
            }
        }

        private void LoadDrugs()
        {
            try
            {
                DataSet ds = client.GetAllDrugs();
                ddlDrugs.DataSource = ds.Tables[0];
                ddlDrugs.DataTextField = "DrugName";
                ddlDrugs.DataValueField = "DrugID";
                ddlDrugs.DataBind();
                ddlDrugs.Items.Insert(0, new System.Web.UI.WebControls.ListItem("-- Select Drug --", ""));

                if (ddlDrugs.Items.Count > 1)
                {
                    ShowCurrentStock();
                }
            }
            catch (Exception ex)
            {
                lblMessage.CssClass = "message error";
                lblMessage.Text = "Error loading drugs: " + ex.Message;
            }
        }

        protected void ddlDrugs_SelectedIndexChanged(object sender, EventArgs e)
        {
            ShowCurrentStock();
        }

        private void ShowCurrentStock()
        {
            if (!string.IsNullOrEmpty(ddlDrugs.SelectedValue))
            {
                try
                {
                    DataSet ds = client.GetAllDrugs();
                    DataRow[] rows = ds.Tables[0].Select("DrugID = " + ddlDrugs.SelectedValue);

                    if (rows.Length > 0)
                    {
                        txtCurrentStock.Text = rows[0]["Quantity"].ToString();
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.CssClass = "message error";
                    lblMessage.Text = "Error retrieving current stock: " + ex.Message;
                }
            }
            else
            {
                txtCurrentStock.Text = string.Empty;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                try
                {
                    if (string.IsNullOrEmpty(ddlDrugs.SelectedValue))
                    {
                        lblMessage.CssClass = "message error";
                        lblMessage.Text = "Please select a drug";
                        return;
                    }

                    int drugId = Convert.ToInt32(ddlDrugs.SelectedValue);
                    int currentStock = Convert.ToInt32(txtCurrentStock.Text);
                    int quantityToAdd = Convert.ToInt32(txtQuantityToAdd.Text);

                    if (quantityToAdd <= 0)
                    {
                        lblMessage.CssClass = "message error";
                        lblMessage.Text = "Please enter a valid quantity";
                        return;
                    }

                    // Get the current drug details
                    DataSet ds = client.GetAllDrugs();
                    DataRow[] rows = ds.Tables[0].Select("DrugID = " + drugId);

                    if (rows.Length > 0)
                    {
                        string drugName = rows[0]["DrugName"].ToString();
                        string description = rows[0]["Description"].ToString();
                        decimal unitPrice = Convert.ToDecimal(rows[0]["UnitPrice"]);
                        string manufacturer = rows[0]["Plant"].ToString();
                        string status = rows[0]["Status"].ToString();

                        // Update the drug with new quantity
                        int result = client.updateDrug(
                            drugId,
                            drugName,
                            description,
                            currentStock + quantityToAdd,
                            unitPrice,
                            manufacturer,
                            status
                        );

                        if (result > 0)
                        {
                            lblMessage.CssClass = "message success";
                            lblMessage.Text = "Stock updated successfully";
                            ShowCurrentStock();
                            txtQuantityToAdd.Text = string.Empty;

                            lblMessage.Text += "<script>setTimeout(function() { document.getElementById('lblMessage').innerText = ''; }, 3000);</script>";
                        }
                        else
                        {
                            lblMessage.CssClass = "message error";
                            lblMessage.Text = "Failed to update stock";

                            lblMessage.Text += "<script>setTimeout(function() { document.getElementById('lblMessage').innerText = ''; }, 3000);</script>";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lblMessage.CssClass = "message error";
                    lblMessage.Text = "Error updating stock: " + ex.Message;
                }
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