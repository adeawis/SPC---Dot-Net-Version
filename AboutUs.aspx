<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AboutUs.aspx.cs" Inherits="StatePharmaceuticalCooperations.AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>About Us - State Pharmaceutical Corporation</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <style type="text/css">
        .hero-section {
            background-color: #f8f9fa;
            padding: 4rem 0;
            text-align: center;
        }
        .content-section {
            padding: 3rem 0;
        }
        .feature-card {
            border: 1px solid #e9ecef;
            border-radius: 8px;
            padding: 1.5rem;
            margin-bottom: 1.5rem;
            transition: transform 0.3s ease;
        }
        .feature-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       

        <!-- Hero Section -->
        <div class="hero-section">
            <asp:Image ID="imgLogo" runat="server" ImageUrl="~/Images/spc-logo.png" Width="180px" Height="120px" AlternateText="SPC Logo" />
            <h1 class="display-4 mb-3">State Pharmaceutical Corporation</h1>
            <p class="lead">Ensuring Quality Healthcare Through Innovation</p>
        </div>

        <!-- Main Content -->
        <div class="container content-section">
            <!-- Mission Section -->
            <div class="row mb-5">
                <div class="col-md-6">
                    <h2>Our Mission</h2>
                    <asp:Label ID="lblMission" runat="server" Text="At State Pharmaceutical Corporation (SPC), we are dedicated to manufacturing and importing high-quality pharmaceutical products to meet our nation's healthcare needs. With decades of experience, we ensure reliable access to essential medications through our extensive network of pharmacies and partners." />
                </div>
                <div class="col-md-6">
                    <asp:Image ID="imgFacility" runat="server" ImageUrl="~/Images/facility.jpg" CssClass="img-fluid rounded" AlternateText="SPC Facility" />
                </div>
            </div>

            <!-- Core Services -->
            <div class="row mb-5">
                <div class="col-12">
                    <h2 class="text-center mb-4">Our Core Services</h2>
                </div>
                <asp:Repeater ID="rptServices" runat="server">
                    <ItemTemplate>
                        <div class="col-md-4">
                            <div class="feature-card">
                                <asp:Image ID="imgService" runat="server" ImageUrl='<%# Eval("ImageUrl") %>' Width="110px" Height="80px" CssClass="mb-3" AlternateText='<%# Eval("Title") %>' />
                                <h3><%# Eval("Title") %></h3>
                                <p><%# Eval("Description") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>

            <!-- Technology Integration -->
            <div class="row mb-5">
                <div class="col-12 text-center">
                    <h2>Our Technology Integration</h2>
                    <p class="mb-4">We're continuously evolving our digital infrastructure to better serve our stakeholders:</p>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="feature-card">
                                <h4><asp:Label ID="lblTech1Title" runat="server" Text="Online Supplier Portal" /></h4>
                                <p><asp:Label ID="lblTech1Desc" runat="server" Text="Easy registration and tender submission process for suppliers through our web platform." /></p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="feature-card">
                                <h4><asp:Label ID="lblTech2Title" runat="server" Text="Inventory Management" /></h4>
                                <p><asp:Label ID="lblTech2Desc" runat="server" Text="Real-time stock updates from manufacturing plants and warehouses through integrated systems." /></p>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="feature-card">
                                <h4><asp:Label ID="lblTech3Title" runat="server" Text="Order Processing" /></h4>
                                <p><asp:Label ID="lblTech3Desc" runat="server" Text="Seamless ordering system for SPC and registered pharmacies with real-time stock information." /></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <footer class="bg-dark text-light py-4">
            <div class="container">
                <div class="row">
                    <div class="col-12 text-center">
                        <p>&copy; <%: DateTime.Now.Year %> State Pharmaceutical Corporation. All rights reserved.</p>
                    </div>
                </div>
            </div>
        </footer>

        <!-- Bootstrap JS and dependencies -->
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </form>
</body>
</html>
