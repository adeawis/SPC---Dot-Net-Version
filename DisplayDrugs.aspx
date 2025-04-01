<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DisplayDrugs.aspx.cs" Inherits="StatePharmaceuticalCooperations.DisplayDrugs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Available Products</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous"/>
    <style type="text/css">
        .product-grid {
            margin-top: 20px;
        }
        .status-in-stock {
            color: green;
            font-weight: bold;
        }

        .status-low-stock {
            color: orange;
            font-weight: bold;
        }

        .status-out-of-stock {
            color: red;
            font-weight: bold;
        }
        .footer {
    position: absolute;
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
                      
        <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger ms-3" OnClick="btnLogout_Click" />
        
    
        <div class="container mt-4">
            <h2>Available Drugs</h2>
            <asp:Label ID="lblMessage" runat="server" Text="" CssClass="text-danger"></asp:Label>

            <div class="row mb-3">
                <div class="col-md-6">
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control" 
                        placeholder="Search by drug name..." />
                </div>
                
                <div class="col-md-2">
                    <asp:Button ID="btnSearch" runat="server" Text="Search" 
                        CssClass="btn btn-primary" OnClick="btnSearch_Click" />
                </div>
            </div>

            <div class="product-grid">
                <asp:GridView ID="gvProducts" runat="server" AutoGenerateColumns="False"
                    CssClass="table table-striped table-bordered" 
                    EmptyDataText="No products found">
                    <Columns>
                        <asp:BoundField DataField="DrugName" HeaderText="Drug Name" />
                        <asp:BoundField DataField="Description" HeaderText="Description" />
                        <asp:BoundField DataField="UnitPrice" HeaderText="Unit Price"  DataFormatString="{0:C}" />
                        <asp:BoundField DataField="Plant" HeaderText="Manufacturing Plant" />
                        <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                        <asp:Label ID="lblStatus" runat="server" Text='<%# Eval("Status") %>' CssClass='<%# 
                                    Convert.ToString(Eval("Status")).ToLower() == "in stock" ? "status-in-stock" : 
                                    Convert.ToString(Eval("Status")).ToLower() == "low stock" ? "status-low-stock" :  "status-out-of-stock" %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>

     <footer class="footer">
    <p>&copy <%= DateTime.Now.Year %> State Pharmaceutical Cooperation (SPC)</p>
</footer>

    
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
</body>
</html>
