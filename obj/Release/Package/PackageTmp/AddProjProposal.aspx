<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProjProposal.aspx.cs" Inherits="Project_Aris.AddProjProposal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Proposal</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap');

         * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', sans-serif;
        }

        body {
            height: 100vh;
            display:block;
            justify-content: center;
            align-items: center;
            padding: 10px 10px 10px 10px;
            background-image: radial-gradient(circle at 30% 86%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 8%, transparent 8%, transparent 92%), radial-gradient(circle at 55% 100%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 8%, transparent 8%, transparent 92%), radial-gradient(circle at 40% 75%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 7% 99%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 69% 76%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 2% 35%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 14% 48%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 28% 87%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 65% 14%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 51% 36%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 6% 93%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), linear-gradient(135deg, #17e9ad, #1d18d0);
  
        }

        .container {
            margin-top:auto;
            max-width: 700px;
            margin-left:auto;
            margin-right:auto;
            width: 100%;
            background-color: #fff;
            padding: 25px 30px;
            border-radius: 5px;
            box-shadow: 0 5px 10px rgba(0, 0, 0, 0.15);
        }

        .container .title {
          font-size: 25px;
          font-weight: 500;
          position: relative;
          color: #fff;
          margin-bottom: 20px;
        }

        .container .title::before {
          content: "";
          position: absolute;
          left: 0;
          bottom: -3px;
          height: 3px;
          width: 30px;
          border-radius: 5px;
          background: linear-gradient(135deg, #71b7e6, #9b59b6);
        }


        .content form .user-details {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            margin: 20px 0 12px 0;
        }

        form .user-details .input-box {
            margin-bottom: 15px;
            width: calc(100% / 2 - 20px);
        }

        form .input-box span.details {
            display: block;
            font-weight: 500;
            margin-bottom: 5px;
        }

        .user-details .input-box input {
            height: 45px;
            width: 100%;
            outline: none;
            font-size: 16px;
            border-radius: 5px;
            padding-left: 15px;
            border: 1px solid #ccc;
            border-bottom-width: 2px;
            transition: all 0.3s ease;
        }

        .user-details .input-box input:focus,
        .user-details .input-box input:valid {
            border-color: #9b59b6;
        }
        form .user-details .dropdown{
            height: 45px;
            width: 100%;
            outline: none;
            font-size: 16px;
            border-radius: 5px;
            padding-left: 15px;
            border: 1px solid #ccc;
            border-bottom-width: 2px;
            transition: all 0.3s ease;
        }

        form .category {
            display: flex;
            width: 80%;
            margin: 14px 0;
            justify-content: space-between;
        }

        form .category label {
            display: flex;
            align-items: center;
            cursor: pointer;
        }

        form .category label .dot {
            height: 18px;
            width: 18px;
            border-radius: 50%;
            margin-right: 10px;
            background: #d9d9d9;
            border: 5px solid transparent;
            transition: all 0.3s ease;
        }

       

        form .button {
            height: 45px;
            margin: 35px 0;
        }

        form .button input {
            height: 100%;
            width: 100%;
            border-radius: 5px;
            border: none;
            color: #fff;
            font-size: 18px;
            font-weight: 500;
            letter-spacing: 1px;
            cursor: pointer;
            transition: all 0.3s ease;
            background: linear-gradient(135deg, #71b7e6, #9b59b6);
        }

        form .button input:hover {
            background: linear-gradient(-135deg, #71b7e6, #9b59b6);
        }

        .input-box textarea {
            height: 100px; /* Adjust the height as needed */
            width: 100%;
            outline: none;
            font-size: 16px;
            border-radius: 5px;
            padding: 10px 15px;
            border: 1px solid #ccc;
            border-bottom-width: 2px;
            transition: all 0.3s ease;
}

       

        @media (max-width: 584px) {
            .container {
                max-width: 100%;
            }

            form .user-details .input-box {
                margin-bottom: 15px;
                width: 100%;
            }

            form .category {
                width: 100%;
            }

            .content form .user-details {
                max-height: 300px;
                overflow-y: scroll;
            }

            .user-details::-webkit-scrollbar {
                width: 5px;
            }
        }
            
                
        @media (max-width: 459px) {
            .container .content .category {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add Proposal</h2>
        <asp:Panel ID="pnlCreateScientist" runat="server">
            <div class="content">
                <form action="#" runat="server">
                    <div class="user-details">
                         <div class="input-box">
                            <label for="txtPropTitle">Proposal Title:</label>
                            <asp:TextBox ID="txtPropTitle" runat="server" CssClass="input-field"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <label for="txtDivID">Division ID:</label>
                            <asp:TextBox ID="txtDivID" runat="server" CssClass="input-field"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <label for="txtPropUnderDomain">Domain:</label>
                            <asp:TextBox ID="txtPropUnderDomain" runat="server" CssClass="input-field"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <label for="txtPropType">Proposal Type:</label>
                            <asp:DropDownList ID="txtPropType" runat="server" CssClass="dropdown">
                                <asp:ListItem>T1</asp:ListItem>
                                <asp:ListItem>T2</asp:ListItem>
                                <asp:ListItem>T3</asp:ListItem>
                                <asp:ListItem>T4</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="input-box">
                            <label for="txtPropSubAgency">Proposal Sub-Agency:</label>
                            <asp:TextBox ID="txtPropSubAgency" runat="server" CssClass="input-field"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <label for="txtPropSubDate">Proposal Submission Date:</label>
                            <asp:TextBox runat="server" TextMode="Date" ID="txtPropSubDate" CssClass="input-field"></asp:TextBox>
                        </div>
                        
                        <div class="input-box">
                                <label for="txtPropNature">Nature:</label>
                                <asp:DropDownList ID="txtPropNature" runat="server" CssClass="dropdown">
                                    <asp:ListItem>Netework</asp:ListItem>
                                    <asp:ListItem>Collab</asp:ListItem>
                                    <asp:ListItem>Solo</asp:ListItem>
                                </asp:DropDownList>  
                        </div>
                        <div class="input-box">
                            <label for="txtPropFundEstimate">Fund Estimate:</label>
                            <asp:TextBox ID="txtPropFundEstimate" runat="server" CssClass="input-field"></asp:TextBox>
                        </div>
                        <div class="input-box">
                                <label for="txtPropPresentStatus">Present Status:</label>
                                <asp:TextBox ID="txtPropPresentStatus" runat="server" CssClass="input-field"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <label for="txtPropPI">PI:</label>
                            <asp:TextBox ID="txtPropPI" runat="server" CssClass="input-field"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <label for="txtPropCoPIs">Co-PIs:</label>
                            <asp:TextBox ID="txtPropCoPIs" runat="server" CssClass="input-field"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <label for="fileAttachment">Attachment:</label>
                            <asp:FileUpload ID="fileAttachment" runat="server"  CssClass="input-field"/>
                        </div>
                        <div class="input-box">
                            <label for="txtPropSummary">Summary:</label><br/>
                            <asp:TextBox ID="txtPropSummary" runat="server"   TextMode="MultiLine" Rows="4"  CssClass="input-field" ></asp:TextBox>
                        </div>
                    </div>
                     
                    <div class="button">
                        <asp:Button ID="btnAddProposal" runat="server" Text="Add Proposal" CssClass="register-btn"  OnClick="btnAddProposal_Click" />
                    </div>
                </form>
            </div>
        </asp:Panel>
    </div>
</body>
</html>
