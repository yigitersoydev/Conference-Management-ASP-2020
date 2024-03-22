<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DetailAnnouncement.aspx.cs" Inherits="DetailAnnouncement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Detail Announcement</title>

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
            height: 1600px;
            margin-top: -18px;
            position: relative;
            margin: auto;
        }

        .headerbox {
            width: 1024px;
            height: 250px;
            background-color: #F6F6F6;
            border-bottom: 3px solid;
            border-top: 3px solid;
            margin-top: 30px;
            border-radius: 10px;
        }

        .contentbox {
            width: 1024px;
            height: 250px;
            background-color: #F6F6F6;
            border-bottom: 3px solid;
            border-top: 3px solid;
            margin-top: 30px;
            border-radius: 10px;
        }

        table {
            border: 1px solid black;
            width: 100%;
            background-color: #F6F6F6;
            height: 50%;
            margin-top: 50px;
            border-bottom: 3px solid;
            border-top: 3px solid;
            border-radius: 10px;
        }

        th {
            border: 1px solid black;
        }

        td {
            border: 1px solid black;
            font-weight: bold;
        }

        tr:hover {
            background-color: white;
        }

        .btn {
            background-color: DodgerBlue;
            border: none;
            color: white;
            padding: 12px 30px;
            cursor: pointer;
            font-size: 20px;
        }

            .btn:hover {
                background-color: RoyalBlue;
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

    <asp:Repeater ID="rptr_Announcement" runat="server">
            <ItemTemplate>
         <div class="content">
            
            <div class="headerbox">

                <h3 style="padding-top:20px;padding-left:10px;font-size:25px; font-family:Arial;"><%# Eval("subject") %></h3>                
                <h4 style="color:gray; padding-left:10px; font-size:20px;"><%#Convert.ToDateTime(Eval("date")).ToString("dd/MM/yyyy")%></h4>

            </div>
           
           
           

             </div>
            </ItemTemplate>
   </asp:Repeater>




        
    </form>
</body>
</html>
