<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddProjProposal.aspx.cs" Inherits="Project_Aris.AddProjProposal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add New Proposal</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="../Style/Form.css" type="text/css" rel="stylesheet" />

  
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
                            <label for="txtDivID">Division:</label>
                            <asp:TextBox ID="txtDivID" runat="server" CssClass="input-field"  ReadOnly="true" ></asp:TextBox>
                        </div>

                        <div class="input-box">
                            <label for="txtPropUnderDomain">Domain:</label>
                             <asp:DropDownList ID="txtPropUnderDomain" runat="server" CssClass="dropdown">
                         
                            </asp:DropDownList>
                        </div>
                            
                        <div class="input-box">
                            <label for="txtPropType">Proposal Type:</label>
                            <asp:DropDownList ID="txtPropType" runat="server" CssClass="dropdown">
                                <asp:ListItem>Institute Project</asp:ListItem>
                                <asp:ListItem>Externaly Funded</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="input-box">
                            <label for="txtPropSubAgency">Proposal Sub-Agency:</label>
                            <asp:TextBox ID="txtPropSubAgency" runat="server" CssClass="input-field"></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <label for="txtPropSubDate">Proposal Submission Date:</label>
                            <asp:TextBox runat="server" TextMode="Date" ID="txtPropSubDate" CssClass="input-field" ></asp:TextBox>
                            
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
                                <asp:TextBox ID="txtPropPresentStatus" runat="server" CssClass="input-field" Text="Pending" ReadOnly="true" ></asp:TextBox>
                        </div>
                        <div class="input-box">
                            <label for="txtPropPI">PI:</label>
                            <asp:DropDownList ID="ddlScientists" runat="server" CssClass="dropdown" >
                            </asp:DropDownList>
                        </div>

                        <div class="input-box">
                            

                            <label for="txtPropCoPIs">Co-PIs:</label>
                            <asp:DropDownList ID="ddlItems" runat="server" CssClass="dropdown" AutoPostBack="true">
                                </asp:DropDownList>
                             <input type="hidden" id="hiddenSelectedValues" runat="server" />
                        </div>
                        <div class="input-box">
                            <label for="fileAttachment">Attachment:</label>
                            <asp:FileUpload ID="fileAttachment" runat="server"  CssClass="input-field"/>
                        </div>
                        <div class="input-box">
                            <label for="txtPropSummary">Summary:</label><br/>
                            <asp:TextBox ID="txtPropSummary" runat="server"   TextMode="MultiLine" Rows="2"  CssClass="input-field" ></asp:TextBox>
                        </div>
                    </div>
                     
                    <div class="button">
                        <asp:Button ID="btnAddProposal" runat="server" Text="Add Proposal" CssClass="register-btn"  OnClick="btnAddProposal_Click" />
                    </div>
                </form>
            </div>
        </asp:Panel>
    </div>
    <script>
        $(document).ready(function () {
            $("#<%= ddlItems.ClientID %>").on("change", function () {
                var selectedValues = $("#<%= ddlItems.ClientID %> option:selected").map(function () {
                    return $(this).val();
                }).get().join(',');
                $("#<%= hiddenSelectedValues.ClientID %>").val(selectedValues);
            });
        });
    </script>
    

</body>
</html>
