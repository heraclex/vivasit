<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ChangeProfile.aspx.cs" Inherits="Viva.WebApp.ChangeProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form class="form-horizontal" runat="server">
        <asp:HiddenField ID="hiddenFieldCustomerId" runat="server" />
        <div class="form-group">
            <asp:Label ID="lblMessage" runat="server" Text=""></asp:Label>
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label">Email</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtEmail" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
        </div>

         <div class="form-group">
            <label class="col-sm-2 control-label">Email</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtUsename" class="form-control"  runat="server" ReadOnly="True"></asp:TextBox>
            </div>
           
        </div>

        
         <div class="form-group">
            <label class="col-sm-2 control-label">First Name</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtFirstName" class="form-control" runat="server" ReadOnly="True" ></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequireFirstName" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtFirstName" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>

         <div class="form-group">
            <label class="col-sm-2 control-label">SurName</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtSurName" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequirefieldSurName" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtSurName" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>

         <div class="form-group">
            <label class="col-sm-2 control-label">Street Address</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtStreet" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequirefieldStreet" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtStreet" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>
                 
         <div class="form-group">
            <label class="col-sm-2 control-label">City</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtCity" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequirefieldCity" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtCity" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label">Surburb</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtSurburb" class="form-control" runat="server" ReadOnly="True" ></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequirefieldSurburb" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtSurburb" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>

         <div class="form-group">
            <label class="col-sm-2 control-label">Zipcode</label>
           <div class="col-sm-4">
                <asp:TextBox ID="txtZipcode" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequirefieldZip" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtZipcode" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>

         <div class="form-group">
            <label class="col-sm-2 control-label">Phone Contact</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtPhone" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequirefieldPhone" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtPhone" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>

                          
      

        <div class="form-group">
            <label class="col-sm-2 control-label">How did you hear about us?</label>
            <div class="col-sm-2">
                <asp:DropDownList CssClass="form-control" ID="dropHear" runat="server" ReadOnly="True">
                    <asp:ListItem>Website</asp:ListItem>
                    <asp:ListItem>Friends</asp:ListItem>
                </asp:DropDownList>
            </div>

        </div>  
        
         <div class="form-group">
            <label class="col-sm-2 control-label">How did you hear about us?</label>
            <div class="col-sm-10">
                <asp:CheckBoxList ID="chklistContact" runat="server" ReadOnly="True">
                            <asp:ListItem Value="Phone">Phone</asp:ListItem>
                            <asp:ListItem Value="Email">Email</asp:ListItem>
                            <asp:ListItem Value="Letter">Letter</asp:ListItem>
                        </asp:CheckBoxList>
                <div class="col-sm-4">
                <asp:Label ID="lblContactError" runat="server" Text="" BorderColor="#CC0000"></asp:Label>   
            </div>
            </div>
        </div>  
        
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="btnSubmit" runat="server" Text="Save" OnClick="btnSubmit_Click"  Visible="False" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"  />
            </div>
        </div>
    </form>
</asp:Content>
