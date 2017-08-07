<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangePassWord.aspx.cs" Inherits="Viva.WebApp.ChangePassWord" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <form class="form-horizontal" runat="server">
        <div class="form-group">
            <div class="col-sm-2"> </div>
            <div class="col-sm-10"><asp:Label ID="lblMessage" class="col-sm-2" runat="server" Text="" ForeColor="Blue"></asp:Label> </div>
            
        </div>

          <div class="form-group">
            <label class="col-sm-2 control-label">Current Password</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtCurrentPass" type="password" class="form-control" runat="server" ></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtCurrentPass" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>
          <div class="form-group">
            <label class="col-sm-2 control-label">New Password</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtPassword" type="password" class="form-control" runat="server" ></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequirefieldPass" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtPassword" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>

         <div class="form-group">
            <label class="col-sm-2 control-label">Re-Password</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtRePassword" type="password" class="form-control" runat="server" ></asp:TextBox>
            </div>
             <div class="col-sm-4">
                 <asp:RequiredFieldValidator ID="RequirefieldRepass" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtRePassword" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                 <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not match" ForeColor="#CC0000" ControlToCompare="txtPassword" ControlToValidate="txtRePassword"></asp:CompareValidator>
             </div>
        </div>

         <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="btnChanePass" runat="server" Text="Change Password" OnClick="btnChanePass_Click"   />
            </div>
        </div>
    </form>
</asp:Content>
