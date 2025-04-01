<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegSupplier.aspx.cs" Inherits="StatePharmaceuticalCooperations.SPCSuppliers.RegSupplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SPC Supplier Registration</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous" />
    <style type="text/css">
        .container {
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }

        .header {
            text-align: center;
            color: #2c3e50;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #2c3e50;
        }

        .textbox {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .dropdown {
            width: 100%;
            padding: 8px;
            border: 1px solid #ddd;
            border-radius: 4px;
            background-color: white;
        }

        .button {
            background-color: #3498db;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }

        .button:hover {
            background-color: #2980b9;
        }

        .validation-error {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 5px;
        }

        .success-message {
            background-color: #27ae60;
            color: white;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
            display: none;
        }

        @media (max-width: 768px) {
            .container {
                margin: 10px;
                padding: 15px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h1>SPC Supplier Registration</h1>
            </div>

            <asp:Panel ID="pnlSuccess" runat="server" CssClass="success-message" Visible="false">
                Registration submitted successfully!
            </asp:Panel>

            <div class="form-group">
                <asp:Label ID="lblCompanyName" runat="server" CssClass="label" Text="Company Name" AssociatedControlID="txtCompanyName" />
                <asp:TextBox ID="txtCompanyName" runat="server" CssClass="textbox" />
                <asp:RequiredFieldValidator ID="rfvCompanyName" runat="server" 
                    ControlToValidate="txtCompanyName" 
                    ErrorMessage="Company Name is required" 
                    CssClass="validation-error" 
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblContactPerson" runat="server" CssClass="label" Text="Contact Person" AssociatedControlID="txtContactPerson" />
                <asp:TextBox ID="txtContactPerson" runat="server" CssClass="textbox" />
                <asp:RequiredFieldValidator ID="rfvContactPerson" runat="server" 
                    ControlToValidate="txtContactPerson" 
                    ErrorMessage="Contact Person is required" 
                    CssClass="validation-error" 
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" CssClass="label" Text="Email" AssociatedControlID="txtEmail" />
                <asp:TextBox ID="txtEmail" runat="server" CssClass="textbox" />
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
                <label for="txtPassword">Password:</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server"
                     ControlToValidate="txtPassword"
                     ErrorMessage="Password is required"
                     CssClass="validation-error"
                     Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblPhone" runat="server" CssClass="label" Text="Phone" AssociatedControlID="txtPhone" />
                <asp:TextBox ID="txtPhone" runat="server" CssClass="textbox" />
                <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                    ControlToValidate="txtPhone" 
                    ErrorMessage="Phone is required" 
                    CssClass="validation-error" 
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblAddress" runat="server" CssClass="label" Text="Address" AssociatedControlID="txtAddress" />
                <asp:TextBox ID="txtAddress" runat="server" CssClass="textbox" TextMode="MultiLine" Rows="3" />
                <asp:RequiredFieldValidator ID="rfvAddress" runat="server" 
                    ControlToValidate="txtAddress" 
                    ErrorMessage="Address is required" 
                    CssClass="validation-error" 
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblCity" runat="server" CssClass="label" Text="City" AssociatedControlID="txtCity" />
                <asp:TextBox ID="txtCity" runat="server" CssClass="textbox" />
                <asp:RequiredFieldValidator ID="rfvCity" runat="server" 
                    ControlToValidate="txtCity" 
                    ErrorMessage="City is required" 
                    CssClass="validation-error" 
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblCountry" runat="server" CssClass="label" Text="Country" AssociatedControlID="txtCountry" />
                <asp:TextBox ID="txtCountry" runat="server" CssClass="textbox" />
                <asp:RequiredFieldValidator ID="rfvCountry" runat="server" 
                    ControlToValidate="txtCountry" 
                    ErrorMessage="Country is required" 
                    CssClass="validation-error" 
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblLicenseNumber" runat="server" CssClass="label" Text="License Number" AssociatedControlID="txtLicenseNumber" />
                <asp:TextBox ID="txtLicenseNumber" runat="server" CssClass="textbox" />
                <asp:RequiredFieldValidator ID="rfvLicenseNumber" runat="server" 
                    ControlToValidate="txtLicenseNumber" 
                    ErrorMessage="License Number is required" 
                    CssClass="validation-error" 
                    Display="Dynamic" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblBusinessType" runat="server" CssClass="label" Text="Business Type" AssociatedControlID="ddlBusinessType" />
                <asp:DropDownList ID="ddlBusinessType" runat="server" CssClass="dropdown">
                    <asp:ListItem Text="Select Business Type" Value="" />
                    <asp:ListItem Text="Manufacturer" Value="Manufacturer" />
                    <asp:ListItem Text="Wholesaler" Value="Wholesaler" />
                    <asp:ListItem Text="Distributor" Value="Distributor" />
                    <asp:ListItem Text="Importer" Value="Importer" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvBusinessType" runat="server" 
                    ControlToValidate="ddlBusinessType" 
                    ErrorMessage="Business Type is required" 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    InitialValue="" />
            </div>

            <div class="form-group">
                <asp:Label ID="lblBranch" runat="server" CssClass="label" Text="Branch Registered At" AssociatedControlID="ddlBranch" />
                <asp:DropDownList ID="ddlBranch" runat="server" CssClass="dropdown">
                    <asp:ListItem Text="Select Branch" Value="" />
                    <asp:ListItem Text="Colombo" Value="Colombo" />
                    <asp:ListItem Text="Kandy" Value="Kandy" />
                    <asp:ListItem Text="Galle" Value="Galle" />
                    <asp:ListItem Text="Jaffna" Value="Jaffna" />
                    <asp:ListItem Text="Gampaha" Value="Jaffna" />
                    <asp:ListItem Text="Mathale" Value="Jaffna" />
                    <asp:ListItem Text="Kaluthara" Value="Jaffna" />
                    <asp:ListItem Text="Trincomalee" Value="Jaffna" />
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="rfvBranch" runat="server" 
                    ControlToValidate="ddlBranch" 
                    ErrorMessage="Branch is required" 
                    CssClass="validation-error" 
                    Display="Dynamic" 
                    InitialValue="" />
            </div>

            <div>
                <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
            </div>

            <div class="form-group">
                <asp:Button ID="btnSubmit" runat="server" Text="Submit Registration" CssClass="button" OnClick="btnSubmit_Click" />
            </div>

            <div class="login">
                    <asp:HyperLink ID="lnkSupplierLogin" runat="server" NavigateUrl="~/SupplierLogin.aspx">Already a SPC Supplier? Login Here</asp:HyperLink>
            </div>
        </div>
    </form>
</body>
</html>
