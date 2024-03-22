<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paperList.aspx.cs" Inherits="paperList" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Paper List</title>
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

        table {
            border-collapse: collapse;
            text-align: center;
            width: 800px;
            margin: auto;
        }

        table, td, th {
            border: 2px solid black;
        }

        .button {
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
            }
    </style>
</head>
<body>
    <form runat="server">
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
            <h4 style="margin-top: 50px;">CONFERENCE MANAGEMENT SYSTEM</h4>

        </div>
        <div class="menudiv">
            <div class="topnav">
             <a class="active" href="Home.aspx">Home</a>
                <a href="conferenceList.aspx">Conference List</a>
                <a href="AnnouncementsForAll.aspx">Announcements</a>
                <a href="contact.aspx">Contact</a>
                <asp:Panel ID="pnlProfileBtn" runat="server"><a href="profile.aspx" style="float: right;">Profile</a></asp:Panel>
            </div>
        </div>
        <div>
            <asp:Repeater ID="rptr_Paper" runat="server">
                <HeaderTemplate>
                    <h1 style="text-align: center">Paper List - Not Evaluated Yet</h1>

                    <table>
                        <tr>
                            <th>Name Surname</th>
                            <th>Title</th>
                            <th>Conference</th>
                            <th>Status</th>
                            <th>View / Evaluate</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>

                    <tr>
                        <td><%#Eval("name") %>  <%#Eval("surname") %></td>
                        <td><%#Eval("title") %></td>
                        <td><%#Eval("conferenceSubject")%> </td>
                        <td><%#Eval("status")%></td>
                        <td>
                            <a href="?paper=<%#Eval("paperID") %>" class="button">View</a></td>
                        <%--<asp:Button ID="btnView" runat="server" Text="View" OnClick="btnView_Click"/> <asp:Button ID="btnEvaluate" runat="server" Text="Evaluate" /></td>--%>
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </table>
           
                </FooterTemplate>
            </asp:Repeater>

            <asp:Repeater ID="rptr_PaperDone" runat="server">
                <HeaderTemplate>
                    <h1 style="text-align: center">Paper List - Evaluated</h1>

                    <table>
                        <tr>
                            <th>Name Surname</th>
                            <th>Title</th>
                            <th>Conference</th>
                            <th>Status</th>
                            <th>View</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>

                    <tr>
                        <td><%#Eval("name") %>  <%#Eval("surname") %></td>
                        <td><%#Eval("title") %></td>
                        <td><%#Eval("conferenceSubject")%> </td>
                        <td><%#Eval("status")%></td>
                        <td>
                            <a href="?paper=<%#Eval("paperID")%>" class="button">View</a></td>
                    </tr>

                </ItemTemplate>
                <FooterTemplate>
                    </table>
             <hr align="center" width="50%">
                    <input style="position: absolute; left: 500px; width: 100px; height: 30px;" type="button" value="Back">
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </form>
</body>
</html>
