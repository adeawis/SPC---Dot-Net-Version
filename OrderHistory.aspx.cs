using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatePharmaceuticalCooperations.Pharmacy
{
    public partial class OrderHistory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Check if the user is logged in
                if (Session["UserId"] != null)
                {
                    int userId = Convert.ToInt32(Session["UserId"]);
                    LoadOrderHistory(userId);
                }
                else
                {
                    lblMessage.Text = "You must be logged in to view your order history.";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        private void LoadOrderHistory(int userId)
        {
            try
            {
                // Create an instance of the web service proxy
                SPCService service = new SPCService();

                // Call the method to fetch the order history
                System.Data.DataSet dsOrderHistory = service.GetOrderHistoryWithDrugDetails(userId);

                if (dsOrderHistory.Tables.Count > 0 && dsOrderHistory.Tables[0].Rows.Count > 0)
                {
                    // Bind the DataSet to the GridView
                    gvOrderHistory.DataSource = dsOrderHistory;
                    gvOrderHistory.DataBind();
                }
                else
                {
                    lblMessage.Text = "No orders found for this user.";
                    lblMessage.ForeColor = System.Drawing.Color.Orange;
                }
            }
            catch (Exception ex)
            {
                // Handle any errors that occur during data retrieval
                lblMessage.Text = "An error occurred while fetching your order history: " + ex.Message;
                lblMessage.ForeColor = System.Drawing.Color.Red;
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