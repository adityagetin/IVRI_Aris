<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjProposalApprovalProcess.aspx.cs" Inherits="Project_Aris.ProjProposalApprovalProcess" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            margin: 10px 10px 10px 10px;
            font-family:sans-serif;
            background-image: radial-gradient(circle at 30% 86%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 8%, transparent 8%, transparent 92%), radial-gradient(circle at 55% 100%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 8%, transparent 8%, transparent 92%), radial-gradient(circle at 40% 75%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 7% 99%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 69% 76%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 2% 35%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 14% 48%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 28% 87%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 65% 14%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 51% 36%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 6% 93%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), linear-gradient(135deg, #17e9ad, #1d18d0);
  
        }
        h2 {
            background-color: orange;
            padding: 4px 4px 4px 4px;
            text-align: center;
            color:whitesmoke;
        }
        table {
            border-collapse: collapse;
            width: 100%;
            border: 2px solid black;
            border-radius:5px;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .button {
            display: inline-block;
            padding: 5px 10px;
            background-color: orange;
            color: white;
            text-decoration: none;
            border-radius: 3px;
            border-color:orangered;
        }
            .button:hover {
                background-color:orangered;
                font-size:medium;
            }
    </style>
</head>
<body>
    <form id="formSubmissions" runat="server">
        <h2>Submissions Table</h2>
        <table>
            <tr>
                <th>Approval StepID</th>
                <th>Submission ID</th>
                <th>Supervisor ID</th>
                <th>Submission Status</th>
                <th>Submission Date</th>
                <th>Comment</th>
                <th>Action</th>
            </tr>
            <asp:Repeater ID="rptSubmissions" runat="server" OnItemCommand="rptSubmissions_ItemCommand">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("ApprovalStepId") %></td>
                        <td><%# Eval("SubmissionID") %></td>
                        <td><%# Eval("SupervisorID") %></td>
                        <td><%# Eval("SubmissionStatus") %></td>
                        <td><%# Eval("SubmissionDate", "{0:dd/MM/yyyy}") %></td>
                        <td><%# Eval("Comment") %>
                        </td>
                         <td>
                            <asp:Button ID="Accept" runat="server" Text="Accept" CssClass="Accept-button" CommandName="AcceptSubmission" CommandArgument='<%# Eval("SubmissionID")%>' OnClientClick="target='_blank';"/><br />
                             <asp:Button ID="Reject" runat="server" Text="Reject" CssClass="Reject-button" CommandName="RejectSubmission" CommandArgument='<%# Eval("SubmissionID")%>'/>
                        </td>

                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </form>
</body>

</html>