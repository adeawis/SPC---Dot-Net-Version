<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PharmacyHome.aspx.cs" Inherits="StatePharmaceuticalCooperations.Pharmacy.PharmacyHome" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Pharmacy Home | SPC</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style>
    .footer {
        /*position: absolute;*/
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
          <a class="nav-link" href="PlaceOrder.aspx">Order Now</a>
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
        <div class="container my-5">
    <!-- Welcome Section -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="card">
                <div class="card-body text-center">
                    <h2 class="card-title">Welcome to State Pharmaceutical Cooperation</h2>
                    <p class="card-text">Your trusted partner in healthcare since 1957, ensuring quality pharmaceuticals at affordable prices.</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Info Cards -->
    <div class="row g-4">
        <!-- SPC Info -->
        <div class="col-md-6">
            <div class="card h-100">
                <div class="card-header bg-primary text-white">
                    <h3 class="card-title mb-0">About SPC</h3>
                </div>
                <div class="card-body">
                    <ul class="list-unstyled">
                        <li class="mb-2">✓ Sri Lanka's largest pharmaceutical distributor</li>
                        <li class="mb-2">✓ Network of over 45 Osusala outlets nationwide</li>
                        <li class="mb-2">✓ 24/7 pharmacy services in major cities</li>
                        <li class="mb-2">✓ Direct import of quality-assured medicines</li>
                        <li class="mb-2">✓ ISO 9001:2015 certified organization</li>
                    </ul>
                </div>
            </div>
        </div>

        <!-- Drug Categories -->
        <div class="col-md-6">
            <div class="card h-100">
                <div class="card-header bg-success text-white">
                    <h3 class="card-title mb-0">Our Drug Categories</h3>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-6">
                            <ul class="list-unstyled">
                                <li class="mb-2">• Prescription Medicines</li>
                                <li class="mb-2">• Over-the-Counter Drugs</li>
                                <li class="mb-2">• Surgical Items</li>
                                <li class="mb-2">• Medical Devices</li>
                            </ul>
                        </div>
                        <div class="col-6">
                            <ul class="list-unstyled">
                                <li class="mb-2">• Vaccines</li>
                                <li class="mb-2">• Antibiotics</li>
                                <li class="mb-2">• Chronic Care Medicine</li>
                                <li class="mb-2">• Healthcare Products</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Features Section -->
    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card text-center h-100">
                <div class="card-body">
                    <h4 class="card-title">Quality Assurance</h4>
                    <p class="card-text">All medicines undergo strict quality control measures before distribution</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center h-100">
                <div class="card-body">
                    <h4 class="card-title">Fast Delivery</h4>
                    <p class="card-text">Same-day delivery available for urgent medical needs</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center h-100">
                <div class="card-body">
                    <h4 class="card-title">24/7 Support</h4>
                    <p class="card-text">Round-the-clock customer service for emergency requirements</p>
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
