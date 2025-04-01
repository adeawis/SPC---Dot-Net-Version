using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatePharmaceuticalCooperations.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                LoadDashboardStats();
            }
        }

        private void LoadDashboardStats()
        {
            try
            {
                SPCService spcService = new SPCService();

                // Get total orders
                DataSet orderDS = spcService.GetAllOrders();
                if (orderDS != null && orderDS.Tables.Count > 0)
                {
                    lblTotalOrders.Text = orderDS.Tables[0].Rows.Count.ToString();
                }

                // Get active drugs
                DataSet drugDS = spcService.GetAllDrugs();
                if (drugDS != null && drugDS.Tables.Count > 0)
                {
                    // Count drugs where status is "Active" or similar status field
                    int activeDrugs = 0;
                    foreach (DataRow row in drugDS.Tables[0].Rows)
                    {
                        if (row["Status"].ToString().Equals("In Stock", StringComparison.OrdinalIgnoreCase))
                        {
                            activeDrugs++;
                        }
                    }
                    lblActiveDrugs.Text = activeDrugs.ToString();
                }

                // Get pending tenders
                DataSet tenderDS = spcService.GetAllTenders();
                if (tenderDS != null && tenderDS.Tables.Count > 0)
                {
                    // Assuming you want to count all tenders
                    // You might want to filter by status if you have a status field
                    lblPendingTenders.Text = tenderDS.Tables[0].Rows.Count.ToString();
                }

                // Get total registered users
                DataSet userDS = spcService.GetAllUsers();
                if (userDS != null && userDS.Tables.Count > 0)
                {
                    // Count active users if you have an IsActive field
                    int activeUsers = 0;
                    foreach (DataRow row in userDS.Tables[0].Rows)
                    {
                        if (Convert.ToBoolean(row["IsActive"]))
                        {
                            activeUsers++;
                        }
                    }
                    lblTotalUsers.Text = activeUsers.ToString();
                }
            }
            catch (Exception ex)
            {
                // Log the error and show a user-friendly message
                System.Diagnostics.Debug.WriteLine($"Error loading dashboard stats: {ex.Message}");
                ScriptManager.RegisterStartupScript(this, GetType(), "error",
                    "alert('An error occurred while loading dashboard statistics.');", true);
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