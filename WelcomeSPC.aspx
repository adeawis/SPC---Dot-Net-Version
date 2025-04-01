<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WelcomeSPC.aspx.cs" Inherits="StatePharmaceuticalCooperations.WelcomeSPC" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Welcome | SPC</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #f5f7fa 0%, #c3cfe2 100%);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .header {
            background-color: #2c3e50;
            color: white;
            padding: 1rem;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }

        .container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 1rem;
            flex-grow: 1;
        }

        .content {
            background: white;
            border-radius: 10px;
            padding: 2rem;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            margin-bottom: 2rem;
            text-align:center;
        }

        .buttons {
            display: flex;
            gap: 1rem;
            justify-content: center;
            margin-top: 2rem;
        }

        .btn {
            padding: 0.8rem 2rem;
            border: none;
            border-radius: 5px;
            font-size: 1.1rem;
            cursor: pointer;
            transition: transform 0.3s ease;
            text-decoration: none;
        }

        .btn:hover {
            transform: translateY(-2px);
        }

        .btn-primary {
            background-color: #3498db;
            color: white;
        }

        .btn-secondary {
            background-color: #2ecc71;
            color: white;
        }

        .features {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
            margin-top: 2rem;
        }

        .feature-card {
            background: #f8f9fa;
            padding: 1.5rem;
            border-radius: 8px;
            text-align: center;
        }

        .feature-card h3 {
            color: #2c3e50;
            margin-bottom: 1rem;
        }

        .link {
            margin-top: 2rem;
        }

        .footer {
            background-color: #2c3e50;
            color: white;
            text-align: center;
            padding: 1rem;
            margin-top: auto;
        }
    </style>
</head>
<body>
    <header class="header">
        <h1>State Pharmaceutical Cooperation (SPC)</h1>
    </header>
    <form id="form1" runat="server">
        <div class="container">
        <div class="content">
            <h2>Welcome to Our Healthcare Management System</h2>
            <p>Your trusted partner in pharmaceutical management and healthcare solutions.</p>
            <br />
            <p>Pharmacy and Staff can Register and Login to our System From here</p>
            
            <div class="buttons">
                <a href="UserLogin.aspx" class="btn btn-primary">Login</a>
                <a href="UserRegistration.aspx" class="btn btn-secondary">Register</a>
            </div>

            <div class="link">
                <h3>Are you a supplier? Register to SPC Now</h3>
                <asp:HyperLink ID="lnkRegister" runat="server" NavigateUrl="~/SPCSuppliers/RegSupplier.aspx" Text="Register From Here" />
            </div>

            <div class="link">
                <h3>Already a SPC Supplier? Login Now</h3>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/SupplierLogin.aspx" Text="Login Here" />
            </div>

            <div class="features">
                <div class="feature-card">
                    <h3>Efficient Management</h3>
                    <p>Streamlined processes for better pharmaceutical inventory control and distribution.</p>
                </div>
                <div class="feature-card">
                    <h3>Quality Assurance</h3>
                    <p>Maintaining high standards in pharmaceutical storage and handling.</p>
                </div>
                <div class="feature-card">
                    <h3>Reliable Service</h3>
                    <p>Committed to providing timely and accurate pharmaceutical services.</p>
                </div>
            </div>
        </div>
    </div>
    </form>

    <footer class="footer">
        <p>&copy <%= DateTime.Now.Year %> State Pharmaceutical Cooperation (SPC)</p>    
    </footer>
</body>
</html>