<%@ Page Language="C#" AutoEventWireup="true" CodeFile="anyConference.aspx.cs" Inherits="anyConference" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Conference</title>
    <link href="css/AnyConference.css" rel="stylesheet" />
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
     <asp:Repeater ID="rptr_Conference" runat="server">
        <HeaderTemplate>
             <%-- <table>--%>
        </HeaderTemplate>
        <ItemTemplate>
            <div class="content">
            
            <div class="headerbox">

                <h3 style="padding-top:20px;padding-left:10px;font-size:25px; font-family:Arial;"><%# Eval("conferenceSubject") %></h3>
                <h5 style="color:gray; padding-left:10px; font-size:20px; padding-top:20px;"><%# Eval("Location") %></h5>
                <h4 style="color:gray; padding-left:10px; font-size:20px; padding-top:20px;"><%# Convert.ToDateTime(Eval("date")).ToString("dd/MM/yyyy")%></h4>

            </div>
           
            <table style="height:60px;">
                <tr>
                    <td style="width:40%;">
                        Conference website
                    </td>
                    <td style="width:60%;"><a href="<%#Eval("conferenceWebPage")%>">Visit The Web Page</a></td>
                </tr>
                <tr>
                    <td>Start Date</td>
                    <td>
                        <%# Convert.ToDateTime(Eval("date")).ToString("dd/MM/yyyy")%>
                     </td>

                </tr>
                <tr>
                    <td>Due Date</td>
                    <td>
                        <%# Convert.ToDateTime(Eval("dueDate")).ToString("dd/MM/yyyy")%>
                    </td>

                </tr>
                <tr>
                    <td>Conference Topic</td>
                    <td><%# Eval("topic") %>

                </tr>
                <tr>
                    <td>Price</td>
                    <td><%# Eval("price") %> TL</td>

                </tr>
            </table>



            <div style="margin-top:5%;">
                 <a href="?editConf=<%#Eval("conferenceID") %>" style="font-size:20px;">Edit Conference</a><br />
              <a href="?confID=<%#Eval("conferenceID") %>" style="font-size:20px;">Applicants Of Conference</a>
                <h3>This conference accepts new submissions.</h3>
            <a href="?conf=<%#Eval("conferenceID") %>" style="font-size:20px;">Apply to enter as a participant.</a>       
            </div>

             </div>



            <%--<tr><td style="background-color:darkgrey">  <h2>Conference Subject</h2></td></tr>
            <tr><td><h4 ><%#Eval("conferenceSubject") %></h4></td></tr>
            <tr><td style="background-color:darkgrey">  <h2>Start Date</h2></td></tr>
            <tr><td><h4> <h4><%# Convert.ToDateTime(Eval("date")).ToString("dd/MM/yyyy")%></h4></td></tr>
            <tr><td style="background-color:darkgrey"> <h2>Due Date</h2></td></tr>
             <tr><td><h4 >   <h4 ><%# Convert.ToDateTime(Eval("dueDate")).ToString("dd/MM/yyyy")%></h4></td></tr>
            <tr><td style="background-color:darkgrey"> <h2>Conference Topic</h2></td></tr>
             <tr><td><h4 >   <h4><%#Eval("topic") %></h4></td></tr>
            <tr><td style="background-color:darkgrey"> <h2 >Price</h2></td></tr>
             <tr><td><h4 >   <h4><%#Eval("price") %> TL</h4></td></tr>

            <table class="tddTable">
                <tr="tdd"> <td class="tdd"> <a href="?confID=<%#Eval("conferenceID") %>" style="font-size:20px;">Applicants Of Conference</a></td></tr>
            <tr class="tdd">
           
                <td  class="tdd">
                 <h3>This conference accepts new submissions.</h3>
            <a href="?conf=<%#Eval("conferenceID") %>" style="font-size:20px;">Apply to enter as a participant.</a></td>
                </tr>
                </table>--%>
             </ItemTemplate>
        <FooterTemplate>
           <%-- </table>
 
        
            </div>--%>
        </FooterTemplate>
    </asp:Repeater>  
       
    </form>
</body>
</html>
