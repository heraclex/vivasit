<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Viva.WebApp.ContactUs" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   
    <div class="container">
    <p style="color: #000000;"> 
             <strong><i class="fa fa-map-marker"> We’re here to help, so don’t hesitate to get in touch – you can phone on the number below. You can also email us if it is convenient for you.
<br></i></strong>
    <div class="row">
   
    <div class="col-md-5">
        <form class="form-horizontal" runat="server">
            <div class="form-group">
                Email
                <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                <div>
                    <asp:TextBox ID="txtEmail" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" class="control-label" runat="server" ErrorMessage="Please input your email!" ControlToValidate="txtEmail" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Pls input right email format" ControlToValidate="txtEmail" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </div>
            </div>
            <div class="form-group">
                Name
                <asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
                <div>
                    <asp:TextBox ID="txtName" class="form-control" runat="server"></asp:TextBox>
                </div>
                <div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" class="control-label" runat="server" ErrorMessage="Please input your name!" ControlToValidate="txtName" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="form-group">
                Message
                <asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red"></asp:Label>
                <div>
                    <asp:TextBox ID="txtMessage" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
                <div>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="control-label" runat="server" ErrorMessage="Please input your message!" ControlToValidate="txtMessage" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                </div>
            </div>

            <div class="form-group">
                <div>
                    <asp:Button ID="btnContact" runat="server" class="btn btn-primary" Text="Send" OnClick="btnContact_Click" />
                </div>
            </div>

            <div class="form-group">
                <asp:Label ID="lblnotice" runat="server" ForeColor="#0066FF"></asp:Label>
            </div>
        </form>

    </div>
        
        <div class="col-sm-1"></div>
         <div class="col-sm-2">
             <h4>VIVA Bookshop</h4>
        
        <p style="margin-top: 6%; line-height: 35%"><a href="#">Address</a></p>
        <p style="color: ##000000;">
            <i class="fa fa-map-marker">57 Willis Street<br>
                Auckland 0630<br>New Zealand</i>
                     
        </p>
        <p style="margin-top: 6%; line-height: 35%"><a href="#">Phone number</a></p>
        <p style="color: #000000;">
            <i class="fa fa-phone">(+064)71234536</i>
        </p>
        <p style="margin-top: 6%; line-height: 35%"><a href="#">Email Address</a></p>
        <p style="color: ##000000;">
            <i class="fa fa-envelope"></i>
            Contact@vivabook.co.nz
        </p>
        <p></p>
    </div>

    <div class="col-sm-4">
        <br />
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3199.167744837147!2d174.75099634957198!3d-36.69450677987223!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x6d0d3a934ec4060d%3A0xda2585d59bb4046d!2s57+Willis+St%2C+Torbay%2C+Auckland+0630!5e0!3m2!1sen!2snz!4v1501819099059" width="400" height="300" style="border: 0"></iframe>
    </div>
    </div>
    
    </div>

</asp:Content>
