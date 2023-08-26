<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Accept.aspx.cs" Inherits="Project_Aris.Accept" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Proposal Acceptance</title>
    <link href="../Style/Form.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h2>Proposal Acceptance</h2>
        <asp:Panel ID="pnlAcceptProposal" runat="server">
            <div class="content">
                <form runat="server">
                    <div class="user-details">
                        <div class="input-box">
                            <asp:Label runat="server" AssociatedControlID="txtProposalID">Proposal ID:</asp:Label>
                            <asp:TextBox ID="txtProposalID" runat="server" ReadOnly="true" CssClass="input-field"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label runat="server" AssociatedControlID="txtProjTitle">Project Title:</asp:Label>
                            <asp:TextBox ID="txtProjTitle" runat="server" ReadOnly="true" CssClass="input-field"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label runat="server" AssociatedControlID="txtApprovedTerm">Approved Term:</asp:Label>
                            <asp:TextBox ID="txtApprovedTerm" CssClass="input-field" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label runat="server" AssociatedControlID="txtStartDate">Start Date:</asp:Label>
                            <asp:TextBox ID="txtStartDate" CssClass="input-field" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label runat="server" AssociatedControlID="txtCompletionDate">Completion Date:</asp:Label>
                            <asp:TextBox ID="txtCompletionDate" CssClass="input-field" runat="server" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label runat="server" AssociatedControlID="txtApprovedBudget">Approved Budget:</asp:Label>
                            <asp:TextBox ID="txtApprovedBudget" CssClass="input-field" runat="server" ReadOnly="true"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label runat="server">Approval Letter:</asp:Label>
                            <input type="file" id="fileApprovalLetter" runat="server" class="input-field" />
                        </div>
                        <div class="input-box">

                        </div>

                    </div>
                    <div class="button">
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="register-btn" OnClick="btnSubmit_Click" />
                    </div>
                </form>
                <div>
                    <asp:Label ID="ErrorLabel" runat="server" CssClass="error-message" Visible="false"></asp:Label>
                    <asp:Label ID="SuccessLabel" runat="server" CssClass="success-message" Visible="false"></asp:Label>
                </div>
            </div>
        </asp:Panel>
    </div>
</body>
</html>
