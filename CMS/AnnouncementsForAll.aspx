﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AnnouncementsForAll.aspx.cs" Inherits="AnnouncementsForAll" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Announcements</title>

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



        table, td, th {
            border: 1px solid black;
            margin: auto;
            align-content: center
        }

        table {
            width: 1024px;
        }

        th {
            height: 67px;
        }

        .buttonclass {
            background-color: #ffd800;
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="topOfPage">
                <div class="topOfPageStyle"></div>
                <div style="margin-left: 800px; float: left; font-size: 20px;">
                    <asp:Panel ID="pnlSignOut" runat="server">
                    <asp:Label ID="lblHi" runat="server" Text="Hi,"></asp:Label>
                    <asp:Label ID="lblName" runat="server" Text=""></asp:Label>
                    <asp:Button ID="btnSignOut" OnClick="btnSignOut_Click" runat="server" Text="Sign Out" /></asp:Panel>
            <asp:Panel ID="pnlLogReg" runat="server">
                 <asp:Button ID="btnLogin" OnClick="btnLogin_Click" runat="server" Text="Login" /> /  <asp:Button ID="btnRegister" OnClick="btnRegister_Click" runat="server" Text="Register" />
            </asp:Panel>
                </div>
                <h4 style="margin-top:50px;"> CONFERENCE MANAGEMENT SYSTEM</h4>
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




            <asp:Repeater ID="rptr_announcement" runat="server">
                <HeaderTemplate>
                    <br />
                    <h4 style="text-align:center">ANNOUNCEMENTS</h4>
                    <br />

                    <table>

                        <tr>
                            <th>Subject</th>
                            <th>Date</th>
                        

                        </tr>
                </HeaderTemplate>

                <ItemTemplate>

                    <tr>


                        <td><a href="?detail=<%#Eval("announcementID") %>"><%#Eval("subject")%></a></td>
                        <td><%#Convert.ToDateTime(Eval("date")).ToString("dd/MM/yyyy")%></td>
                       

                    </tr>



                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>



            </asp:Repeater>

            <br />


        </div>
    </form>
</body>
</html>
