using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatePharmaceuticalCooperations
{
    public partial class DisplayDrugs : System.Web.UI.Page
    {
        localhost.SPCService client = new localhost.SPCService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDrugs();
            }
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/WelcomeSPC.aspx");
        }

        private void LoadDrugs()
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

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                string searchQuery = txtSearch.Text.Trim();


                if (string.IsNullOrEmpty(searchQuery))
                {
                    LoadDrugs();
                }
                else
                {
                    List<string> searchResult = client.searchByDrugName(searchQuery).ToList();

                    if (searchResult.Count > 0)
                    {
                        DataTable dt = new DataTable();

                        dt.Columns.Add("DrugName");
                        dt.Columns.Add("Description");

                        dt.Columns.Add("UnitPrice");
                        dt.Columns.Add("Plant");
                        dt.Columns.Add("Status");

                        dt.Rows.Add(
                            searchResult[0], searchResult[1], searchResult[2],
                            searchResult[3], searchResult[4]
                        );

                        gvProducts.DataSource = dt;
                        gvProducts.DataBind();
                    }
                    else
                    {
                        gvProducts.DataSource = null;
                        gvProducts.DataBind();
                        lblMessage.Text = "No matching drugs found.";
                    }
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error searching drugs: " + ex.Message;
            }


        }
    }
}