<%@ Page Language="C#" AutoEventWireup="true" CodeFile="createConference.aspx.cs" Inherits="createConference" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Create Conference</title>
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
            height: 2500px;
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
            height: 2000px;
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
            /* Safari */
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

            <h2>Add a Call for Papers</h2>
            <br />
            Using this page you can add a new CFP (call for papers).

        </div>


        <div class="box2">

            <h3 style="font-family:Calibri; font-weight:bold">CFP Type.</h3>
            Specify the type of your CFP.
            If the required type is not listed, choose 'Other'.
            <br />
           
                <label for="type" style="font-size:20px;">Type:</label>
               
            <asp:DropDownList ID="typelist" runat="server">
                <asp:ListItem value="0"> --Select Type-- </asp:ListItem>
                <asp:ListItem>Conference</asp:ListItem>
                <asp:ListItem>Book</asp:ListItem>
                <asp:ListItem>Journal</asp:ListItem>
                <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>



            <%--<select id="type" style="font-size:20px; background-color:#FCF6FE"> --%>
                 <%--   <option value="conference" style="font-size:15px;">Conference</option> --%>
                 <%--   <option value="book" style="font-size:15px;">Book</option> --%>
                  <%--  <option value="journal" style="font-size:15px;">Journal</option> --%>
                  <%--  <option value="other" style="font-size:15px;">Other</option> --%>
              <%--  </select> --%>
           
            <br />
            <h3 style="font-family:Calibri; font-weight:bold">Name and acronym.</h3>
            Enter the conference full name.
            
                
                <label for="cname" style="font-size:20px;">Conference Name:</label>
                <%--<input type="text" id="cname" name="cname" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:700px; ">--%>
             <asp:TextBox ID="TextBox1" runat="server" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:700px;"></asp:TextBox>
                
                <br>

            <br />
            Enter the conference acronym.
         
                
                <label for="acronym" style="font-size:20px;padding-left:70px;">Acronym:</label>
                 <%--<input type="text" id="acroynm" name="acronym" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:700px;"><br>--%>
            <asp:TextBox ID="TextBox2" runat="server" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:700px;"></asp:TextBox>
          

            <br />
            <hr style="width:90%;">
            <br />

            <h3 style="font-family:Calibri; font-weight:bold">Conference information.</h3>
            Enter the conference Web page.
          
                
                <label for="web" style="font-size:20px;padding-left:70px;">Web page:</label>
                <%--<input type="text" id="web" name="web" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:700px;">--%>
            <asp:TextBox ID="TextBox3" runat="server" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:700px;"></asp:TextBox><br><br/>
                Enter the conference location if relevant.<br /><br />
                
                    
                <label for="addr" style="font-size:20px;padding-left:85px;">Address:</label>
               <%-- <input type="text" id="addr" name="addr" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:700px;">--%>
            <asp:TextBox ID="TextBox4" runat="server" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:700px;"></asp:TextBox><br><br />
           
          

            <br />
            <hr style="width:90%;">
            <br />

            <h3 style="font-family:Calibri; font-weight:bold">Dates and deadlines.</h3>
            All dates must be in the format yyyy-mm-dd.<br />


                Enter the conference start date.<br /><br />
               
                
                <label for="acronym" style="font-size:20px;padding-left:50px;">Start Date:</label>
                <%--<input type="date" id="start" name="trip-start" value="2018-07-22" min="1930-01-01" max="2100-12-31" style="background-color:#FCF6FE;font-size:20px;position:relative;left:10px;border:1px solid;">--%>
            <asp:TextBox ID="TextBox5" runat="server" style="background-color:#FCF6FE;font-size:20px;position:relative;left:10px;border:1px solid;"></asp:TextBox><br><br />
              
                
                Enter the end date.<br /><br />
               
                <label for="acronym" style="font-size:20px;padding-left:50px;">End Date:</label>
               <%-- <input type="date" id="end" name="trip-start" value="2018-07-22" min="1930-01-01" max="2100-12-31" style="background-color:#FCF6FE;font-size:20px;position:relative;left:10px;border:1px solid;">--%>
            <asp:TextBox ID="TextBox6" runat="server" style="background-color:#FCF6FE;font-size:20px;position:relative;left:10px;border:1px solid;"></asp:TextBox><br><br />
         

            <br />
            <hr style="width:90%;">
            <br />

            <h3 style="font-family:Calibri; font-weight:bold">Research areas.</h3>
            Select the main research area to which your conference belongs. If it fits into more than one area, select also the secondary area.<br /><br />
           
                <label for="area" style="font-size:20px;padding-left:50px;">Primary Area:</label>


                <asp:DropDownList ID="typelist2" runat="server">
                <asp:ListItem value="0"> --Select-- </asp:ListItem>
                <asp:ListItem>Engineering</asp:ListItem>
                <asp:ListItem>Economics</asp:ListItem>
                <asp:ListItem>Medicine</asp:ListItem>
                <asp:ListItem>Other</asp:ListItem>
                </asp:DropDownList>



                <%--<select id="area" style="font-size:20px; background-color:#FCF6FE;border:1px solid;">--%>
                   <%-- <option value="eng" style="font-size:15px;">Engineering</option>--%>
                   <%-- <option value="eco" style="font-size:15px;">Economi</option>--%>
                  <%--  <option value="health" style="font-size:15px;">Medicine</option>--%>
              <%--  </select>--%>
    
            <br /><br />
            If your conference does not fit into our list of areas, please write some information about its research area to help us to improve our classification:<br /><br />
          
                
                
                <label for="acronym" style="font-size:20px;padding-left:70px;">Area Notes:</label>
               <%-- <input type="text" id="areanotes" name="acronym" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:700px;height:150px;">--%>
            <asp:TextBox ID="TextBox7" runat="server" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:700px;height:150px;"></asp:TextBox><br><br />

            <br />
            <hr style="width:90%;">
            <br />

            
            <h3 style="font-family:Calibri; font-weight:bold">Topics.</h3>
            Enter at most four topics (categories, themes, areas).
            They will help EasyChair users to find your CFP. They can be added in any order and edited later.<br /><br />
           
                
                <label for="acronym" style="font-size:20px;padding-left:100px;">Topic :</label>
               <%-- <input type="text" id="topic" name="acronym" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:500px;"/>--%>
    <asp:TextBox ID="TextBox8" runat="server" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:500px;"></asp:TextBox><br><br />

            <h3 style="font-family:Calibri; font-weight:bold">Price.</h3>
            Enter price for your conference.
          
                
                <label for="acronym" style="font-size:20px;padding-left:20px;">Conference Price:</label>
               <%-- <input type="text" id="price" name="acronym" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:500px;"/>--%>
            <asp:TextBox ID="TextBox9" runat="server" style="font-size:20px; border:1px solid; background-color:#FCF6FE;width:500px;"></asp:TextBox><br><br />

            <div class="upload-btn-wrapper" style="margin-top:50px; margin-left:90px;">
                <button class="btn">Upload a CFP</button>
                <input type="file" name="myfile" />
            </div>

            <asp:button runat="server"  ID="Submit" OnClick="Submit_Click" Text="Create Conference" class="button button2" style="position:relative; top:100px;left:200px;" />

            <asp:Literal ID="literal1" runat="server"></asp:Literal>

        </div>



    </div>
        </div>
    </form>
</body>
</html>
