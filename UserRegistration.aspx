<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="StatePharmaceuticalCooperations.UserRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SPC - User Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <style type="text/css">
        .registration-container {
            width: 500px;
            margin: 50px auto;
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
        .btn-register {
            background-color: #0073CF;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .btn-register:hover {
            background-color: #0437F2;
        }
        .validation-error {
            color: red;
            font-size: 12px;
            margin-top: 5px;
        }
        .login-link {
    text-align: center;
    margin-top: 15px;
}
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="registration-container">
            <h2>User Registration</h2>
            
            <div class="form-group">
                <label for="ddlUserType">User Type:</label>
                <asp:DropDownList ID="ddlUserType" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select User Type" Value="" />
                    <asp:ListItem Text="Pharmacy" Value="pharmacy" />
                    <asp:ListItem Text="Staff" Value="staff" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvUserType" runat="server" 
                    ControlToValidate="ddlUserType"
                    InitialValue=""
                    ErrorMessage="Please select user type"
                    CssClass="validation-error"
                    Display="Dynamic" />
            </div>

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
                <label for="txtConfirmPassword">Confirm Password:</label>
                <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control" />
                <asp:CompareValidator ID="cvPassword" runat="server"
                    ControlToValidate="txtConfirmPassword"
                    ControlToCompare="txtPassword"
                    ErrorMessage="Passwords do not match"
                    CssClass="validation-error"
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtEmail">Email:</label>
                <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                    ControlToValidate="txtEmail"
                    ErrorMessage="Email is required"
                    CssClass="validation-error"
                    Display="Dynamic" />
                <asp:RegularExpressionValidator ID="revEmail" runat="server"
                    ControlToValidate="txtEmail"
                    ErrorMessage="Invalid email format"
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    CssClass="validation-error"
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <label for="txtContactNo">Contact Number:</label>
                <asp:TextBox ID="txtContactNo" runat="server" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvContactNo" runat="server"
                    ControlToValidate="txtContactNo"
                    ErrorMessage="Contact number is required"
                    CssClass="validation-error"
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Button ID="btnRegister" runat="server" Text="Register" 
                    CssClass="btn-register" OnClick="btnRegister_Click" />
            </div>

            <asp:Label ID="lblMessage" runat="server" />

            <div class="login-link">
            <asp:HyperLink ID="lnkLogin" runat="server" 
                NavigateUrl="~/UserLogin.aspx" 
                Text="Already Have an Account? Login here" />
            </div>
        </div>
    </form>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
