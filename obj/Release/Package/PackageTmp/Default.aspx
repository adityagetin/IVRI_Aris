<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Project_Aris.WebForm1" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Project Management Portal</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <link rel="stylesheet" type="text/css" href="style.css" />
    <style>
    html,
    body {
        height: 98%;
    }

    .bg {
        position: relative;
        z-index: -1;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        background-image: radial-gradient(circle at 30% 86%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 8%, transparent 8%, transparent 92%), radial-gradient(circle at 55% 100%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 8%, transparent 8%, transparent 92%), radial-gradient(circle at 40% 75%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 7% 99%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 69% 76%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 2% 35%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 14% 48%, rgba(255, 255, 255, 0.03) 0%, rgba(255, 255, 255, 0.03) 6%, transparent 6%, transparent 94%), radial-gradient(circle at 28% 87%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 65% 14%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 51% 36%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), radial-gradient(circle at 6% 93%, rgba(255, 255, 255, 0.04) 0%, rgba(255, 255, 255, 0.04) 4%, transparent 4%, transparent 96%), linear-gradient(135deg, #17e9ad, #1d18d0);

    }

    body {
        display: flow;
        align-items: center;
        padding-top: 40px;
        padding-bottom: 40px;
        background-color: #f5f5f5;
    }

    .form-signin {
        width: 100%;
        max-width: 450px;
        margin: auto;
        background: rgba(255, 255, 255, 0.05);
        backdrop-filter: blur(10px);
        border-top: 1px solid rgba(255, 255, 255, 0.2);
        border-left: 1px solid rgba(255, 255, 255, 0.2);
        box-shadow: 5px 5px 30px rgba(0, 0, 0, 0.2);
        border-radius: 3px;
    }

    h1 {
        background: rgba(255, 255, 255, 0.05);
        backdrop-filter: blur(10px);
        border-top: 1px solid rgba(255, 255, 255, 0.2);
        border-left: 1px solid rgba(255, 255, 255, 0.2);
        box-shadow: 5px 5px 30px rgba(0, 0, 0, 0.2);
        margin-top: 0px;
        border-top-left-radius: 3px;
        border-top-right-radius: 3px;
        color: #fff;
        padding: 15px;
        text-align: center;
    }

    label {
        font-weight: bold;
    }

    input[type="text"] {
        margin-bottom: -1px;
        border-bottom-right-radius: 0;
        border-bottom-left-radius: 0;
    }

    input[type="password"] {
        margin-bottom: 10px;
        border-top-left-radius: 0;
        border-top-right-radius: 0;
    }

    .banner-image {
        width: 90%;
        margin-top: 5px;
        margin-right: auto;
        margin-left: auto;
        display: block;
        margin-bottom: 2vh;
    }

    .btn-login {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        border: none;
        color: #fff;
        font-weight: bold;
        border-radius: 5px;
        cursor: pointer;
    }

    .error-message {
        color: whitesmoke;
        font-family:sans-serif;
        font-weight:bold;
        font-size: 14px;
        margin-top: 10px;
    }

    @media (max-width: 576px) {
        .container {
            max-width: 100%;
            margin: 0;
            border-radius: 0;
            box-shadow: none;
        }
    }

    
</style>

</head>
<body class="bg">
     <img src="Images/ivribaner.png" alt="Banner Image" class="banner-image" />
    <form id="form1" runat="server" class="form-signin">
        <div>
                
         <h1>Welcome to Project Management Portal</h1>    
        </div>
        <div class="form-floating">
            
            
            <div>
                <asp:Label ID="lblUserID" runat="server" Text="User ID:" AssociatedControlID="Login_UserID"></asp:Label>
                <asp:TextBox ID="Login_UserID" runat="server"></asp:TextBox>
            </div>
            <div>
                <asp:Label ID="lblPassword" runat="server" Text="Password:" AssociatedControlID="Login_Pass"></asp:Label>
                <asp:TextBox ID="Login_Pass" runat="server" TextMode="Password"></asp:TextBox>
            </div>
            <div>
                <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="Login" CssClass="btn-login" />
            </div>
            <div class="error-message">
                <asp:Label ID="error" runat="server" EnableViewState="False"></asp:Label>
            </div>
        </div>
    </form>
</body>
    
</html>
