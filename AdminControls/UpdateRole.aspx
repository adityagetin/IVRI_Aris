<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpdateRole.aspx.cs" Inherits="Project_Aris.UpdateRole" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Role Update</title>
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
    <form id="formTable" runat="server">
       <div>
           <h3>Users</h3>
           <hr />
        <table>
            
            <tr>
                <th>UserID</th>
                <th>RoleID</th>
                <th>FirstName</th>
                <th>LastName</th>
                <th>EmailID</th>
                <th>Password</th>
                <th>SupervisorID</th>
                <th>LastLogin</th>
                <th>Role Update</th>

            </tr>
            <asp:Repeater ID="rptUser" runat="server" OnItemDataBound="rptUser_ItemDataBound" >
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("UserID") %></td>
                        <td>
                            <asp:Label ID="RoleID" runat="server"><%# Eval("RoleID") %></asp:Label>
                        </td>
                        <td><%# Eval("FirstName") %></td>
                        <td><%# Eval("LastName") %></td>
                        <td><%# Eval("EmailID") %></td>
                        <td><%# Eval("Password") %></td>
                        <td><%# Eval("SupervisorID") %></td>
                        <td><%# Eval("LastLogin", "{0:dd/MM/yyyy}") %></td>
                        <td>
                            <asp:DropDownList ID="ddlRole" runat="server" CssClass="status-field">
                                <asp:ListItem Text="Admin" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Scientist" Value="2"></asp:ListItem>
                                <asp:ListItem Text="RMP" Value="3"></asp:ListItem>
                                <asp:ListItem Text="Guest" Value="4"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:Button ID="btnUpdateRole" runat="server" Text="Update" CssClass="update-button" CommandName="UpdateStatus" CommandArgument='<%# Eval("UserID") %>' OnClick="btnUpdateRole_Click" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            </table>
       </div>        
    </form>
</body>
</html>
