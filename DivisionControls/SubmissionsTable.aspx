<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubmissionsTable.aspx.cs" Inherits="Project_Aris.SubmissionsTable" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Approvals</title>
    <link href="../Style/Tables.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="formSubmissions" runat="server">
        <h2>Submissions</h2>
        <table>
            <tr>
                <th>Submission ID</th>
                <th>Proposal ID</th>
                <th>Scientist ID</th>
                <th>Supervisor ID</th>
                <th>Submission Status</th>
                <th>Submission Date</th>
                <th>Comment</th>
                <th>Forward</th>
            </tr>
            <asp:Repeater ID="rptSubmissions" runat="server" OnItemCommand="rptSubmissions_ItemCommand">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("SubmissionID") %></td>
                        <td><%# Eval("ProposalID") %></td>
                        <td><%# Eval("ScientID") %></td>
                        <td><%# Eval("SupervisorID") %></td>
                        <td>
                            <asp:Label ID="lblSubmissionStatus" runat="server" Text='<%# Eval("SubmissionStatus") %>'
                                CssClass='<%# Eval("SubmissionStatus").ToString() %>'></asp:Label>
                        </td>
                        <td><%# Eval("SubmissionDate", "{0:dd/MM/yyyy}") %></td>
                        <td><%# Eval("Comment") %>
                        </td>
                        <td>
                            <asp:Button ID="btnFwd" runat="server" Text="Forward" CssClass="update-button" CommandName ="Forward" CommandArgument='<%# Eval("SubmissionID") +","+ Eval("ProposalID") + "," + Eval("ScientID") + "," + Eval("SupervisorID") +","+Eval("SubmissionStatus") +","+ Eval("SubmissionDate", "{0:dd/MM/yyyy}") %>' target="_blank"/>
                        </td>

                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </form>
</body>
</html>
