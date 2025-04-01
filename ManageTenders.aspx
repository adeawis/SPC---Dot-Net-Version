<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageTenders.aspx.cs" Inherits="StatePharmaceuticalCooperations.Admin.ManageTenders" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View All Tenders - SPC Pharmaceutical</title>
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
        .logout-btn {
            float: right;
            padding: 5px 10px;
            background-color: #f44336;
            color: white;
            border: none;
            cursor: pointer;
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
          <a class="nav-link" aria-current="page" href="ManageDrugs.aspx">Manage Drugs</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="ManageTenders.aspx">View Tender Forms</a>
        </li>
           <li class="nav-item">
            <a class="nav-link" href="ManageOrders.aspx">Manage Orders</a>
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
        <div class="header">
            <h2>All Tenders</h2>
            
        </div>
        <div class="grid-container">
            <asp:GridView ID="gvTenders" runat="server" AutoGenerateColumns="False" CssClass="gridview"
                AllowPaging="True" PageSize="10" OnPageIndexChanging="gvTenders_PageIndexChanging" OnRowCommand="gvTenders_RowCommand">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="CompanyName" HeaderText="Company Name" />
                    <asp:BoundField DataField="ContactPerson" HeaderText="Contact Person" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="PhoneNumber" HeaderText="Phone Number" />
                    <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                    <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" DataFormatString="{0:C2}" />
                    <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
                    <asp:BoundField DataField="DeliveryTimeline" HeaderText="Delivery Timeline (Days)" />
                    <asp:BoundField DataField="AdditionalComments" HeaderText="Additional Comments" />
                    <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                    <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                    CommandName="DeleteTender" 
                    CommandArgument='<%# Eval("Id") %>'
                    CssClass="btn btn-danger btn-sm"
                    OnClientClick="return confirm('Are you sure you want to delete this tender?');" />
                    </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>

         <footer class="footer">
<p>&copy <%= DateTime.Now.Year %> State Pharmaceutical Cooperation (SPC)</p>
</footer>
    </form>

      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
