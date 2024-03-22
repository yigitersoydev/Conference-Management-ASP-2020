<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <style> 

.content {
    width: 1024px;
    height: 900px;
    background-color: #EBEBEB;
    margin-top: -18px;
    position: relative;
    margin: auto;
  
}


.topOfPage {
    width: 1024px;
    height: 125px;
    border-style: solid;
    border-width: 1px;
    border-color: #000000;
    margin: 0 auto;
    font-family: 'Open Sans';
    font-style:normal;
    font-size: 30px;
}

.topOfPageStyle{
    float:left;
    margin-left: 0px;
    height: 125px;
    width:50px;
    background-color: black;
    float:left;

}


.menudiv {
    width: 1024px;
    margin: 0 auto;
}


.topnav {
    overflow: hidden;
    background-color:black;
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


.box1 {
    width: 250px;
    height: 150px;
    font-family: 'Open Sans';
    font-size: 25px;
    font-style: normal;
    background-color: #E19494;
    text-decoration-color: #972A2A;
    text-align: center;
    margin-left: 60px;
    border-radius: 40px;
    box-shadow: 2px 2px 6px #000;
    float:left;
    padding-top:60px;
   
}

.box2 {
    width: 250px;
    /*height: 150px;*/
    font-family: 'Open Sans';
    font-size: 25px;
    font-style: normal;
    background-color: #E19494;
    text-decoration-color: #972A2A;
    text-align: center;
    margin-right: 3%;
    border-radius: 40px;
    box-shadow: 2px 2px 6px #000;
    float: right;
    /*padding-top:65px;*/
}

.box3 {
    width: 250px;
    height: 150px;
    font-family: 'Open Sans';
    font-size: 20px;
    font-style: normal;
    background-color: #E19494;
    text-decoration-color: #972A2A;
    text-align: center;
    margin-left: 60px;
    border-radius: 40px;
    box-shadow: 2px 2px 6px #000;
    float: left;
    padding-top: 50px;
}



.box4 {
    width: 250px;
    height: 250px;
    font-family: 'Open Sans';
    font-size: 20px;
    font-style: normal;
    background-color: #E19494;
    text-decoration-color: #972A2A;
    text-align: center;
    margin-left: 40px;
    border-radius: 40px;
    box-shadow: 2px 2px 6px #000;
    float: left;
    padding-top:50px;
    margin-top:15%;
}

.box5 {
    width: 65%;
    height: 250px;
    font-family: 'Open Sans';
    font-size: 20px;
    font-style: normal;
    background-color: #E19494;
    text-decoration-color: #972A2A;
    text-align: center;
    margin-left: 23px;
    border-radius: 40px;
    box-shadow: 2px 2px 6px #000;
    float: left;
    padding: 20px 10px 20px 10px;
    margin-top: 100px;
}


* {
    font-family: Open Sans;
}

section {
    width: 100%;
    display: inline-block;
    background: #333;
    height: 50vh;
    text-align: center;
    font-size: 22px;
    font-weight: 700;
    text-decoration: underline;
}

.footer-distributed {
    background: #666;
    box-shadow: 0 1px 1px 0 rgba(0, 0, 0, 0.12);
    box-sizing: border-box;
    width: 1024px;
    text-align: left;
    font: bold 16px sans-serif;
    padding: 55px 50px;
    margin:auto;
    height:280px;
}

    .footer-distributed .footer-left,
    .footer-distributed .footer-center,
    .footer-distributed .footer-right {
        display: inline-block;
        vertical-align: top;
    }

    /* Footer left */

    .footer-distributed .footer-left {
        width: 40%;
    }

    /* The company logo */

    .footer-distributed h3 {
        color: #ffffff;
        font: normal 36px 'Open Sans', cursive;
        margin: 0;
    }

        .footer-distributed h3 span {
            color: lightseagreen;
        }

    /* Footer links */

    .footer-distributed .footer-links {
        color: #ffffff;
        margin: 20px 0 12px;
        padding: 0;
    }

        .footer-distributed .footer-links a {
            display: inline-block;
            line-height: 1.8;
            font-weight: 400;
            text-decoration: none;
            color: inherit;
        }

    .footer-distributed .footer-company-name {
        color: #222;
        font-size: 14px;
        font-weight: normal;
        margin: 0;
    }

    /* Footer Center */

    .footer-distributed .footer-center {
        width: 35%;
    }

        .footer-distributed .footer-center i {
            background-color: #33383b;
            color: #ffffff;
            font-size: 25px;
            width: 38px;
            height: 38px;
            border-radius: 50%;
            text-align: center;
            line-height: 42px;
            margin: 10px 15px;
            vertical-align: middle;
        }

            .footer-distributed .footer-center i.fa-envelope {
                font-size: 17px;
                line-height: 38px;
            }

        .footer-distributed .footer-center p {
            display: inline-block;
            color: #ffffff;
            font-weight: 400;
            vertical-align: middle;
            margin: 0;
        }

            .footer-distributed .footer-center p span {
                display: block;
                font-weight: normal;
                font-size: 14px;
                line-height: 2;
            }

            .footer-distributed .footer-center p a {
                color: lightseagreen;
                text-decoration: none;
                ;
            }

    .footer-distributed .footer-links a:before {
        content: "|";
        font-weight: 300;
        font-size: 20px;
        left: 0;
        color: #fff;
        display: inline-block;
        padding-right: 5px;
    }

    .footer-distributed .footer-links .link-1:before {
        content: none;
    }

    /* Footer Right */

    .footer-distributed .footer-right {
        width: 20%;
    }

    .footer-distributed .footer-company-about {
        line-height: 20px;
        color: #92999f;
        font-size: 13px;
        font-weight: normal;
        margin: 0;
    }

        .footer-distributed .footer-company-about span {
            display: block;
            color: #ffffff;
            font-size: 14px;
            font-weight: bold;
            margin-bottom: 20px;
        }

    .footer-distributed .footer-icons {
        margin-top: 25px;
    }

        .footer-distributed .footer-icons a {
            display: inline-block;
            width: 35px;
            height: 35px;
            cursor: pointer;
            background-color: #33383b;
            border-radius: 2px;
            font-size: 20px;
            color: #ffffff;
            text-align: center;
            line-height: 35px;
            margin-right: 3px;
            margin-bottom: 5px;
        }

@media (max-width: 1024px) {

    .footer-distributed {
        font: bold 14px sans-serif;
    }

        .footer-distributed .footer-left,
        .footer-distributed .footer-center,
        .footer-distributed .footer-right {
            display: block;
            width: 100%;
            margin-bottom: 40px;
            text-align: center;
        }

            .footer-distributed .footer-center i {
                margin-left: 0;
            }
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
  </div >
     

        <div class="content">

            <br />
            <br />

        <div class ="box4">
            <strong><center>Last 5 Conferences</center></strong> <br /> 
        <asp:repeater id="Repeater1" runat="server">
        <itemtemplate>
           <%#Eval("conferenceSubject") %><br>
         </itemtemplate>
        </asp:repeater>
        </div>
    

        <div class ="box2">
            <strong><center>Total Users</center></strong> 
        <asp:repeater id="Repeater2" runat="server">
        <itemtemplate>
           <%#Eval("userID") %><br>
         </itemtemplate>
        </asp:repeater>
        </div>
    

        <div class ="box5">
            <strong><center>Announcements</center></strong> 
        <asp:repeater id="Repeater3" runat="server">
        <itemtemplate>
           <%#Eval("subject") %><br>
         </itemtemplate>
        </asp:repeater>

        </div>
        </div>

       <footer class="footer-distributed">

        <div class="footer-left">

            <h3>CM<span>S</span></h3>

            <p class="footer-links">
                <a href="Home.aspx" class="link-1">Home</a>

                <a href="conferenceList.aspx">Conference List</a>

                <a href="announcements.aspx">Announcements</a>

                <a href="contact.aspx">Contact</a>
            </p>

            <p class="footer-company-name">Conference Management System © 2020</p>
        </div>

        <div class="footer-center">

            <div>
                <i class="fa fa-map-marker"></i>
                <p><span>444 S. Cedros Ave</span>Istanbul Kultur University, Istanbul</p>
            </div>

            <div>
                <i class="fa fa-phone"></i>
                <p>+1.555.555.5555</p>
            </div>

            <div>
                <i class="fa fa-envelope"></i>
                <p><a href="mailto:support@company.com">support@company.com</a></p>
            </div>

        </div>

        <div class="footer-right">

            <p class="footer-company-about">
                <span>About the company</span>
                Lorem ipsum dolor sit amet, consectateur adispicing elit. Fusce euismod convallis velit, eu auctor lacus vehicula sit amet.
            </p>

            <div class="footer-icons">

                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-linkedin"></i></a>
                <a href="#"><i class="fa fa-github"></i></a>

            </div>

        </div>

    </footer>


        </form>
</body>
</html>
