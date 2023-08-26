<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="user.aspx.cs" Inherits="Project_Aris.user" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Create Scientist | Project Aris</title>
    <link href="Style/form.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="container">
        <h2>Create User</h2>
        <asp:Panel ID="pnlCreateScientist" runat="server">
            <div class="content">
                <form action="#" runat="server">
                    <div class="user-details">
                        <div class="input-box">
                                <asp:Label for="txtFirstName" runat="server">First Name:</asp:Label>
                                <asp:TextBox ID="txtFirstName" runat="server" CssClass="input-field" placeholder="Enter the name" required="true"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label for="txtLastName" runat="server">Last Name:</asp:Label>
                            <asp:TextBox ID="txtLastName" runat="server"  CssClass="input-field" placeholder="Enter the Last name"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label ID="lblMname" runat="server" AssociatedControlID="txtMname">Middle Name:</asp:Label>
                            <asp:TextBox ID="txtMname" runat="server" CssClass="input-field" placeholder="Enter your middle name"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label ID="lblEmailID" runat="server" AssociatedControlID="txtEmailID">Email:</asp:Label>
                            <asp:TextBox ID="txtEmailID" runat="server" CssClass="input-field" TextMode="Email" required="true"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword">Password:</asp:Label>
                            <asp:TextBox ID="txtPassword" runat="server" CssClass="input-field" TextMode="Password" required="true"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label for="txtSupervisorID" runat="server">Supervisor ID:</asp:Label>
                            <asp:TextBox ID="txtSupervisorID" runat="server"  CssClass="input-field" required="true"></asp:TextBox>
                        </div>
                        <div class="input-box">

                        <asp:Label for="ddlRoleID"  runat="server" Text="Role:" CssClass="gender-title">Role ID:</asp:Label>
                        <asp:DropDownList ID="ddlRoleID" runat="server" CssClass="dropdown">
                            <asp:ListItem Value="1">Admin</asp:ListItem>
                            <asp:ListItem Value="2">Scientist</asp:ListItem>
                            <asp:ListItem Value="3">RMP</asp:ListItem>
                            <asp:ListItem Value ="4">Guest</asp:ListItem>
                        </asp:DropDownList>
                        </div>
                    </div>
                     
                    <div class="button">
                    <asp:Button ID="btnCreateUser" runat="server" Text="Create User" CssClass="register-btn" OnClick="btnCreateUser_Click1"/>
                    </div>
                </form>
            </div>
        </asp:Panel>
    </div>
</body>
</html>


