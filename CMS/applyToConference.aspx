<%@ Page Language="C#" AutoEventWireup="true" CodeFile="applyToConference.aspx.cs" Inherits="applyToConference" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Apply to Conference</title>
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
            height: 1500px;
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
            height: 1200px;
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
            background-color: #4CAF50;
            /* Green */
            border: none;
            color: white;
            padding: 15px 32px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            -webkit-transition-duration: 0.4s;
            transition-duration: 0.4s;
        }

        .button2:hover {
            box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24), 0 17px 50px 0 rgba(0, 0, 0, 0.19);
        }
    </style>
</head>
<body>
    <form runat="server">
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
                <asp:Panel ID="pnlProfileBtn" runat="server"><a href="profile.aspx" style="float: right;">Profile</a></asp:Panel>
        </div>
    </div>



    <div class="content">
        <div class="box">

            <h2>Be a participant!</h2>
            <br />
            Using this page you can apply to conference that you want to apply.

        </div>


        <div class="box2">

             <h3 style="font-family:Calibri; font-weight:bold">Your Information</h3>
            <h4 style="font-family:Calibri; font-weight:bold">Name Surname</h4>
            <div style="width:1000px">
             <asp:TextBox ID="txtName" runat="server" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:345px;padding:3px;"></asp:TextBox>
            <asp:TextBox ID="txtSurname" runat="server" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:345px;padding:3px;"></asp:TextBox>
                </div>
               
                 <h4 style="font-family:Calibri; font-weight:bold">Email</h4>
             <asp:TextBox ID="txtEmail" runat="server" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:700px;padding:3px;"></asp:TextBox>
            <br />
             <br />
            <hr style="width:97%;float:left;"/>
            <br />

            <h3 style="font-family:Calibri; font-weight:bold">Please specify the title of your paper.</h3>
             <asp:TextBox ID="txtTitle" runat="server" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:700px;padding:3px;"></asp:TextBox>
                
                <br/>

            <br />
         
                
              <h3 style="font-family:Calibri; font-weight:bold">Please write a summary of your paper.</h3>
               
            <asp:TextBox ID="txtSummary" TextMode="MultiLine" runat="server" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:700px;height:100px;padding:3px;"></asp:TextBox>
          

            <br />
            <br />
              <br />
            <hr style="width:97%;float:left;"/>
            <br />
            <h3 style="font-family:Calibri; font-weight:bold">Conference information that you are about to participate.</h3>
          
            <asp:Label ID="lblConfSubject" runat="server" Text="" style="font-weight:bold;"></asp:Label><br /><br />
             <asp:Label ID="lblStartDate" runat="server" Text="" style="font-weight:bold;"></asp:Label><br /><br />
             <asp:Label ID="lblDueDate" runat="server" Text="" style="font-weight:bold;"></asp:Label><br /><br />
             <asp:Label ID="lblTopic" runat="server" Text="" style="font-weight:bold;"></asp:Label><br /><br />
             <asp:Label ID="lblPrice" runat="server" Text="" style="font-weight:bold;"> TL</asp:Label><br /><br />
         
         
            <br />
            <hr style="width:97%;float:left;"/>
            <br />

       <h3 style="font-family:Calibri; font-weight:bold">Upload your paper.</h3>
          
                <asp:FileUpload ID="FileUpload1" runat="server" />
        

            <asp:button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" class="button button2"  style="position:relative; top:100px;left:600px;" />

          
        </div>


    </div>
    </div>
    </form>
</body>
</html>
