<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Review.aspx.cs" Inherits="Project_Aris.Review" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Proposal Review</title>
    <link href="../Style/Form.css" type="text/css" rel="stylesheet" />
</head>
<body>
    <div class="container">
        <h2>Proposal Review</h2>
        <asp:Panel ID="pnlCreateScientist" runat="server">
            <div class="content">
                <form action="#" runat="server">
                    <div class="user-details">
                        <div class="input-box">
                            <asp:Label runat="server" AssociatedControlID="ProposalID">Proposal ID:</asp:Label>
                            <asp:TextBox ID="ProposalID" runat="server" ReadOnly="true" CssClass="input-field"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label runat="server" AssociatedControlID="Mdate">Review Meeting Date:</asp:Label>
                            <asp:TextBox ID="Mdate" runat="server" CssClass="input-field" TextMode="Date"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label runat="server" AssociatedControlID="ReviewAction">Review Action:</asp:Label>
                            <asp:TextBox ID="ReviewAction" CssClass="input-field" runat="server"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <asp:Label runat="server">Attachment:</asp:Label>
                            <asp:FileUpload ID="fileUpload" runat="server" CssClass="input-field" />
                        </div>
                        <div class="input-box">
                            <asp:Label runat="server" AssociatedControlID="Comment">Review Comment:</asp:Label>
                            <asp:TextBox ID="Comment" runat="server" TextMode="MultiLine" Rows="3" CssClass="input-field"></asp:TextBox>
                        </div>
                    </div>
                    <div class="button">
                        <asp:Button ID="ScheduleReview" runat="server" Text="Schedule Review" CssClass="register-btn" OnClick="ScheduleReview_Click" />
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
