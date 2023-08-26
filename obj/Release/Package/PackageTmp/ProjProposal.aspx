<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjProposal.aspx.cs" Inherits="Project_Aris.ProjProposal" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Proposals</title>
    <style>
        body {
        margin: 15px;
        font-family: Arial, sans-serif;
        background-image: radial-gradient(circle at 30% 86%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 8%, transparent 8%, transparent 92%), radial-gradient(circle at 55% 100%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 8%, transparent 8%, transparent 92%), radial-gradient(circle at 40% 75%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 7% 99%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 69% 76%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 2% 35%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 14% 48%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 28% 87%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 65% 14%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 51% 36%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 6% 93%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), linear-gradient(135deg, #17e9ad, #1d18d0);
  

         }

        h2 {
        background-color: #333;
        color: #fff;
        padding: 10px;
        text-align: center;
        font-family: sans-serif;
        margin: 0;
        flex-grow: 1;
    }

        .table-container {
            overflow-x: auto;
            margin-top: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #555;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
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
        }
        #Attach:hover {
              background-color: darkorange;
        }

        @media screen and (max-width: 768px) {
            table {
                font-size: 14px;
            }

            th,
            td {
                padding: 8px;
            }
        }
                 
    </style>
</head>
<body>
    
    <form id="formProposal" runat="server">
        <div>
            <table>
                <h2>Project Proposals</h2>
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
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </form>
</body>
</html>

