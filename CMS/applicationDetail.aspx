<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applicationDetail.aspx.cs" Inherits="applicationDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Application Detail</title>
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
           margin: auto;
                width: 800px;
        margin-top:100px;
        
            }
        
        table, th {
            border: 4px solid black;
        }
        table, tr {
            height:50px;
        }
        td {
            border: 2px solid black;
        }
        h2 {
        margin-left:4%;
        
        }
        h4 {
        margin-left:4%
        }
        .tdd {
          border:none;
        }
        .tddTable{
            border:none;
            margin:auto;
            margin-top:3%;
            margin-bottom:5%;
        }
        .btnConfirm {
            background-color:#28a745;
            border-color:#28a745;
            color:#fff;
            width:10%;
            height:80%;
        }

        .btnReject{
            background-color:#dc3545;
            border-color:#dc3545;
            color:#fff;
            width:10%;
            height:80%;
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
     <asp:Repeater ID="rptr_User" runat="server">
        <HeaderTemplate>
              <table>
        </HeaderTemplate>
        <ItemTemplate>
            <tr><td style="background-color:darkgrey">  <h2>Name Surname</h2></td></tr>
            <tr><td><h4 ><%#Eval("name") %> <%#Eval("surname") %></h4></td></tr>
            <tr><td style="background-color:darkgrey">  <h2>Department</h2></td></tr>
            <tr><td><h4> <h4><%#Eval("department") %></h4></td></tr>
            <tr><td style="background-color:darkgrey"> <h2>Email</h2></td></tr>
             <tr><td><h4 >   <h4 ><%#Eval("email") %></h4></td></tr>
            <tr><td style="background-color:darkgrey"> <h2>Address</h2></td></tr>
             <tr><td><h4 >   <h4><%#Eval("address") %></h4></td></tr>

            <table class="tddTable">
                <tr class="tdd"><td class="tdd"><h4 style="margin-left:0%;">Click the button below to view the document. </h4></td></tr>
                <tr class="tdd"> <td class="tdd"> <asp:Button ID="btnView" OnClick="btnView_Click" CssClass="btnConfirm" runat="server" Text="View"/></td></tr>
                 <tr></tr>
                 <tr class="tdd"> <td class="tdd"> <asp:CheckBox ID="chkPaid" runat="server" /> Please tick if the user has paid the fee. </td></tr>
               
            <tr class="tdd">  <td  class="tdd"> <asp:Button ID="btnConfirm" OnClick="btnConfirm_Click" CssClass="btnConfirm" runat="server" Text="Confirm"/> <asp:Button ID="btnReject" OnClick="btnReject_Click" CssClass="btnReject" runat="server" Text="Reject" /> </td></tr>
                </table>
             </ItemTemplate>
        <FooterTemplate>
            </table>
 
        
            </div>
        </FooterTemplate>
    </asp:Repeater>  
       
    </form>
</body>
</html>
