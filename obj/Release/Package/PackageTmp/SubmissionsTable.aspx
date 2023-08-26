<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SubmissionsTable.aspx.cs" Inherits="Project_Aris.SubmissionsTable" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Approvals</title>
    <style>
        body {
            background-image: radial-gradient(circle at 30% 86%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 8%, transparent 8%, transparent 92%), radial-gradient(circle at 55% 100%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 8%, transparent 8%, transparent 92%), radial-gradient(circle at 40% 75%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 7% 99%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 69% 76%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 2% 35%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 14% 48%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 28% 87%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 65% 14%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 51% 36%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 6% 93%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), linear-gradient(135deg, #17e9ad, #1d18d0);
  
        }
        table {
            width: 100%;
            border-collapse: collapse;
            border: 2px solid black;
        }

        th, td {
            padding: 8px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-family:sans-serif;
            font-size:small
        }

        .status-pending {
            color: #ff9900;
        }

        .status-approved {
            color: #008000;
        }

        .status-rejected {
            color: #ff0000;
        }

        .update-button {
            background-color: #4CAF50;
            color: white;
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-family:sans-serif;
            font-size:small
        }
        .update-button:hover {
            background-color: #45a049;
        }
        #Attach {
              display: inline-block;
              padding: 5px 5px;
              background-color: orange;
              color: white;
              text-decoration: none;
              border-radius: 5px;
              font-weight: bold;
              text-align:center;
              font-family:sans-serif;
            font-size:small
        }
        #Attach:hover {
              background-color: darkorange;
        }
                 h2 {
            background-color: orange;
            color: #fff;
            padding: 10px 20px;
            border: none;
            text-align:center;
            font-family:sans-serif;


            }
    </style>
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
                <th>Action</th>
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
                            <asp:DropDownList ID="DropDownList1" runat="server" CssClass="status-field">
                                <asp:ListItem Text="Pending" Value="Pending"></asp:ListItem>
                                <asp:ListItem Text="Approved" Value="Approved"></asp:ListItem>
                                <asp:ListItem Text="Rejected" Value="Rejected"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="update-button" CommandName="UpdateSubmission" CommandArgument='<%# Eval("SubmissionID") + "," + Eval("ProposalID") + "," + Eval("ScientID") + "," + Eval("SupervisorID") + "," + Eval("SubmissionStatus") + "," + Eval("SubmissionDate") + "," + Eval("Comment") %>' />
                        </td>

                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </table>
    </form>
</body>
</html>
