using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatePharmaceuticalCooperations.Admin
{
    public partial class ManageOrders : System.Web.UI.Page
    {
        localhost.SPCService client = new localhost.SPCService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadOrders();
            }
        }

        private void LoadOrders()
        {
            DataSet ds = client.GetAllOrders();
            gvOrders.DataSource = ds;
            gvOrders.DataBind();
        }

        protected void gvOrders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int orderId = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "UpdateOrder")
            {
                // Load order details into form
                DataSet ds = client.GetAllOrders();
                DataRow[] rows = ds.Tables[0].Select($"OrderID = {orderId}");

                if (rows.Length > 0)
                {
                    hdnOrderId.Value = orderId.ToString();
                    txtDrugId.Text = rows[0]["DrugID"].ToString();
                    txtUserId.Text = rows[0]["UserID"].ToString();
                    txtQuantity.Text = rows[0]["Quantity"].ToString();
                    txtOrderDate.Text = Convert.ToDateTime(rows[0]["OrderDate"]).ToString("yyyy-MM-dd");
                    ddlStatus.SelectedValue = rows[0]["Status"].ToString();
                }
            }
            else if (e.CommandName == "DeleteOrder")
            {
                try
                {
                    client.DeleteOrder(orderId);
                    LoadOrders();
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error deleting order: {ex.Message}');</script>");
                }
            }
        }

        protected void btnSaveUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                int orderId = Convert.ToInt32(hdnOrderId.Value);
                int drugId = Convert.ToInt32(txtDrugId.Text);
                int userId = Convert.ToInt32(txtUserId.Text);
                int quantity = Convert.ToInt32(txtQuantity.Text);
                DateTime orderDate = Convert.ToDateTime(txtOrderDate.Text);
                string status = ddlStatus.SelectedValue;

                client.UpdateOrder(orderId, drugId, userId, quantity, orderDate, status);
                LoadOrders();

                // Clear the form
                hdnOrderId.Value = "";
                txtDrugId.Text = "";
                txtUserId.Text = "";
                txtQuantity.Text = "";
                txtOrderDate.Text = "";
                ddlStatus.SelectedIndex = 0;
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error updating order: {ex.Message}');</script>");
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