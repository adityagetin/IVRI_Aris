<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome_Admin.aspx.cs" Inherits="Project_Aris.Welcome_Admin" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

   <title>Welcome Admin</title>
    <link rel="stylesheet" type="text/css"  href="Style/Welcome.css"/>
    
</head>
<body>
    <div id="navbar">
        <div class="welcome">
            <h3>Admin Login</h3>
        </div>
        <div class="option">
            <a href="#" onclick="loadPage('homePage')">Home</a>
            <a href ="#" onclick="loadPage('ProjProposal')">Proposals</a>
            <a href="#" onclick="loadPage('scientistPage')">Scientist Information</a>
            <a href="#" onclick="loadPage('CreateScPage')">Create Scientist</a>
            <a href="#" onclick="loadPage('CreateuserPage')">Add New Users</a>
            <a href="#" onclick="loadPage('userPage')">Manage User Role</a>
            <a href="Default.aspx" style="color:orangered;">LOGOUT!</a>
        </div>
        
        
    </div>

    <div id="pageContainer">
        <div id="homePage" class="page">
            <h1>Hello!<asp:Label runat="server" ID="UserName" Text=""></asp:Label></h1>
        </div>

        <div id="scientistPage" class="page">
            <iframe src="ViewScientist.aspx" frameborder="0"></iframe>
        </div>
        <div id="CreateScPage" class="page">
            <iframe src="CrateScientist.aspx" frameborder="0"></iframe>
        </div>

        <div id="CreateuserPage" class="page">
            <iframe src="user.aspx" frameborder="0"></iframe>
        </div>

        <div id ="userPage" class="page">
            <iframe src ="UpdateRole.aspx" frameborder="0"></iframe>
        </div>

        
        <div id="ProjProposal"class="page">
            <iframe src="ProjProposal.aspx" frameborder="0"></iframe>
        </div>


    </div>


    <script src="Scripts/PageScript.js"></script>
</body>
</html>
