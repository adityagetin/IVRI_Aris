<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjProposalApprovalProcess.aspx.cs" Inherits="Project_Aris.ProjProposalApprovalProcess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Style/Table.css" rel="stylesheet" type="text/css" />
    <style>
        /* Button styles */
        .Accept-button,
        .Reject-button {
            display: inline-block;
            padding: 8px 16px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
        }

        .Accept-button {
            background-color: #4CAF50;
            color: white;
        }

        .Reject-button {
            background-color: #FF5733;
            color: white;
        }
    </style>
</head>
<body>
    <form id="formSubmissions" runat="server">
        <h2>Submissions</h2>
        <table>
            <tr>
                <th>ProposalID</th>
                <th>Project Title</th>
                <th>ProjectDomain</th>
                <th>Scientist ID</th>
                <th>FundEstimated</th>
                <th>Supervisor ID</th>
                <th>SubmissionStatus </th>
                <th>Division </th>
                <th>Submission Date</th>
                <th>Action</th>
            </tr>
            <asp:Repeater ID="rptSubmissions" runat="server" OnItemCommand="rptSubmissions_ItemCommand">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("ProposalID") %></td>
                        <td><%# Eval("ProjectTitle") %></td>
                        <td><%# Eval("ProjectDomain") %></td>
                        <td><%# Eval("ScientistID") %></td>
                        <td><%# Eval("FundEstimated") %></td>
                        <td><%# Eval("ScientistID") %></td>
                        <td><%# Eval("SubmissionStatus") %></td>
                        <td><%# Eval("Division") %></td>
                        <td><%# Eval("SubmissionDate", "{0:dd/MM/yyyy}") %></td>
                        </td>
                         <td>
                            <asp:Button ID="Accept" runat="server" Text="Accept" CssClass="Accept-button" CommandName="AcceptSubmission" CommandArgument='<%# Eval("ProposalID")%>' OnClientClick="target='_blank';"/><br />
                             <br />
                             <asp:Button ID="Reject" runat="server" Text="Reject" CssClass="Reject-button" CommandName="RejectSubmission" CommandArgument='<%# Eval("ProposalID")%>'/>
                        </td>

                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </form>
</body>

</html>