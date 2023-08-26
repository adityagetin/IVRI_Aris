<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Rmp.aspx.cs" Inherits="Project_Aris.Rmp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        body {
            margin: 0;
            padding: 0;
            background-image: radial-gradient(circle at 30% 86%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 8%, transparent 8%, transparent 92%), radial-gradient(circle at 55% 100%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 8%, transparent 8%, transparent 92%), radial-gradient(circle at 40% 75%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 7% 99%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 69% 76%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 2% 35%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 14% 48%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 28% 87%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 65% 14%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 51% 36%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 6% 93%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), linear-gradient(135deg, #17e9ad, #1d18d0);
  
        }

        #navbar{
            background-color: rgb(128,87,216);
            overflow: hidden;
        }
        h3 {
            float: left;
            font-family:sans-serif;
            color: whitesmoke;
            text-align: center;
            margin-left:20px;

        }
        #navbar a {
            float: right;
            font-family:sans-serif;
            color: #fff;
            text-align: center;
            padding: 14px 16px;
            text-decoration: none;
            font-size: 17px;
        }

        #navbar a:hover {

            color: #000;
            font-weight:bold;
        }

        #pageContainer {
            height: calc(100vh - 40px); /* Adjust height based on your requirement */
        }

        .page {
            display: none;
            width: 100%;
            height: 100%;
        }

        #homePage {
            display: block;
        }

        .page iframe {
            width: 100%;
            height: 100%;
            border: none;
        }
    </style>
</head>
<body>
<div id="navbar">
        
        <h3>HELLO! <asp:Label runat="server" ID="name"></asp:Label></h3>
        <a href="Default.aspx"  style="color:orange;">LogOut</a>
        <a href="#" onclick="loadPage('Proposals')">Proposals</a>
        <a href="#" onclick="loadPage('sub')">Submissions</a>
        <a href="#" onclick="loadPage('userPage')">Approval Process</a>
        
        

    </div>

    <div id="pageContainer">
        <div id="Proposals" class="page">
            <iframe src="Table.aspx" frameborder="0"></iframe>
        </div>

        <div id="sub" class="page">
            <iframe src="SubmissionsTable.aspx" frameborder="0"></iframe>
        </div>

        <div id="userPage" class="page">
            <iframe src="ProjProposalApprovalProcess.aspx" frameborder="0"></iframe>
        </div>
    </div>


    <script>
        function loadPage(pageId) {
            // Hide all pages
            var pages = document.getElementsByClassName("page");
            for (var i = 0; i < pages.length; i++) {
                pages[i].style.display = "none";
            }

            // Show the selected page
            var page = document.getElementById(pageId);
            if (page) {
                page.style.display = "block";
            }
        }
    </script>
</body>
</html>
