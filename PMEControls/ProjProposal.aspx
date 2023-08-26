<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjProposal.aspx.cs" Inherits="Project_Aris.ProjProposal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Proposals</title>
    <link href="../Style/Table.css" rel="stylesheet" type="text/css" />
</head>
<body>
    
    <form id="formProposal" runat="server">
        <div>
            <h2>Project Proposals</h2>
            <table>
                <tr>
                    <th>Proposal ID</th>
                    <th>Scientist ID</th>
                    <th>Division ID</th>
                    <th>Domain</th>
                    <th>Type</th>
                    <th>Title</th>
                    <th>Sub Agency</th>
                    <th>Submission Date</th>
                    <th>Nature</th>
                    <th>Summary</th>
                    <th>Fund Estimate</th>
                    <th>Present Status</th>
                    <th>PI</th>
                    <th>Co-PIs</th>
                    <th>Attachment</th>
                    <th>Action</th>
                </tr>
                <asp:Repeater ID="rptProposals" runat="server" OnItemCommand="rptProposals_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("ProposalID") %></td>
                            <td><%# Eval("ScientID") %></td>
                            <td><%# Eval("DivID") %></td>
                            <td><%# Eval("PropUnderDomain") %></td>
                            <td><%# Eval("PropType") %></td>
                            <td><%# Eval("PropTitle") %></td>
                            <td><%# Eval("PropSubAgency") %></td>
                            <td><%# Eval("PropSubDate", "{0:dd/MM/yyyy}") %></td>
                            <td><%# Eval("PropNature") %></td>
                            <td><%# Eval("PropSummary") %></td>
                            <td><%# Eval("PropFundEstimate", "{0:C2}") %></td>
                            <td><%# Eval("PropPresentStatus") %></td>
                            <td><%# Eval("PropPI") %></td>
                            <td><%# Eval("PropCoPIs") %></td>
                            <td><a href='<%# Eval("PropAttachment") %>' target="_blank" id="Attach">View Attachment</a></td>
                            <td>
                                <asp:Button runat="server"  ID="Review" Text="Review" CssClass="update-button" CommandName="Review" CommandArgument='<%# Eval("ProposalID") %>' target="_blank" />

                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </form>
</body>
</html>

