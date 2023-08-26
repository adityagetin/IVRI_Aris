<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowScientist.aspx.cs" Inherits="Project_Aris.ShowScientist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form runat="server">
        <div>
            <h2>Scientists</h2>
              <table>
                <tr>
                    <th>ScientID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Middle Name</th>
                    <th>Division ID</th>
                    <th>Discipline</th>
                    <th>Designation ID</th>
                    <th>Date of Birth</th>
                    <th>Date of Joining</th>
                    <th>Email ICAR</th>
                    <th>Email</th>
                    <th>Mobile 1</th>
                    <th>Mobile 2</th>
                    <th>Password</th>
                    <th>User ID</th>
                    <th>Action</th>
                </tr>
                <asp:Repeater ID="rptScientists" runat="server" OnItemCommand="rptScientists_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td><%# Eval("ScientID") %></td>
                            <td><%# Eval("Fname") %></td>
                            <td><%# Eval("Lname") %></td>
                            <td><%# Eval("Mname") %></td>
                            <td><%# Eval("DivID") %></td>
                            <td><%# Eval("Discipilne") %></td>
                            <td><%# Eval("DesigID") %></td>
                            <td><%# Eval("DoB") %></td>
                            <td><%# Eval("DoJ") %></td>
                            <td><%# Eval("EmailICAR") %></td>
                            <td><%# Eval("Email") %></td>
                            <td><%# Eval("Mob1") %></td>
                            <td><%# Eval("Mob2") %></td>
                            <td><%# Eval("Password") %></td>
                            <td><%# Eval("USerID") %></td>
                            <td>
                                <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CommandArgument='<%# Eval("ScientID") %>'>Edit</asp:LinkButton>
                                |
                                <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CommandArgument='<%# Eval("ScientID") %>'>Delete</asp:LinkButton>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </div>
    </form>
</body>
</html>
