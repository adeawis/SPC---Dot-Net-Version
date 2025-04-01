<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegistrationDetails.aspx.cs" Inherits="StatePharmaceuticalCooperations.SPCSuppliers.RegistrationDetails" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Registration Details</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
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
        <a class="navbar-brand" href="SupplierHome.aspx">Home</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavDropdown">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="RegistrationDetails.aspx">Registration Details</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../DisplayDrugs.aspx">Available Drugs</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="SubmitTender.aspx">Submit Tender</a>
                </li>
            </ul>
            <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger ms-3" OnClick="btnLogout_Click" />
        </div>
    </div>
</nav>
        <div class="row">
            <div class="col-md-8 mx-auto">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Registration Details</h3>
                    </div>
                    <div class="card-body">
                        <div class="mb-3">
                            <label for="txtCompanyName" class="form-label">Company Name</label>
                            <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" readonly="true"/>
                        </div>
                        <div class="mb-3">
                            <label for="txtContactPerson" class="form-label">Contact Person</label>
                            <asp:TextBox ID="txtContactPerson" runat="server" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <label for="txtEmail" class="form-label">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" readonly="true"/>
                        </div>
                        <div class="mb-3">
                            <label for="txtPhone" class="form-label">Phone</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <label for="txtAddress" class="form-label">Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" />
                        </div>
                        <div class="mb-3">
                            <label for="txtCity" class="form-label">City</label>
                            <asp:TextBox ID="txtCity" runat="server" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <label for="txtCountry" class="form-label">Country</label>
                            <asp:TextBox ID="txtCountry" runat="server" CssClass="form-control" />
                        </div>
                        <div class="mb-3">
                            <label for="txtLicenseNumber" class="form-label">License Number</label>
                            <asp:TextBox ID="txtLicenseNumber" runat="server" CssClass="form-control" readonly="true"/>
                        </div>
                        <div class="mb-3">
                            <label for="txtBusinessType" class="form-label">Business Type</label>
                            <asp:TextBox ID="txtBusinessType" runat="server" CssClass="form-control" readonly="true"/>
                        </div>
                        <div class="mb-3">
                            <label for="txtBranchRegistered" class="form-label">Branch Registered At</label>
                            <asp:TextBox ID="txtBranchRegistered" runat="server" CssClass="form-control" readonly="true"/>
                        </div>

                        <div class="d-flex justify-content-between mt-4">
                            <asp:Button ID="btnUpdate" runat="server" Text="Update Details" CssClass="btn btn-primary" OnClick="btnUpdate_Click" />
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#deleteModal">
                                Delete Account
                            </button>
                        </div>

                        <asp:Label ID="lblMessage" runat="server" CssClass="mt-3 d-block"></asp:Label>
                    </div>
                </div>
            </div>
        </div>

        <!-- Delete Account Modal -->
        <div class="modal fade" id="deleteModal" tabindex="-1">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Confirm Account Deletion</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to delete your account? This action cannot be undone.</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <asp:Button ID="btnDeleteAccount" runat="server" Text="Delete Account" CssClass="btn btn-danger" OnClick="btnDeleteAccount_Click" />
                    </div>
                </div>
            </div>
        </div>

        <footer class="footer">
            <p>&copy; <%= DateTime.Now.Year %> State Pharmaceutical Cooperation (SPC)</p>
        </footer>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
