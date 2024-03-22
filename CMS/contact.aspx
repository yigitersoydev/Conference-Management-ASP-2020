<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contact.aspx.cs" Inherits="contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Contact</title>
    <style>    .cerceve {
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


        .button {

            text-align: center;
        }

        .button2:hover {
            box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
        }
        .auto-style1 {
            margin-left: 0px;
            width: 323px;
        }
        .auto-style3 {
            margin-left: 134px;
            margin-top: 0px;
        }
        .auto-style4 {
            margin-left: 10px;
        }
        .auto-style5 {
            margin-left: 19px;
        }
        .auto-style7 {
            margin-left: 608px;
        }
        .auto-style8 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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

        <div style=" text-align:center;">

    <h2>
        Send Mail To System Admin</h2>
        <br />
&nbsp;&nbsp;Name &amp; Surname:<asp:TextBox ID="TextBox1" runat="server" CssClass="auto-style4" Width="261px"></asp:TextBox>
        <p class="auto-style8">
            E mail Address:&nbsp;
            <asp:TextBox ID="TextBox2" runat="server" CssClass="auto-style5" Width="261px"></asp:TextBox>
        </p>
        <p class="auto-style8">
&nbsp;Enter Your Message:</p>
        <p>
&nbsp;<asp:TextBox  ID="TextBox3" runat="server" CssClass="auto-style3" Height="99px" Width="586px"></asp:TextBox>
        </p>

    
        <p>
            <asp:Button  ID="Button1" runat="server" CssClass="auto-style7" OnClick="Button1_Click" Text="Send" Width="122px"  />
        </p>
        </div>
    
    </form>
    </body>
</html>
