<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlaceOrder.aspx.cs" Inherits="StatePharmaceuticalCooperations.Pharmacy.PlaceOrder" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Place Order | SPC</title>
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <style>
         .search-container { margin: 20px 0; }
        .search-box { padding: 5px; width: 280px; margin-left: 18px;}
        .search-button { padding: 5px 15px; margin-left: 10px;}
        .message { margin: 10px 0; }
    </style>
</head>
<body>
    <header class="bg-dark text-center text-white py-2">
    <h1>State Pharmaceutical Cooperation (SPC)</h1>
    </header>
    <form id="form1" runat="server">
        <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="PharmacyHome.aspx">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link" aria-current="page" href="../DisplayDrugs.aspx">Available Drugs</a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="PlacingOrder.aspx">Order Now</a>
        </li>
          <li class="nav-item">
            <a class="nav-link" href="OrderHistory.aspx">Order History</a>
        </li>
          <li class="nav-item">
          <a class="nav-link" href="../AboutUs.aspx">About Us</a>
        </li>
        </ul>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger ms-3" OnClick="btnLogout_Click" />
    </div>
  </div>
</nav>
        <div class="search-container">
                <asp:TextBox ID="txtSearch" runat="server" CssClass="search-box" placeholder="Enter drug name to search"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="search-button" OnClick="btnSearch_Click" />
                <asp:Button ID="btnShowAll" runat="server" Text="Show All" CssClass="search-button" OnClick="btnShowAll_Click" />
        </div>
        <div>
            <h2 class="text-center">Place Order</h2>
            <asp:Label ID="lblMessage" runat="server" Text="" CssClass="form-label"></asp:Label>
            <br />
            <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False" CssClass="table table-bordered" DataKeyNames="DrugID" OnRowCommand="gvProducts_RowCommand">
                <Columns>
                    <asp:BoundField DataField="DrugID" HeaderText="Drug ID" Visible="False" />
                    <asp:BoundField DataField="DrugName" HeaderText="Drug Name" />
                    <asp:BoundField DataField="Quantity" HeaderText="Available Quantity" />
                    <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price" DataFormatString="{0:C}" />
                    <asp:TemplateField HeaderText="Order Quantity">
                        <ItemTemplate>
                            <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" Width="100px"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:Button ID="btnPlaceOrder" runat="server" Text="Order"  CommandName="Order" CommandArgument='<%# ((GridViewRow)Container).RowIndex %>'  CssClass="btn btn-primary" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="btnCancelOrder" runat="server" Text="Cancel" OnClick="btnCancelOrder_Click" CausesValidation="false" CssClass="btn btn-outline-dark"/>
        </div>
    </form>

           <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
