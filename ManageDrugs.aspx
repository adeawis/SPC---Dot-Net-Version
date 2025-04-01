<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ManageDrugs.aspx.cs" Inherits="StatePharmaceuticalCooperations.Admin.ManageDrugs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Products | SPC</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <style>
        .gridview {
            margin: 20px;

        }
        .form-group {
            margin: 10px;

        }
        .gridview {
            width: 96%;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
            border: 1px solid #ddd;
        }

        .gridview th {
            background-color: black;
            color: white;
            padding: 10px;
            text-align: left;
            border: 1px solid #ddd;
        }

        .gridview td {
            padding: 8px;
            border: 1px solid #ddd;
        }

        .gridview tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .gridview tr:hover {
            background-color: #f1f1f1;
            cursor: pointer;
        }

        .gridview a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        .gridview a:hover {
            text-decoration: underline;
        }

        .gridview .edit-link {
            color: #28a745;
        }

        .gridview .delete-link {
            color: #dc3545;
        }

        .gridview .low-stock {
            color: #ff0000;
            font-weight: bold;
        }

        .gridview .in-stock {
            color: #28a745;
            font-weight: bold;
        }
    </style>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
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
          <a class="nav-link active" aria-current="page" href="ManageDrugs.aspx">Manage Drugs</a>
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
            <a class="nav-link" href="ManageSuppliers.aspx">Supplier Registrations</a>
            </li>
        </ul>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger ms-3" OnClick="btnLogout_Click" />
    </div>
  </div>
</nav>
        <div>
            <h2 class="text-center">Manage Drug Products</h2>
            
            <!-- Product Entry Form -->
            <div class="form-group">
                <asp:Label ID="lblDrugName" runat="server" Text="Drug Name:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtDrugName" runat="server" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvDrugName" runat="server" 
                    ControlToValidate="txtDrugName" ErrorMessage="Drug Name is required" 
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="lblDescription" runat="server" Text="Description:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtDescription" runat="server" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblQuantity" runat="server" Text="Quantity:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtQuantity" runat="server" TextMode="Number" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" 
                    ControlToValidate="txtQuantity" ErrorMessage="Quantity is required" 
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="lblUnitPrice" runat="server" Text="Unit Price:" CssClass="form-label"></asp:Label>
                <asp:TextBox ID="txtUnitPrice" runat="server" TextMode="Number" Step="0.01" CssClass="form-control"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvUnitPrice" runat="server" 
                    ControlToValidate="txtUnitPrice" ErrorMessage="Unit Price is required" 
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Label ID="lblPlant" runat="server" Text="Manufacturing Plant:" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlPlant" runat="server" CssClass="form-control">
                    <asp:ListItem Text="MediCore Pharmaceuticals" Value="MediCore Pharmaceuticals" />
                    <asp:ListItem Text="BioSynth Labs" Value="BioSynth Labs" />
                    <asp:ListItem Text="NovaCure Biotech" Value="NovaCure Biotech" />
                    <asp:ListItem Text="PharmaGenix Industries" Value="PharmaGenix Industries" />
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:Label ID="lblStatus" runat="server" Text="Status:" CssClass="form-label"></asp:Label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                    <asp:ListItem Text="In Stock" Value="In Stock" />
                    <asp:ListItem Text="Low Stock" Value="Low Stock" />
                    <asp:ListItem Text="Out of Stock" Value="Out of Stock" />
                </asp:DropDownList>
            </div>


            <div class="form-group">
                <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btn btn-primary"/>
                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CausesValidation="false" CssClass="btn btn-outline-dark"/>
                <asp:Label ID="lblMessage" runat="server" ForeColor="Green" ClientIDMode="Static"></asp:Label>
            </div>

            <!-- Products GridView -->
            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" 
                          DataKeyNames="DrugID" 
                          OnRowCommand="gvProducts_RowCommand" 
                          OnRowEditing="gvProducts_RowEditing"
                          OnRowUpdating="gvProducts_RowUpdating"
                          OnRowCancelingEdit="gvProducts_RowCancelingEdit"
                          OnRowDataBound="gvProducts_RowDataBound"
                          OnRowDeleting="gvProducts_RowDeleting" 
                          CssClass="gridview">
           <Columns>
               <asp:BoundField DataField="DrugID" HeaderText="ID" ReadOnly="True" />
               <asp:BoundField DataField="DrugName" HeaderText="Drug Name" />
               <asp:BoundField DataField="Description" HeaderText="Description" />
               <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
               <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" />
               <asp:BoundField DataField="Plant" HeaderText="Plant" />
               <asp:BoundField DataField="Status" HeaderText="Status" />
               <asp:CommandField HeaderText="Actions" ShowEditButton="True" ShowDeleteButton="True" 
                                DeleteText="Delete" ControlStyle-CssClass="delete-link" ButtonType="Link">
                                <ItemStyle Width="100px"/>
                </asp:CommandField>
           </Columns>
            </asp:GridView>
        </div>
    </form>
       <script type="text/javascript">
           function confirmDelete() {
               return confirm("Are you sure you want to delete this drug?");
           }
       </script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
