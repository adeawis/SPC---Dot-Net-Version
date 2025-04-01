<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageSuppliers.aspx.cs" Inherits="StatePharmaceuticalCooperations.Admin.ManageSuppliers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin | Supplier Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <style>
        .grid-container {
    margin: 20px;
    border: 1px solid #ddd;
    border-radius: 5px;
    background-color: #f9f9f9;
    padding: 15px;
}

.grid-container table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.grid-container th, .grid-container td {
    padding: 10px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

.grid-container th {
    background-color: #007bff;
    color: #ffffff;
}

.grid-container tr:nth-child(even) {
    background-color: #f2f2f2;
}

.grid-container tr:hover {
    background-color: #e9ecef;
}

.grid-container .btn {
    padding: 5px 10px;
    margin: 5px;
    background-color: #007bff;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.grid-container .btn:hover {
    background-color: #0056b3;
}

.grid-container .btn-danger {
    background-color: #dc3545;
}

.grid-container .btn-danger:hover {
    background-color: #c82333;
}

.grid-container .actions {
    text-align: center;
}
        .form-group { margin: 10px 0; }
        .form-group label { display: inline-block; width: 150px; }
        .btn { padding: 5px 10px; margin: 5px; }
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
          <a class="nav-link" href="ManageUsers.aspx">Manage Users</a>
        </li>
         <li class="nav-item">
            <a class="nav-link active" href="ManageSuppliers.aspx">Supplier Registrations</a>
            </li>
        </ul>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger ms-3" OnClick="btnLogout_Click" />
    </div>
  </div>
</nav>
        <div>
            <h2>Supplier Management</h2>
            
            <div class="form-group">
                <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
            </div>

            <div class="form-group">
                <asp:Label ID="lblCompanyName" runat="server" Text="Company Name:"></asp:Label>
                <asp:TextBox ID="txtCompanyName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvCompanyName" runat="server" 
                    ControlToValidate="txtCompanyName" ErrorMessage="Company Name is required" 
                    ForeColor="Red" ValidationGroup="SupplierValidation">*</asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="lblContactPerson" runat="server" Text="Contact Person:"></asp:Label>
                <asp:TextBox ID="txtContactPerson" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvContactPerson" runat="server" 
                    ControlToValidate="txtContactPerson" ErrorMessage="Contact Person is required" 
                    ForeColor="Red" ValidationGroup="SupplierValidation">*</asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text="Email:"></asp:Label>
                <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Email is required" 
                    ForeColor="Red" ValidationGroup="SupplierValidation">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Invalid Email Format" 
                    ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="lblPhone" runat="server" Text="Phone:"></asp:Label>
                <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                    ControlToValidate="txtPhone" ErrorMessage="Phone is required" 
                    ForeColor="Red" ValidationGroup="SupplierValidation">*</asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="lblAddress" runat="server" Text="Address:"></asp:Label>
                <asp:TextBox ID="txtAddress" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblCity" runat="server" Text="City:"></asp:Label>
                <asp:TextBox ID="txtCity" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblCountry" runat="server" Text="Country:"></asp:Label>
                <asp:TextBox ID="txtCountry" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblLicenseNumber" runat="server" Text="License Number:"></asp:Label>
                <asp:TextBox ID="txtLicenseNumber" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvLicenseNumber" runat="server" 
                    ControlToValidate="txtLicenseNumber" ErrorMessage="License Number is required" 
                    ForeColor="Red" ValidationGroup="SupplierValidation">*</asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="lblBusinessType" runat="server" Text="Business Type:"></asp:Label>
                <asp:TextBox ID="txtBusinessType" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblBranchRegisteredAt" runat="server" Text="Branch Registered At:"></asp:Label>
                <asp:TextBox ID="txtBranchRegisteredAt" runat="server"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblStatus" runat="server" Text="Status:"></asp:Label>
                <asp:DropDownList ID="ddlStatus" runat="server" DataTextField="Text" DataValueField="Value" SelectedValue='<%# Bind("Status") %>'>
                     <asp:ListItem Text="Select Status Type" Value="" />
                     <asp:ListItem Text="Pending" Value="Pending" />
                    <asp:ListItem Text="Registered" Value="Registered" />
                </asp:DropDownList>
           </div>

            <div class="form-group">
                <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn" 
                    OnClick="btnSave_Click" ValidationGroup="SupplierValidation" />
                <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="btn" 
                    OnClick="btnUpdate_Click" ValidationGroup="SupplierValidation" Visible="false" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn" 
                    OnClick="btnClear_Click" CausesValidation="false" />
            </div>

            <div class="grid-container">
                <asp:GridView ID="gvSuppliers" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="SupplierID" OnRowCommand="gvSuppliers_RowCommand" 
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="SupplierID" HeaderText="ID" />
                        <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
                        <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" />
                        <asp:BoundField DataField="Email" HeaderText="Email" />
                        <asp:BoundField DataField="Phone" HeaderText="Phone" />
                        <asp:BoundField DataField="Address" HeaderText="Address" />
                        <asp:BoundField DataField="City" HeaderText="City" />
                        <asp:BoundField DataField="Country" HeaderText="Country" />
                        <asp:BoundField DataField="LicenseNumber" HeaderText="License Number" />
                        <asp:BoundField DataField="BusinessType" HeaderText="Business Type" />
                        <asp:BoundField DataField="BranchRegisteredAt" HeaderText="Branch" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="EditSupplier" 
                                    CommandArgument='<%# Container.DataItemIndex %>'>Edit</asp:LinkButton>
                                |
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="DeleteSupplier" 
                                    CommandArgument='<%# Container.DataItemIndex %>'
                                    OnClientClick="return confirm('Are you sure you want to delete this supplier?');">Delete</asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
