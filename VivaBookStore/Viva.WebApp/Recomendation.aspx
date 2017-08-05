<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recomendation.aspx.cs" Inherits="Viva.WebApp.Recomendation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form class="form-horizontal" runat="server">
        <div class="form-group">
            <asp:Label ID="Name" runat="server" Text=""></asp:Label>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">UseName</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtName" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            
        </div>
         <div class="form-group">
            <label class="col-sm-2 control-label">Your Comment</label>
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
