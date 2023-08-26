<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Welcome_Scientist.aspx.cs" Inherits="Project_Aris.Welcome_Scientist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Scientist</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: radial-gradient(circle at 30% 86%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 8%, transparent 8%, transparent 92%), radial-gradient(circle at 55% 100%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 8%, transparent 8%, transparent 92%), radial-gradient(circle at 40% 75%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 7% 99%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 69% 76%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 2% 35%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 14% 48%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 28% 87%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 65% 14%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 51% 36%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 6% 93%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), linear-gradient(135deg, #17e9ad, #1d18d0);
  
        }

        /* Navigation Bar Styles */
        #navbar {
            background-color: #333;
            color: #fff;
            padding: 10px;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        #navbar h3 {
            display: flex;
            align-items: center;
        }

        #navbar h3 img {
            margin-right: 10px;
        }

        #navbar a {
            color: #fff;
            text-decoration: none;
            margin-right: 10px;
            transition: color 0.3s ease;

        }

        #navbar a:hover {
            color: orange;
        }

        /* Page Container Styles */



        /* Animation Styles */
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }

        .fade-in {
            animation: fadeIn 0.5s ease-in-out;
        }
        #pageContainer {
            position: relative;
            height: calc(100vh - 70px); /* Adjust the margin-top value if necessary */
        }

        .page {
            display: none;
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
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
        <h3><img src="Images/Science.png" alt="Icon" style="width: 24px; height: 24px;" />Hello! <asp:Label runat="server" ID="Name"></asp:Label></h3>
        <a href="#" onclick="loadPage('View')">View Proposals</a>
        <a href="#" onclick="loadPage('Add')">Add Proposals</a>
        <a href="Default.aspx"  style="color:orange;">LogOut</a>

    </div>

    <div id="pageContainer">
        <div id="View" class="page">
            <iframe src="ProjProposal.aspx" frameborder="0"></iframe>
        </div>

        <div id="Add" class="page">
            <iframe src="AddProjProposal.aspx" frameborder="0"></iframe>
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
