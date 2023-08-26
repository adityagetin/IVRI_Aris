<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewScientist.aspx.cs" Inherits="Project_Aris.ViewScientist" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Scientist Data</title>
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
            word-wrap: break-word;
            word-break:break-word;
        }

        th {
            background-color: #555;
            color: #fff;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

         .Btn{
              display: inline-block;
              padding: 5px 5px;
        }
         .Btn .icon {
             width:25px;
             height:25px;
             justify-items:center;
            }
        .Btn .icon:hover {
              width:30px;
              height:30px;
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
    <form id ="ShowAll" runat="server">
        <h2>Scientists Information</h2>
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
        <asp:Repeater ID="rptScientists" runat="server" >
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
                    <td><%#Eval("USerID") %></td>

                    <td>
                        <asp:LinkButton ID="lnkEdit" runat="server" CommandArgument='<%# Eval("ScientID") %>' CssClass="Btn" OnClick="Edit"><img src="Images\Edit.png" alt="Edit" class="icon"/> </asp:LinkButton>
                        <br />
                        <asp:LinkButton ID="lnkDelete" runat="server"  CommandArgument='<%# Eval("ScientID") %>' CssClass="Btn" OnClick="lnkDelete_Click" ><img src="Images\Del.png" alt="Delete"  class="icon"/></asp:LinkButton>
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
    </form>
</body>
</html>
