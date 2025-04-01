<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="StatePharmaceuticalCooperations.Admin.ManageUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Users - SPC Pharmaceutical</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .grid-container {
            margin-top: 20px;
        }
        .header {
            background-color: #f2f2f2;
            padding: 10px;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .gridview {
            width: 100%;
            border-collapse: collapse;
        }
        .gridview th {
            background-color: #4CAF50;
            color: white;
            padding: 8px;
        }
        .gridview td {
            padding: 8px;
            border: 1px solid #ddd;
        }
        .gridview tr:nth-child(even) {
            background-color: #f2f2f2;
        }
        .action-btn {
            padding: 5px 10px;
            margin: 0 2px;
            cursor: pointer;
            border: none;
            border-radius: 3px;
        }
        .edit-btn {
            background-color: #2196F3;
            color: white;
        }
        .delete-btn {
            background-color: #f44336;
            color: white;
        }
        .add-btn {
            background-color: #4CAF50;
            color: white;
            padding: 8px 16px;
        }
        .logout-btn {
            background-color: #f44336;
            color: white;
            padding: 5px 10px;
            border: none;
            cursor: pointer;
        }
        .modal {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            padding: 20px;
            border: 1px solid #ddd;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            z-index: 1000;
        }
        .overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
            z-index: 999;
        }
        .form-group {
            margin-bottom: 10px;
        }
        .form-group label {
            display: inline-block;
            width: 120px;
        }
        .message {
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
        }
        .success {
            background-color: #dff0d8;
            color: #3c763d;
            border: 1px solid #d6e9c6;
        }
        .error {
            background-color: #f2dede;
            color: #a94442;
            border: 1px solid #ebccd1;
        }
        .footer {
    position: absolute;
    bottom: 0;
    width: 100%;
    background-color: black;
    color: white;
    padding: 20px;
    text-align: center;
}
    </style>
</head>
<body>
        <header class="bg-dark text-center text-white py-2">
<h1>State Pharmaceutical Cooperation (SPC)</h1>
</header>
    <form id="form1" runat="server">
                    <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="Dashboard.aspx">Dashboard</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link " aria-current="page" href="ManageDrugs.aspx">Manage Drugs</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ManageTenders.aspx">View Tender Forms</a>
        </li>
           <li class="nav-item">
            <a class="nav-link" href="ManageOrders.aspx">Manage Orders</a>
        </li>
          <li class="nav-item">
          <a class="nav-link active" href="ManageUsers.aspx">Manage Users</a>
        </li>
         <li class="nav-item">
            <a class="nav-link" href="ManageSuppliers.aspx">Supplier Registrations</a>
            </li>
        </ul>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger ms-3" OnClick="btnLogout_Click" />
    </div>
  </div>
</nav>
        <div class="header">
            <h2>Manage Users</h2>
            <div>
                <asp:Button ID="btnAddNewUser" runat="server" Text="Add New User" CssClass="action-btn add-btn" OnClick="btnAddNewUser_Click" />
                
            </div>
        </div>

        <asp:Panel ID="pnlMessage" runat="server" Visible="false" CssClass="message">
            <asp:Label ID="lblMessage" runat="server"></asp:Label>
        </asp:Panel>

        <div class="grid-container">
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" 
                CssClass="gridview" AllowPaging="True" PageSize="10" 
                OnPageIndexChanging="gvUsers_PageIndexChanging"
                OnRowCommand="gvUsers_RowCommand">
                <Columns>
                    <asp:BoundField DataField="UserId" HeaderText="ID" />
                    <asp:BoundField DataField="Username" HeaderText="Username" />
                    <asp:BoundField DataField="UserType" HeaderText="User Type" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="ContactNo" HeaderText="Contact No" />
                    <asp:BoundField DataField="IsActive" HeaderText="Status" />
                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="btnEdit" runat="server" Text="Edit" 
                                CommandName="EditUser" CommandArgument='<%# Eval("UserId") %>'
                                CssClass="action-btn edit-btn" />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                                CommandName="DeleteUser" CommandArgument='<%# Eval("UserId") %>'
                                CssClass="action-btn delete-btn" 
                                OnClientClick="return confirm('Are you sure you want to delete this user?');" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

        <!-- Edit User Modal -->
        <div id="editModal" class="modal" runat="server">
            <h3>Edit User</h3>
            <div class="form-group">
                <label>Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>User Type:</label>
                <asp:DropDownList ID="ddlUserType" runat="server">
                    <asp:ListItem Text="Pharmacy" Value="pharmacy" />
                    <asp:ListItem Text="Staff" Value="staff" />
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label>Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" ReadOnly="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Contact No:</label>
                <asp:TextBox ID="txtContactNo" runat="server"></asp:TextBox>
            </div>
            <div class="form-group">
                <label>Status:</label>
                <asp:CheckBox ID="chkIsActive" runat="server" Text="Active" />
            </div>
            <div class="form-group">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="action-btn add-btn" />
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="action-btn delete-btn" />
                <asp:HiddenField ID="hdnUserId" runat="server" />
            </div>
        </div>
        <div id="modalOverlay" class="overlay" runat="server"></div>

         <footer class="footer">
<p>&copy <%= DateTime.Now.Year %> State Pharmaceutical Cooperation (SPC)</p>
</footer>
    </form>

               <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
