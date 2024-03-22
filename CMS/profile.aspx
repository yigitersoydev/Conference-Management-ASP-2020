<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profile.aspx.cs" Inherits="profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>    .cerceve {            margin: 0 auto;            height: 420px;            width: 1000px;            border-radius: 50px;            border: 1px solid #00F;            padding: 20px;            background-color: #ededed;            border-color: black;            position: relative;            top: 40px;        }        .topOfPage {            width: 1024px;            height: 125px;            border-style: solid;            border-width: 1px;            border-color: #000000;            margin: 0 auto;            font-family: 'Open Sans';            font-style: normal;            font-size: 30px;        }        .topOfPageStyle {            float: left;            margin-left: 0px;            height: 125px;            width: 50px;            background-color: black;            float: left;        }        .menudiv {            width: 1024px;            margin: 0 auto;        }        .topnav {            overflow: hidden;            background-color: black;        }        .topnav a {            float: left;            color: #f2f2f2;            text-align: center;            padding: 14px 15px;            text-decoration: none;            font-size: 17px;        }        .topnav a:hover {            background-color: #ddd;            color: black;        }        .topnav a.active {            background-color: #4CAF50;            color: white;        }        .col-25 {            float: left;            width: 28%;            margin-top: 6px;        }        .col-75 {            float: left;            margin-top: 6px;        }        .block {            display: block;            width: 200px;            border: none;            background-color: black;            padding: 0px;            font-size: 15px;            cursor: pointer;            margin: auto;            border-radius: 10px;        }        .content {            width: 1024px;            height: 2500px;            margin-top: -18px;            position: relative;            margin: auto;        }        .box {            width: 770px;            height: 125px;            border-bottom: 1px solid black;            margin: auto;            float: left;            font-family: 'Open Sans';            padding-top: 30px;        }        .box2 {            width: 1024px;            height: 2200px;            background-color: #F6F6F6;            box-shadow: 2px 2px 6px #000;            position: absolute;            top: 200px;            padding-top: 30px;            padding-left: 20px;        }        hr {            display: block;            margin-top: 0.5em;            margin-bottom: 0.5em;            margin-left: auto;            margin-right: auto;            border-style: solid;            border-width: 0.5px;        }        .upload-btn-wrapper {            position: relative;            overflow: hidden;            display: inline-block;        }        .btn {            border: 2px solid gray;            color: white;            background-color: #CC0C0C;            padding: 8px 20px;            border-radius: 8px;            font-size: 20px;            font-weight: bold;        }        .upload-btn-wrapper input[type=file] {            font-size: 100px;            position: absolute;            left: 0;            top: 0;            opacity: 0;        }               .button2:hover {            box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);        }        .divicin{           text-align:center;           width:400px;        }        .button {
            background-color: red;
            box-shadow: 0 5px 0 darkred;
            color: white;
            padding: 0.5em 0.5em;
            position: relative;
            text-decoration: none;
            text-transform: uppercase;
            display: block;
            margin-bottom: 3%;
        }

            .button:hover {
                background-color: #ce0606;
            }

            .button:active {
                box-shadow: none;
                top: 5px;
            }        </style>
</head>
<body>    <form id="form2" runat="server">        <div class="topOfPage">        <div class="topOfPageStyle"></div>        <div style="margin-left:800px;float:left;font-size:20px;">            <asp:Panel ID="pnlSignOut" runat="server">
                    <asp:Label ID="lblHi" runat="server" Text="Hi,"></asp:Label>
                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                    <asp:Button ID="btnSignOut" OnClick="btnSignOut_Click" runat="server" Text="Sign Out" /></asp:Panel>
            <asp:Panel ID="pnlLogReg" runat="server">
                 <asp:Button ID="btnLogin" OnClick="btnLogin_Click" runat="server" Text="Login" /> /  <asp:Button ID="btnRegister" OnClick="btnRegister_Click" runat="server" Text="Register" />
            </asp:Panel>        </div>        <h4 style="margin-top:50px;">CONFERENCE MANAGEMENT SYSTEM</h4>    </div>    <div class="menudiv">        <div class="topnav">            <a class="active" href="Home.aspx">Home</a>
            <a href="conferenceList.aspx">Conference List</a>
            <a href="AnnouncementsForAll.aspx">Announcements</a>
            <a href="contact.aspx">Contact</a>
            <asp:Panel ID="pnlProfileBtn" runat="server"><a href="profile.aspx" style="float:right;">Profile</a></asp:Panel>        </div>    </div>              <div style="margin-top:2%;">                <div style="margin-left: 30%; margin-bottom: 0px; margin-right: 106px;float:left;">            <td><table> <asp:Image ID="Image1" runat="server" Width="250px" Height="250px"/>                <tr>                    <td>                        <br />                    </td>                </tr>                </table>            <br />                </td>            </div>        <div style="margin-right:40%;float:right;">            <asp:repeater id="Repeater4" runat="server">                <itemtemplate>                    <td> <table style="width="50%" cellpadding="0" cellspacing="0" class ="autostyle2">          <p> <b> Name:</b> <%#Eval("name")%> <br /> </p>                             <p>  <b>Surname:</b> <%#Eval("surname")%> <br /> </p>                                         <p>   <b>Email:</b><%#Eval("email")%><br /></p>                   <p>   <b>Address:</b> <%#Eval("address")%> <br /> </p>                                        </table>            </td>                    <div style ="margin-top:35%;">                    <a href="?userIDDD=<%#Eval("userID") %>" class="button">Edit Profile</a> <br />                        <a href="ConferencesAsApplicant.aspx" class="button">Conference as applicant</a><br />                        <a href="ConferencesAsAdmin.aspx" class="button">Conference as admin</a><br />                        <a href="paperList.aspx" class="button">Paper List</a>                        </div>                </itemtemplate>                <SeparatorTemplate>                    <hr />                </SeparatorTemplate>            </asp:repeater>            </div>            </div>    </form></body>
</html>
