using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatePharmaceuticalCooperations.Admin
{
    public partial class ManageTenders : System.Web.UI.Page
    {
        localhost.SPCService client = new localhost.SPCService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTenders();
            }
        }

        private void LoadTenders()
        {
            try
            {
                DataSet ds = client.GetAllTenders();
                if (ds != null && ds.Tables.Count > 0)
                {
                    gvTenders.DataSource = ds;
                    gvTenders.DataBind();
                }
            }
            catch (Exception ex)
            {
                // Handle exception appropriately
                Response.Write($"<script>alert('Error loading tenders: {ex.Message}')</script>");
            }
        }

        protected void gvTenders_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvTenders.PageIndex = e.NewPageIndex;
            LoadTenders();
        }

        protected void gvTenders_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "DeleteTender")
            {
                //string script = "if (!confirm('Are you sure you want to delete this tender?')) return false;";
                //ScriptManager.RegisterStartupScript(this, GetType(), "DeleteConfirmation", script, true);

                try
                {
                    int tenderId = Convert.ToInt32(e.CommandArgument);
                    //SPCService spcService = new SPCService();
                    int result = client.deleteTenders(tenderId);

                    if (result > 0)
                    {
                        // Reload the grid after successful deletion
                        
                        ShowSuccessMessage("Tender deleted successfully!");
                        LoadTenders();
                    }
                    else
                    {
                        ShowErrorMessage("Failed to delete tender.");
                    }
                }
                catch (Exception ex)
                {
                    ShowErrorMessage("Error deleting tender: " + ex.Message);
                }
            }
        }

        private void ShowSuccessMessage(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "success",
                $"alert('{message}');", true);
        }

        private void ShowErrorMessage(string message)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "error",
                $"alert('{message}');", true);
        }
        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/WelcomeSPC.aspx");
        }
    }
}