<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Project_Aris.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Project Management Portal</title>
    <link rel="stylesheet" type="text/css" href="Style/default.css"/>
    <script src="Scripts/slideshow.js"></script>
</head>

<body class="bg">
    <form runat="server">
        <div class="slideshow"></div> <!-- Slideshow Container -->
        <div class="card">
        <img src="Images/ivribaner.png" alt="Banner Image" class="banner-image" />
        <h1>Welcome to Project Management Portal</h1>
        <div class="form-floating">
            <div>
                <asp:Label ID="lblUserID" runat="server" Text="User ID:" AssociatedControlID="Login_UserID"></asp:Label>
                <asp:TextBox ID="Login_UserID" runat="server" CssClass="input"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblPassword" runat="server" Text="Password:" AssociatedControlID="Login_Pass"></asp:Label>
                <asp:TextBox ID="Login_Pass" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>
            </div>
            <div class="Btns">
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="Login" CssClass="btn-login" />
            </div>
            <div>
                <br />
            </div>
            <div class="error-message">
                <asp:Label ID="error" runat="server" EnableViewState="False"></asp:Label>
            </div>
        </div>
    </div>
    </form>
    
</body>

</html>

