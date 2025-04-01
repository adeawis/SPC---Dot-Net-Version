<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierHome.aspx.cs" Inherits="StatePharmaceuticalCooperations.SPCSuppliers.SupplierHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SPC Supplier Home</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <style>
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
<body class="d-flex flex-column min-vh-100">
    <header class="bg-dark text-center text-white py-2">
<h1>State Pharmaceutical Cooperation (SPC)</h1>
</header>
    <form id="form1" runat="server" class="flex-grow-1">
           <nav class="navbar navbar-expand-lg bg-body-tertiary">
  <div class="container-fluid">
    <a class="navbar-brand" href="SupplierHome.aspx">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
      <ul class="navbar-nav">
        <li class="nav-item">
          <a class="nav-link active" aria-current="page" href="RegistrationDetails.aspx">Registration Details</a>
        </li>
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="../DisplayDrugs.aspx">Available Drugs</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="SubmitTender.aspx">Submit Tender</a>
        </li>
         
        </ul>
        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger ms-3" OnClick="btnLogout_Click" />
    </div>
  </div>
</nav>
        <div class="container mt-5">
    <div class="row">
        <div class="col-md-8 mx-auto text-center mb-5">
            <h2>Welcome to SPC Supplier Portal</h2>
            <p class="lead">Manage your pharmaceutical supplies and tenders efficiently</p>
        </div>
    </div>
    
    <div class="row g-4">
        <div class="col-md-4">
            <div class="card h-100">
                <div class="card-body">
                    <h5 class="card-title">Registration Details</h5>
                    <p class="card-text">View and update your supplier registration information and documents.</p>
                    <a href="#" class="btn btn-primary">View Details</a>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card h-100">
                <div class="card-body">
                    <h5 class="card-title">Available Drugs</h5>
                    <p class="card-text">Browse the list of pharmaceuticals currently required by SPC.</p>
                    <a href="../DisplayDrugs.aspx" class="btn btn-primary">View Drugs</a>
                </div>
            </div>
        </div>
        
        <div class="col-md-4">
            <div class="card h-100">
                <div class="card-body">
                    <h5 class="card-title">Submit Tender</h5>
                    <p class="card-text">Submit new tenders for pharmaceutical supplies to SPC.</p>
                    <a href="SubmitTender.aspx" class="btn btn-primary">Submit Now</a>
                </div>
            </div>
        </div>
    </div>
</div>
         <footer class="footer">
        <p>&copy <%= DateTime.Now.Year %> State Pharmaceutical Cooperation (SPC)</p>
        </footer>
    </form>

         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
