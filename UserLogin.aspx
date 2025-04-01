<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="StatePharmaceuticalCooperations.UserLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>SPC - Login</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <style type="text/css">
        .login-container {
            width: 400px;
            margin: 100px auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
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
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn-login {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        .btn-login:hover {
            background-color: #0056b3;
        }
        .validation-error {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }
        .register-link {
            text-align: center;
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login-container">
            <h2>Login</h2>
            
            <div class="form-group">
                <label for="txtUsername">Username:</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server"
                    ControlToValidate="txtUsername"
                    ErrorMessage="Username is required"
                    CssClass="validation-error"
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                    ControlToValidate="txtPassword"
                    ErrorMessage="Password is required"
                    CssClass="validation-error"
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" Text="Login" 
                    CssClass="btn-login" OnClick="btnLogin_Click" />
            </div>

            <asp:Label ID="lblMessage" runat="server" CssClass="validation-error" />

            <div class="register-link">
                <asp:HyperLink ID="lnkRegister" runat="server" 
                    NavigateUrl="~/UserRegistration.aspx" 
                    Text="New user? Register here" />
            </div>

            <div class="register-link">
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AdminLogin.aspx" Text="Admin Login" Target="_blank"/>
            </div>
        </div>
    </form>
</body>
</html>
