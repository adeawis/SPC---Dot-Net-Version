<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubmitTender.aspx.cs" Inherits="StatePharmaceuticalCooperations.SPCSuppliers.SubmitTender" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Tender Submissions | SPC</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
</head>
<body>
    <header class="bg-dark text-center text-white py-2">
<h1>State Pharmaceutical Cooperation (SPC)</h1>
</header>
    <form id="form1" runat="server">
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
        <div class="container mt-4">
            <h2 class="text-center">Pharmaceutical Tender Submission Form</h2>
            <hr />
            
            <asp:Label ID="lblMessage" runat="server" CssClass="text-success" />

            <div class="row mb-3">
                <div class="col-md-3">
                    <asp:Label ID="lblCompanyName" runat="server" Text="Company Name:" AssociatedControlID="txtCompanyName" />
                </div>
                <div class="col-md-6">
                    <asp:TextBox ID="txtCompanyName" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvCompanyName" runat="server" 
                        ControlToValidate="txtCompanyName" 
                        ErrorMessage="Company Name is required" 
                        Display="Dynamic" 
                        CssClass="text-danger" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-3">
                    <asp:Label ID="lblContactPerson" runat="server" Text="Contact Person:" AssociatedControlID="txtContactPerson" />
                </div>
                <div class="col-md-6">
                    <asp:TextBox ID="txtContactPerson" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvContactPerson" runat="server" 
                        ControlToValidate="txtContactPerson" 
                        ErrorMessage="Contact Person is required" 
                        Display="Dynamic" 
                        CssClass="text-danger" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-3">
                    <asp:Label ID="lblEmail" runat="server" Text="Email:" AssociatedControlID="txtEmail" />
                </div>
                <div class="col-md-6">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Email is required" 
                        Display="Dynamic" 
                        CssClass="text-danger" />
                    <asp:RegularExpressionValidator ID="revEmail" runat="server" 
                        ControlToValidate="txtEmail" 
                        ErrorMessage="Invalid email format" 
                        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                        Display="Dynamic" 
                        CssClass="text-danger" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-3">
                    <asp:Label ID="lblPhone" runat="server" Text="Phone Number:" AssociatedControlID="txtPhone" />
                </div>
                <div class="col-md-6">
                    <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvPhone" runat="server" 
                        ControlToValidate="txtPhone" 
                        ErrorMessage="Phone Number is required" 
                        Display="Dynamic" 
                        CssClass="text-danger" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-3">
                    <asp:Label ID="lblProductName" runat="server" Text="Product Name:" AssociatedControlID="txtProductName" />
                </div>
                <div class="col-md-6">
                    <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvProductName" runat="server" 
                        ControlToValidate="txtProductName" 
                        ErrorMessage="Product Name is required" 
                        Display="Dynamic" 
                        CssClass="text-danger" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-3">
                    <asp:Label ID="lblManufacturer" runat="server" Text="Manufacturer:" AssociatedControlID="txtManufacturer" />
                </div>
                <div class="col-md-6">
                    <asp:TextBox ID="txtManufacturer" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvManufacturer" runat="server" 
                        ControlToValidate="txtManufacturer" 
                        ErrorMessage="Manufacturer is required" 
                        Display="Dynamic" 
                        CssClass="text-danger" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-3">
                    <asp:Label ID="lblUnitPrice" runat="server" Text="Unit Price:" AssociatedControlID="txtUnitPrice" />
                </div>
                <div class="col-md-6">
                    <asp:TextBox ID="txtUnitPrice" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvUnitPrice" runat="server" 
                        ControlToValidate="txtUnitPrice" 
                        ErrorMessage="Unit Price is required" 
                        Display="Dynamic" 
                        CssClass="text-danger" />
                    <asp:CompareValidator ID="cvUnitPrice" runat="server" 
                        ControlToValidate="txtUnitPrice" 
                        ErrorMessage="Unit Price must be a positive number" 
                        Operator="GreaterThan" 
                        Type="Double" 
                        ValueToCompare="0" 
                        Display="Dynamic" 
                        CssClass="text-danger" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-3">
                    <asp:Label ID="lblQuantity" runat="server" Text="Quantity Available:" AssociatedControlID="txtQuantity" />
                </div>
                <div class="col-md-6">
                    <asp:TextBox ID="txtQuantity" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvQuantity" runat="server" 
                        ControlToValidate="txtQuantity" 
                        ErrorMessage="Quantity is required" 
                        Display="Dynamic" 
                        CssClass="text-danger" />
                    <asp:CompareValidator ID="cvQuantity" runat="server" 
                        ControlToValidate="txtQuantity" 
                        ErrorMessage="Quantity must be a positive number" 
                        Operator="GreaterThan" 
                        Type="Integer" 
                        ValueToCompare="0" 
                        Display="Dynamic" 
                        CssClass="text-danger" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-3">
                    <asp:Label ID="lblDeliveryTime" runat="server" Text="Delivery Timeline (Days):" AssociatedControlID="txtDeliveryTime" />
                </div>
                <div class="col-md-6">
                    <asp:TextBox ID="txtDeliveryTime" runat="server" CssClass="form-control" />
                    <asp:RequiredFieldValidator ID="rfvDeliveryTime" runat="server" 
                        ControlToValidate="txtDeliveryTime" 
                        ErrorMessage="Delivery Timeline is required" 
                        Display="Dynamic" 
                        CssClass="text-danger" />
                    <asp:RangeValidator ID="rvDeliveryTime" runat="server" 
                        ControlToValidate="txtDeliveryTime" 
                        ErrorMessage="Delivery Timeline must be between 1 and 365 days" 
                        MinimumValue="1" 
                        MaximumValue="365" 
                        Type="Integer" 
                        Display="Dynamic" 
                        CssClass="text-danger" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-3">
                    <asp:Label ID="lblComments" runat="server" Text="Additional Comments:" AssociatedControlID="txtComments" />
                </div>
                <div class="col-md-6">
                    <asp:TextBox ID="txtComments" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control" />
                </div>
            </div>

            <div class="row mb-3">
                <div class="col-md-offset-3 col-md-6">
                    <asp:Button ID="btnSubmit" runat="server" Text="Submit Tender" 
                        CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                </div>
            </div>

            
        </div>
    </form>

           <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>

