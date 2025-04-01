<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StockUpdate.aspx.cs" Inherits="StatePharmaceuticalCooperations.Staff.StockUpdate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Update Drug Stock</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <style>
        .form-container {
            width: 600px;
            margin: 50px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-control {
            width: 100%;
            padding: 6px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        .btnUpdate {
            padding: 8px 15px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .message {
            margin-top: 10px;
            padding: 10px;
            border-radius: 4px;
        }
        .success {
            background-color: #d4edda;
            color: #155724;
        }
        .error {
            background-color: #f8d7da;
            color: #721c24;
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
    <a class="navbar-brand" href="StaffHome.aspx">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="StockUpdate.aspx">Stock Update</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="../DisplayDrugs.aspx">Available Drugs</a>
        </li>
        </ul>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger ms-3" OnClick="btnLogout_Click" />
    </div>
  </div>
</nav>
        <div class="form-container">
            <h2>Update Drug Stock</h2>
            
            <div class="form-group">
                <label for="ddlDrugs">Select Drug:</label>
                <asp:DropDownList ID="ddlDrugs" runat="server" CssClass="form-control" AutoPostBack="true" 
                    OnSelectedIndexChanged="ddlDrugs_SelectedIndexChanged" ValidationGroup="stock">
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="txtCurrentStock">Current Stock:</label>
                <asp:TextBox ID="txtCurrentStock" runat="server" CssClass="form-control" ReadOnly="true" ValidationGroup="stock"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtQuantityToAdd">Quantity to Add:</label>
                <asp:TextBox ID="txtQuantityToAdd" runat="server" CssClass="form-control" TextMode="Number" ValidationGroup="stock"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" 
                    ControlToValidate="txtQuantityToAdd" 
                    ErrorMessage="Please enter quantity" 
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
            </div>

            <div class="form-group">
                <asp:Button ID="btnUpdate" runat="server" Text="Update Stock" 
                    CssClass="btnUpdate" OnClick="btnUpdate_Click" ValidationGroup="stock" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
        </div>
    </form>
       <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
