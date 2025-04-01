<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageOrders.aspx.cs" Inherits="StatePharmaceuticalCooperations.Admin.ManageOrders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Orders | Admin SPC</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <style>
        .grid-container {
            overflow-x: auto;
            margin-bottom: 2rem;
        }
        
        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 1rem;
            background-color: #fff;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        
        .gridview th {
            background-color: #0d6efd;
            color: white;
            padding: 12px;
            text-align: left;
            font-weight: 500;
        }
        
        .gridview td {
            padding: 12px;
            border-bottom: 1px solid #dee2e6;
        }
        
        .gridview tr:hover {
            background-color: #f8f9fa;
        }
        
        .action-buttons .btn {
            margin-right: 5px;
        }
        
        .update-form {
            background-color: #f8f9fa;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 0 15px rgba(0,0,0,0.1);
        }
        
        .form-group {
            margin-bottom: 1rem;
        }
        
        .header-section {
            background-color: #f8f9fa;
            padding: 1rem 0;
            margin-bottom: 2rem;
            border-bottom: 1px solid #dee2e6;
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
          <a class="nav-link" aria-current="page" href="ManageDrugs.aspx">Manage Drugs</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ManageTenders.aspx">View Tender Forms</a>
        </li>
          <li class="nav-item">
            <a class="nav-link active" href="ManageOrders.aspx">Manage Orders</a>
        </li>
          <li class="nav-item">
          <a class="nav-link" href="ManageUsers.aspx">Manage Users</a>
        </li>
         <li class="nav-item">
            <a class="nav-link" href="ManageSuppliers.aspx">Supplier Registrations</a>
            </li>
        </ul>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger ms-3" OnClick="btnLogout_Click" />
    </div>
  </div>
</nav>
     <div class="container mt-4">
            <div class="header-section">
                <h2 class="mb-4">Manage Orders</h2>
            </div>

            <div class="grid-container">
                <asp:GridView ID="gvOrders" runat="server" AutoGenerateColumns="False" 
                    OnRowCommand="gvOrders_RowCommand" CssClass="gridview table table-striped"
                    GridLines="None">
                    <Columns>
                        <asp:BoundField DataField="OrderID" HeaderText="Order ID" />
                        <asp:BoundField DataField="DrugID" HeaderText="Drug ID" />
                        <asp:BoundField DataField="UserID" HeaderText="User ID" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                        <asp:BoundField DataField="OrderDate" HeaderText="Order Date" 
                            DataFormatString="{0:yyyy-MM-dd}" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:TemplateField HeaderText="Actions">
                            <ItemTemplate>
                                <div class="action-buttons">
                                    <asp:Button ID="btnSelect" runat="server" Text="Select" 
                                        CommandName="UpdateOrder" 
                                        CommandArgument='<%# Eval("OrderID") %>'
                                        CssClass="btn btn-primary btn-sm" />
                                    <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                                        CommandName="DeleteOrder"
                                        CommandArgument='<%# Eval("OrderID") %>'
                                        CssClass="btn btn-danger btn-sm"
                                        OnClientClick="return confirm('Are you sure you want to delete this order?');" />
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>

            <div class="update-form">
                <h3 class="mb-4">Update Order</h3>
                <asp:HiddenField ID="hdnOrderId" runat="server" />
                
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">Drug ID:</label>
                            <asp:TextBox ID="txtDrugId" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label">User ID:</label>
                            <asp:TextBox ID="txtUserId" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label">Quantity:</label>
                            <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                    </div>
                    
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">Order Date:</label>
                            <asp:TextBox ID="txtOrderDate" runat="server" TextMode="Date" CssClass="form-control" ReadOnly="true"></asp:TextBox>
                        </div>
                        
                        <div class="form-group">
                            <label class="form-label">Status:</label>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                                <asp:ListItem Text="Pending" Value="Pending" />
                                <asp:ListItem Text="Processing" Value="Processing" />
                                <asp:ListItem Text="Completed" Value="Completed" />
                                <asp:ListItem Text="Cancelled" Value="Cancelled" />
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>
                
                <div class="mt-4">
                    <asp:Button ID="btnSaveUpdate" runat="server" Text="Update Order" 
                        OnClick="btnSaveUpdate_Click" CssClass="btn btn-success" />
                </div>
            </div>
        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
