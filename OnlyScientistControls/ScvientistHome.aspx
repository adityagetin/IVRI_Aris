<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ScvientistHome.aspx.cs" Inherits="Project_Aris.OnlyScientistControls.ScvientistHome" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../Style/Home.css">
    <title>Home</title>
</head>
<body>
    <form runat="server" method="get">
        <header>
            <div class="organization">
                <img src="../Images/ivribaner.png" alt="Organization Logo">
            </div>
            <div class="profile">
                <a href="#" class="profile-image">
                    <img src="../Images/human.png" alt="Profile Image">
                </a>
                <div class="profile-card">
                    <h2><asp:Label runat="server" ID="name"></asp:Label>  </h2>
                    <p>Division:<asp:Label runat="server" ID="divname"></asp:Label> </p>
                    <asp:Button Text="Logout" runat="server" OnClick="Unnamed_Click" CssClass="logout-button" />
                </div>
            </div>
        </header>
        <nav>
            <ul>
                <li><a href="#" onclick="loadPage('AddProjProposal.aspx')">New Proposals</a></li>
                <li><a href="#" onclick="loadPage('Table.aspx')">Submisssions</a></li>
                <li><a href="#" onclick="loadPage('../Reports/AllReport.aspx')">Report</a></li>
            </ul>
        </nav>
        <main runat="server">
                <iframe id="contentFrame" name="contentFrame" frameborder="0"></iframe>
        </main>
        <script src="../Scripts/LoadPage.js"></script>
        <script>
            function loadPage(pageURL) {
                var contentFrame = document.getElementById("contentFrame");
                contentFrame.src = pageURL;
            }

            // Load the New Proposals page on initial load
            window.onload = function () {
                loadPage('AddProjProposal.aspx');
            };
        </script>
    </form>
    
</body>
</html>

