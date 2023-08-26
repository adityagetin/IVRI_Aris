<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Farward.aspx.cs" Inherits="Project_Aris.DivisionControls.Farward" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Proposal Forwarding</title>
     <link href="../Style/Form.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <div class="container">
        <h2>Proposal Forwarding</h2>
        <asp:Panel ID="pnlCreateScientist" runat="server">
            <div class="content">
                <form action="#" runat="server">
                    <div class="user-details">
                        <div class="input-box">
                            <asp:Label runat="server"> Proposal ID:</asp:Label>
                            <asp:TextBox ID="ProposalID" runat="server" ReadOnly="true" CssClass="input-field"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label runat="server">Proposal Action:</asp:Label>
                            <asp:TextBox ID="ReviewAction" CssClass="input-field" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label runat="server">Farwarder:</asp:Label>
                            <asp:TextBox ID="Forwarder" CssClass="input-field" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label runat="server">Forward To:</asp:Label>
                            <asp:DropDownList ID="ddlPME" runat="server" CssClass="dropdown"></asp:DropDownList>

                        </div>
                        <div class="input-box">
                            <asp:Label runat="server">Forward Comment:</asp:Label>
                            <asp:TextBox ID="Comment" runat="server"   TextMode="MultiLine" Rows="3"  CssClass="input-field" ></asp:TextBox>
                        </div>

                    </div>
                     
                    <div class="button">
                            <asp:Button ID="btnForward" runat="server" Text="Forward" CssClass="register-btn" OnClick="btnForward_Click"/>
                    </div>
                </form>
            </div>
        </asp:Panel>
    </div>
   
</body>
</html>
