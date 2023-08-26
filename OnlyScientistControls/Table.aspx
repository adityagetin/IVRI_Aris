<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Table.aspx.cs" Inherits="Project_Aris.Table" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Proposals</title>
    <link href="../Style/Table.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <h2>Project Proposals </h2>
    <br />
    
    <form id="formTable" runat="server">
       <div>
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

            </tr>
            <asp:Repeater ID="rptProposals" runat="server" OnItemDataBound="rptProposals_ItemDataBound">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("ProposalID") %></td>
                        <td>
                            <asp:Label ID="SID" runat="server"><%# Eval("ScientID") %></asp:Label>
                        </td>
                        <td><%# Eval("DivID") %></td>
                        <td><%# Eval("PropUnderDomain") %></td>
                        <td><%# Eval("PropType") %></td>
                        <td><%# Eval("PropTitle") %></td>
                        <td><%# Eval("PropSubAgency") %></td>
                        <td><%# Eval("PropSubDate", "{0:dd/MM/yyyy}") %></td>
                        <td><%# Eval("PropNature") %></td>
                        <td><%# Eval("PropSummary") %></td>
                        <td><%# Eval("PropFundEstimate") %></td>
                        <td>
                            <asp:Label ID="lblPresentStatus" runat="server" Text='<%# Eval("PropPresentStatus") %>'></asp:Label>
                        </td>
                        <td><%# Eval("PropPI") %></td>
                        <td><%# Eval("PropCoPIs") %></td>
                        <td>
                            <a href='<%# Eval("PropAttachment") %>' target="_blank" id ="Attach">View Attachment</a>
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            </table>
       </div>
        
    </form>
     <button id="prevBtn">Previous</button>
        <button id="nextBtn">Next</button>
        <script>
            window.onload = function () {
                var table = document.querySelector("table");
                var rows = table.querySelectorAll("tr");

                var startIndex = 1; // Start index for displaying rows

                function showRows(start, end) {
                    for (var i = 1; i < rows.length; i++) {
                        rows[i].style.display = (i >= start && i <= end) ? "table-row" : "none";
                    }
                }

                function updateRowsColor() {
                    for (var i = 1; i < rows.length; i++) {
                        rows[i].classList.remove("blue-row", "green-row", "orange-row");
                        if (i % 3 === 1) {
                            rows[i].classList.add("blue-row");
                        } else if (i % 3 === 2) {
                            rows[i].classList.add("green-row");
                        } else {
                            rows[i].classList.add("orange-row");
                        }
                    }
                }

                function handleButtonsVisibility() {
                    if (startIndex === 1) {
                        document.getElementById("prevBtn").disabled = true;
                    } else {
                        document.getElementById("prevBtn").disabled = false;
                    }

                    if (startIndex + 10 >= rows.length) {
                        document.getElementById("nextBtn").disabled = true;
                    } else {
                        document.getElementById("nextBtn").disabled = false;
                    }
                }

                showRows(startIndex, startIndex + 9);
                updateRowsColor();
                handleButtonsVisibility();

                // Previous button click
                document.getElementById("prevBtn").addEventListener("click", function () {
                    if (startIndex > 1) {
                        startIndex -= 10;
                        showRows(startIndex, startIndex + 9);
                        updateRowsColor();
                        handleButtonsVisibility();
                    }
                });

                // Next button click
                document.getElementById("nextBtn").addEventListener("click", function () {
                    if (startIndex + 10 < rows.length) {
                        startIndex += 10;
                        showRows(startIndex, startIndex + 9);
                        updateRowsColor();
                        handleButtonsVisibility();
                    }
                });
            };

        </script>
</body>
</html>
