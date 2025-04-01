<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="StatePharmaceuticalCooperations.Admin.Dashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SPC Admin | Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
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
<body class="d-flex flex-column min-vh-100">
    <header class="bg-dark text-center text-white py-2">
<h1>State Pharmaceutical Cooperation (SPC)</h1>
</header>
    <form id="form1" runat="server" class="flex-grow-1">
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
        <!-- Add this content between your navbar and footer -->
<div class="container my-4">
    <!-- Quick Stats Cards -->
    <div class="row g-4 mb-4">
        <div class="col-xl-3 col-md-6">
            <div class="card bg-primary text-white h-100">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="text-uppercase mb-1">Total Orders</h6>
                            <h2 class="mb-0">
                                <asp:Label ID="lblTotalOrders" runat="server" Text="0"></asp:Label>
                            </h2>
                        </div>
                        <div class="ms-2">📦</div>
                    </div>
                </div>
                <div class="card-footer d-flex align-items-center justify-content-between">
                    <a class="small text-white stretched-link" href="#">View Details</a>
                    <div class="small text-white">→</div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6">
            <div class="card bg-success text-white h-100">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="text-uppercase mb-1">In Stock Drugs</h6>
                            <h2 class="mb-0">
                                <asp:Label ID="lblActiveDrugs" runat="server" Text="0"></asp:Label>
                            </h2>
                        </div>
                        <div class="ms-2">💊</div>
                    </div>
                </div>
                <div class="card-footer d-flex align-items-center justify-content-between">
                    <a class="small text-white stretched-link" href="ManageDrugs.aspx">View Details</a>
                    <div class="small text-white">→</div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6">
            <div class="card bg-warning text-white h-100">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="text-uppercase mb-1">Pending Tenders</h6>
                            <h2 class="mb-0">
                                <asp:Label ID="lblPendingTenders" runat="server" Text="0"></asp:Label>
                            </h2>
                        </div>
                        <div class="ms-2">📋</div>
                    </div>
                </div>
                <div class="card-footer d-flex align-items-center justify-content-between">
                    <a class="small text-white stretched-link" href="ManageTenders.aspx">View Details</a>
                    <div class="small text-white">→</div>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-md-6">
            <div class="card bg-danger text-white h-100">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="text-uppercase mb-1">Registered Users</h6>
                            <h2 class="mb-0">
                                <asp:Label ID="lblTotalUsers" runat="server" Text="0"></asp:Label>
                            </h2>
                        </div>
                        <div class="ms-2">👥</div>
                    </div>
                </div>
                <div class="card-footer d-flex align-items-center justify-content-between">
                    <a class="small text-white stretched-link" href="ManageUsers.aspx">View Details</a>
                    <div class="small text-white">→</div>
                </div>
            </div>
        </div>
    </div>

    <!-- Recent Activities and Quick Actions -->
    <div class="row g-4 mb-4">
        <!-- Recent Activities -->
        <div class="col-xl-8">
            <div class="card h-100">
                <div class="card-header">
                    <h5 class="mb-0">Recent Activities</h5>
                </div>
                <div class="card-body">
                    <asp:GridView ID="gvRecentActivities" runat="server" CssClass="table table-striped table-hover"
                        AutoGenerateColumns="False" EmptyDataText="No recent activities">
                        <Columns>
                            <asp:BoundField DataField="Date" HeaderText="Date" />
                            <asp:BoundField DataField="Activity" HeaderText="Activity" />
                            <asp:BoundField DataField="Status" HeaderText="Status" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="col-xl-4">
            <div class="card h-100">
                <div class="card-header">
                    <h5 class="mb-0">Quick Actions</h5>
                </div>
                <div class="card-body">
                    <div class="d-grid gap-2">
                        <asp:Button ID="btnAddDrug" runat="server" Text="Add New Drug" CssClass="btn btn-primary" />
                        <asp:Button ID="btnViewOrders" runat="server" Text="View Recent Orders" CssClass="btn btn-info" />
                        <asp:Button ID="btnManageUsers" runat="server" Text="Manage Users" CssClass="btn btn-success" />
                        <asp:Button ID="btnReviewTenders" runat="server" Text="Review Tenders" CssClass="btn btn-warning" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- System Status -->
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header">
                    <h5 class="mb-0">System Status</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-3 text-center">
                            <h6>Server Status</h6>
                            <span class="badge bg-success">Online</span>
                        </div>
                        <div class="col-md-3 text-center">
                            <h6>Database</h6>
                            <span class="badge bg-success">Connected</span>
                        </div>
                        <div class="col-md-3 text-center">
                            <h6>Last Backup</h6>
                            <span class="badge bg-info">Today 03:00 AM</span>
                        </div>
                        <div class="col-md-3 text-center">
                            <h6>System Load</h6>
                            <span class="badge bg-success">Normal</span>
                        </div>
                    </div>
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
