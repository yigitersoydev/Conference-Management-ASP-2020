<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style>
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
                padding: 14px 16px;
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


        .giris {
            width: 350px;
            background-color: #1c1c1c;
            padding-left: 25px;
            padding-right: 25px;
            padding-top: 10px;
            padding-bottom: 10px;
            border-top-left-radius: 2em;
            -moz-border-top-left-radius: 2em;
            -webkit-border-top-left-radius: 2em;
            border-top-right-radius: 2em;
            -moz-border-top-right-radius: 2em;
            -webkit-border-top-right-radius: 2em;
        }

        .ana {
            width: 350px;
            background-color: #F6F6F6;
            padding: 25px;
            border-bottom-left-radius: 2em;
            -moz-border-bottom-left-radius: 2em;
            -webkit-border-bottom-left-radius: 2em;
            border-bottom-right-radius: 2em;
            -moz-border-bottom-right-radius: 2em;
            -webkit-border-bottom-right-radius: 2em;
        }



        .font {
            float: left;
            color: #000000;
            text-shadow: 0px 3px 5px #000;
            -moz-text-shadow: 0px 3px 5px #000;
            -webkit-text-shadow: 0px 3px 5px #000;
        }

        .fontt {
            color: #fff;
            text-shadow: 0px 3px 5px #000;
            -moz-text-shadow: 0px 3px 5px #000;
            -webkit-text-shadow: 0px 3px 5px #000;
        }

        .kutu {
            float: right;
            border: #1c1c1c;
        }

        .temizsag {
            clear: right;
        }



        .temizsol {
            clear: left;
        }



        .buton {
            color: #fff;
            background-color: #1c1c1c;
            border: 2px dotted #1c1c1c;
            border-radius: 2em;
            -moz-border-radius: 2em;
            -webkit-border-radius: 2em;
            cursor: pointer;
        }



            .buton:hover {
                background-color: #808080;
            }

        .auto-style1 {
            color: #fff;
            background-color: #1c1c1c;
            border: 2px dotted #1c1c1c;
            border-radius: 2em;
            -moz-border-radius: 2em;
            -webkit-border-radius: 2em;
            cursor: pointer;
            margin-left: 0px;
        }

        .auto-style2 {
            width: 74px;
        }

        .auto-style3 {
            width: 45px;
        }
    </style>
</head>
<body>
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



         <div> <h2 style="text-align:center">LOGIN TO CMS</h2> </div>
    <div> <h3 style="text-align:center">Accessing The Conference Management System</h3> </div>
    <div> <h3 style="text-align:center">Please Enter Username And Password</h3> </div>
    <hr align ="center" width="50%">  
    <br /> <br /> <br />

    <center>
        <div class="giris"><div class="fontt"><b>LOGIN PANEL</b></div></div>
        <div class="ana">

                <div class="font"><b>Username:</b></div>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            <b>
                <div class="font">Password:</div>
            <asp:TextBox ID="TextBox2" TextMode="Password" runat="server"></asp:TextBox>
            <br />
            <br />

            </b><asp:Button ID="Button1" class="auto-style1" runat="server" Text="LOGIN" OnClick="Button1_Click"></asp:Button>
            <br /><div style="margin-top:5%;"> If you dont have a CMS account, <a id="HyperLink1" href="Register.aspx">Register</a> </div>
                <br/>
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                &nbsp;<hr color="black">

         </form>
</body>
</html>
