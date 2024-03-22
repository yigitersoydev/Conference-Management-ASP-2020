<%@ Page Language="C#" AutoEventWireup="true" CodeFile="profileEdit.aspx.cs" Inherits="profileEdit" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <title>Edit Profile</title>
    <style>
        
         .cerceve {
            margin: 0 auto;
            height: 450px;
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

        .auto-style1 {
            float: left;
            margin-left: 160px;
        }
        .auto-style2 {
            float: left;
            margin-left: 0px;
            margin-right: 0px;
        }

        .auto-style3 {
            margin-bottom: 1px;
        }

        .auto-style4 {
            margin: 0 auto;
            height: 492px;
            width: 987px;
            border-radius: 50px;
            border: 1px solid black;
            padding: 20px;
            background-color: #ededed;
            position: relative;
            top: 40px;
            left: 0px;
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

    <div class="auto-style4">
       
<table width="10%" cellpadding="10" cellspacing="10" class="auto-style1">
    <tr >
            
       
       
      <td> <table > <asp:Image ID="Image1" runat="server"  width="250px" height="250px"/> 
          <tr>
              <td>
                  <br />
              </td>
          </tr>
          </table>
        <asp:Button ID="Button1" runat="server" Text="Submit" Height="24px" OnClick="Button1_Click" Width="108px" />

  

        </td>
        
        
           
      <td> <table>
          
        <tr>
        
       <td><table  width="50%" cellpadding="0" cellspacing="0" class="auto-style2">
            <p><strong>Name: <asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox></strong></p>
            <p><strong>Surname: <asp:TextBox ID="TextBox2" runat="server" Width="300px"></asp:TextBox></strong></p>
            <p><strong>Phone Number: <asp:TextBox ID="TextBox3" runat="server" Width="300px"></asp:TextBox></strong> </p>
            <p><strong>Email:  <asp:TextBox ID="TextBox4" runat="server" Width="300px"></asp:TextBox></strong></p>
            <p><strong>Department: <asp:TextBox ID="TextBox5" runat="server" Width="300px"></asp:TextBox></strong></p>
            <p><strong>Address: <asp:TextBox ID="TextBox6" TextMode="MultiLine" style="resize:none;width:100%;" runat="server"></asp:TextBox></strong></p>
           <p><strong>Password: <asp:TextBox TextMode="Password" ID="TextBox8" runat="server" Width="300px" CssClass="auto-style3"></asp:TextBox></strong></p>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table></td> 
        
        </tr>
      </table></td> 
    
   
       </tr>
</table>
        
  

    </form>
</body>
</html>
