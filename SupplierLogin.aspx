<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SupplierLogin.aspx.cs" Inherits="StatePharmaceuticalCooperations.SupplierLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
        <title>Supplier Login</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
        }
        .login-container {
            max-width: 400px;
            margin: 100px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 5px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }
        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }
        .login-header h2 {
            color: #333333;
            margin: 0;
        }
        .form-group {
            margin-bottom: 20px;
        }
        .form-control {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }
        .btn-login {
            background-color: #007bff;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        .btn-login:hover {
            background-color: #0056b3;
        }
        .validation-error {
            color: #dc3545;
            font-size: 12px;
            margin-top: 5px;
        }
        .registration {
            text-align: right;
            margin-top: 10px;
        }
        .registration a {
            color: #007bff;
            text-decoration: none;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <form id="formSupplierLogin" runat="server">
        <div class="login-container">
            <div class="login-header">
                <h2>Supplier Login</h2>
            </div>
            
            <div class="form-group">
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" 
                    placeholder="Email Address" TextMode="Email"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                    ControlToValidate="txtEmail" 
                    Display="Dynamic"
                    CssClass="validation-error"
                    ErrorMessage="Email is required.">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                    ControlToValidate="txtEmail"
                    Display="Dynamic"
                    CssClass="validation-error"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ErrorMessage="Please enter a valid email address.">
                </asp:RegularExpressionValidator>
            </div>
            
            <div class="form-group">
                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" 
                    placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                    ControlToValidate="txtPassword"
                    Display="Dynamic"
                    CssClass="validation-error"
                    ErrorMessage="Password is required.">
                </asp:RequiredFieldValidator>
            </div>
            
            <div class="form-group">
                <asp:Button ID="btnLogin" runat="server" Text="Login" 
                    CssClass="btn-login" OnClick="btnLogin_Click" />
            </div>

            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            
            <div class="registration">
                <asp:HyperLink ID="lnkSupplierReg" runat="server" 
                    NavigateUrl="~/SPCSuppliers/RegSupplier.aspx">New Supplier? Register Here</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
