using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace StatePharmaceuticalCooperations.Admin
{
    public partial class ManageUsers : System.Web.UI.Page
    {
        localhost.SPCService client = new localhost.SPCService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
            }
        }

        private void LoadUsers()
        {
            try
            {
                DataSet ds = client.GetAllUsers();
                if (ds != null && ds.Tables.Count > 0)
                {
                    gvUsers.DataSource = ds;
                    gvUsers.DataBind();
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error loading users: " + ex.Message, false);
            }
        }

        protected void gvUsers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvUsers.PageIndex = e.NewPageIndex;
            LoadUsers();
        }

        protected void gvUsers_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            try
            {
                int userId = Convert.ToInt32(e.CommandArgument);

                if (e.CommandName == "EditUser")
                {
                    // Find the user data and populate the edit form
                    GridViewRow row = gvUsers.Rows[((GridViewRow)((Button)e.CommandSource).NamingContainer).RowIndex];

                    hdnUserId.Value = userId.ToString();
                    txtUsername.Text = row.Cells[1].Text;
                    ddlUserType.SelectedValue = row.Cells[2].Text;
                    txtEmail.Text = row.Cells[3].Text;
                    txtContactNo.Text = row.Cells[4].Text;
                    chkIsActive.Checked = Convert.ToBoolean(row.Cells[5].Text);

                    editModal.Style["display"] = "block";
                    modalOverlay.Style["display"] = "block";
                }
                else if (e.CommandName == "DeleteUser")
                {
                    if (client.DeleteUser(userId) > 0)
                    {
                        ShowMessage("User deleted successfully!", true);
                        LoadUsers();
                    }
                    else
                    {
                        ShowMessage("Failed to delete user.", false);
                    }
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error processing request: " + ex.Message, false);
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                int userId = Convert.ToInt32(hdnUserId.Value);
                if (client.UpdateUser(userId, txtUsername.Text, ddlUserType.SelectedValue,
                    txtEmail.Text, txtContactNo.Text, chkIsActive.Checked) > 0)
                {
                    ShowMessage("User updated successfully!", true);
                    LoadUsers();
                    CloseModal();
                }
                else
                {
                    ShowMessage("Failed to update user.", false);
                }
            }
            catch (Exception ex)
            {
                ShowMessage("Error updating user: " + ex.Message, false);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            CloseModal();
        }

        protected void btnAddNewUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/RegisterUser.aspx");
        }

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("~/WelcomeSPC.aspx");
        }

        private void CloseModal()
        {
            editModal.Style["display"] = "none";
            modalOverlay.Style["display"] = "none";
        }

        private void ShowMessage(string message, bool isSuccess)
        {
            pnlMessage.Visible = true;
            lblMessage.Text = message;

            if (isSuccess)
            {
                pnlMessage.CssClass = "message success";
            }
            else
            {
                pnlMessage.CssClass = "message error";
            }

            // Auto-hide message after 5 seconds
            ScriptManager.RegisterStartupScript(this, GetType(), "HideMessage",
                "setTimeout(function() { document.getElementById('" + pnlMessage.ClientID + "').style.display = 'none'; }, 5000);", true);
        }

        protected void ValidateAdminAccess()
        {
            if (Session["UserType"] == null || Session["UserType"].ToString() != "Admin")
            {
                Response.Redirect("~/WelcomeSPC.aspx");
            }
        }
    }
}