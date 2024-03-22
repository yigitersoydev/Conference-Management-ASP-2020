<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Register</title>
    <style>
        .cerceve {
            margin: 0 auto;
            height: 420px;
            width: 1000px;
            border-radius: 50px;
            border: 1px solid #00F;
            padding: 20px;
            background-color: #ededed;
            border-color: black;
            position: relative;
            top: 40px;
        }

        .topOfPage {
            width: 1024px;
            height: 125px;
            border-style: solid;
            border-width: 1px;
            border-color: #000000;
            margin: 0 auto;
            font-family: 'Open Sans';
            font-style: normal;
            font-size: 30px;
        }

        .topOfPageStyle {
            float: left;
            margin-left: 0px;
            height: 125px;
            width: 50px;
            background-color: black;
            float: left;
        }

        .menudiv {
            width: 1024px;
            margin: 0 auto;
        }


        .topnav {
            overflow: hidden;
            background-color: black;
        }

            .topnav a {
                float: left;
                color: #f2f2f2;
                text-align: center;
                padding: 14px 15px;
                text-decoration: none;
                font-size: 17px;
            }

                .topnav a:hover {
                    background-color: #ddd;
                    color: black;
                }

                .topnav a.active {
                    background-color: #4CAF50;
                    color: white;
                }

        .col-25 {
            float: left;
            width: 28%;
            margin-top: 6px;
        }

        .col-75 {
            float: left;
            margin-top: 6px;
        }

        .block {
            display: block;
            width: 200px;
            border: none;
            background-color: black;
            padding: 0px;
            font-size: 15px;
            cursor: pointer;
            margin: auto;
            border-radius: 10px;
        }

        .content {
            width: 1024px;
            height: 2500px;
            margin-top: -18px;
            position: relative;
            margin: auto;
        }


        .box {
            width: 770px;
            height: 125px;
            border-bottom: 1px solid black;
            margin: auto;
            float: left;
            font-family: 'Open Sans';
            padding-top: 30px;
        }

        .box2 {
            width: 1024px;
            height: 2200px;
            background-color: #F6F6F6;
            box-shadow: 2px 2px 6px #000;
            position: absolute;
            top: 200px;
            padding-top: 30px;
            padding-left: 20px;
        }

        hr {
            display: block;
            margin-top: 0.5em;
            margin-bottom: 0.5em;
            margin-left: auto;
            margin-right: auto;
            border-style: solid;
            border-width: 0.5px;
        }

        .upload-btn-wrapper {
            position: relative;
            overflow: hidden;
            display: inline-block;
        }

        .btn {
            border: 2px solid gray;
            color: white;
            background-color: #CC0C0C;
            padding: 8px 20px;
            border-radius: 8px;
            font-size: 20px;
            font-weight: bold;
        }

        .upload-btn-wrapper input[type=file] {
            font-size: 100px;
            position: absolute;
            left: 0;
            top: 0;
            opacity: 0;
        }

        .auto-style1 {
            height: 437px;
        }

        .auto-style3 {
            font-size: x-large;
        }

        .auto-style4 {
            border-style: solid;
            border-color: inherit;
            border-width: medium;
            margin-left: 467px;
            width: 557px;
            height: 405px;
            margin-right: 0px;
            margin-top: 0px;
            text-align: center;
            background-color: #F6F6F6;
            padding: 25px;
            border-bottom-left-radius: 2em;
            -moz-border-bottom-left-radius: 2em;
            -webkit-border-bottom-left-radius: 2em;
            border-bottom-right-radius: 2em;
            -moz-border-bottom-right-radius: 2em;
            -webkit-border-bottom-right-radius: 2em;
            align-content: center;
        }

        .auto-style5 {
            margin-left: 970px;
            width: 57px;
            height: 28px;
            margin-right: 0px;
            margin-top: 0px;
            text-align: center;
        }

        .auto-style6 {
            margin-left: 0px;
            text-align: center;
        }

        .auto-style7 {
            margin-left: 0px;
            text-align: center;
            font-size: xx-large;
        }

        .auto-style8 {
            margin-left: 521px;
            width: 281px;
            height: 28px;
            margin-right: 0px;
            margin-top: 0px;
            text-align: center;
        }

        .auto-style9 {
            width: 71%;
        }
    </style>
</head>
<body style="height: 811px">
    <form id="form1" runat="server">
        <div>

            <div class="topOfPage">

        <div class="topOfPageStyle"></div>

        <div style="margin-left:800px;float:left;font-size:20px;">
            <asp:Panel ID="pnlSignOut" runat="server">
                    <asp:Label ID="lblHi" runat="server" Text="Hi,"></asp:Label>
                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                    <asp:Button ID="btnSignOut" OnClick="btnSignOut_Click" runat="server" Text="Sign Out" /></asp:Panel>
            <asp:Panel ID="pnlLogReg" runat="server">
                 <asp:Button ID="btnLogin" OnClick="btnLogin_Click" runat="server" Text="Login" /> /  <asp:Button ID="btnRegister" OnClick="btnRegister_Click" runat="server" Text="Register" />
            </asp:Panel>
        </div>
        <h4 style="margin-top:50px;">CONFERENCE MANAGEMENT SYSTEM</h4>

    </div>
    <div class="menudiv">
        <div class="topnav">
           <a class="active" href="Home.aspx">Home</a>
            <a href="conferenceList.aspx">Conference List</a>
            <a href="AnnouncementsForAll.aspx">Announcements</a>
            <a href="contact.aspx">Contact</a>
            <asp:Panel ID="pnlProfileBtn" runat="server"><a href="profile.aspx" style="float:right;">Profile</a></asp:Panel>
        </div>
    </div>






        </div>
         <p class="auto-style7">
                <strong>REGISTER</strong></p>
         <hr align ="center" width="50%" />
        <div class="auto-style1" style="margin-left:15%">
          
            <p class="auto-style4">
                &nbsp;<span class="auto-style3">Username:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; </span>
                <asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style3"></asp:TextBox>
                <br class="auto-style3" />
                <span class="auto-style3">Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; </span>
                <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style3"></asp:TextBox>
                <br class="auto-style3" />
                <span class="auto-style3">Surname:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; </span>
                <asp:TextBox ID="TextBox3" runat="server" CssClass="auto-style3"></asp:TextBox>
                <br class="auto-style3" />
                <span class="auto-style3">&nbsp;&nbsp; Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                <asp:TextBox ID="TextBox4" runat="server" CssClass="auto-style3"></asp:TextBox>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <br class="auto-style3" />
                <span class="auto-style3">Password:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </span>
                <asp:TextBox ID="TextBox5" runat="server" TextMode="Password" CssClass="auto-style3"></asp:TextBox>
                <br class="auto-style3" />
                <span class="auto-style3">Department:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </span>
                <asp:TextBox ID="TextBox6" runat="server" CssClass="auto-style3"></asp:TextBox>
                <br class="auto-style3" />
                <span class="auto-style3">Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                <asp:TextBox ID="TextBox7" runat="server" CssClass="auto-style3"></asp:TextBox>
                <br class="auto-style3" />
               
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                <br />
                 <asp:Button ID="Button1" runat="server" CssClass="auto-style6" Height="31px" Text="Register" Width="73px" OnClick="Button1_Click" />
                <br />
                <br />
                Do you have an account? <a id="HyperLink1" href="Login.aspx" target="_blank">Log in</a> 
            </p>
          
        </div>
       
    </form>
</body>
</html>
