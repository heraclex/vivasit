<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recomendation.aspx.cs" Inherits="Viva.WebApp.Recomendation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblNotice" runat="server" Text=""></asp:Label>
    <form class="form-horizontal" runat="server">

        <div class="form-group">
            <asp:Label ID="Name" runat="server" Text=""></asp:Label>
        </div>
        <div class="form-group">
            <asp:Label ID="lblUsername" runat="server" Text="UseName"></asp:Label> 
            <div class="col-sm-4">
                <asp:TextBox ID="txtName" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            
        </div>
         <div class="form-group">
            <asp:Label ID="lblComment" runat="server" Text="Your Comment"></asp:Label> 
            <div class="col-sm-4">
                <asp:TextBox ID="txtComment" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="col-sm-6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtComment" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="btnCommend" runat="server" Text="Send" OnClick="btnCommend_Click"  />
            </div>
        </div>
    </form>
</asp:Content>
