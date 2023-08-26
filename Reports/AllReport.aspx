<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AllReport.aspx.cs" Inherits="Project_Aris.Reports.AllReport" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reports</title>
        <link rel="stylesheet" type="text/css" href="../Style/Report.css" />
        <script src="../Scripts/Print.js"></script>
</head>
<body>

    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h2>Project Reports</h2>
            </div>
            <div class="selections">
                <div class="selectors">
                    <label for="ddlScientist">Scientist</label>
                    <asp:DropDownList runat="server" ID="ddlScientist" onchange="resetDropdowns(this);" CssClass="ddl"></asp:DropDownList>
                </div>
                <div class="selectors">
                    <label for="ddlDivision">Division</label>
                    <asp:DropDownList runat="server" ID="ddlDivision" onchange="resetDropdowns(this);" CssClass="ddl"></asp:DropDownList>
                </div>
                <div class="selectors">
                    <label for="ddlDomain">Domain</label>
                    <asp:DropDownList runat="server" ID="ddlDomain" onchange="resetDropdowns(this);" CssClass="ddl"></asp:DropDownList>
                </div>
                <div class="selectors">
                    <asp:Button runat="server" ID="btnGenerateReport" Text="Generate Report" OnClick="btnGenerateReport_Click" CssClass="update-button" />
                </div>
            </div>
            <div>
                <hr />
            </div>
            <div class="Data_Cards" id="Data_Cards" runat="server">
            </div>
        </div>
    </form>
</body>
</html>
