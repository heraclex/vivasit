<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Viva.WebApp.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form class="form-horizontal" runat="server">
        <div class="form-group">
            <div class="col-sm-2"> </div>
            <div class="col-sm-4"><asp:Label ID="lblMessage" class="col-sm-10" runat="server" Text="Please input all following information." ForeColor="Blue"></asp:Label> </div>
            
        </div>
        <div class="form-group">
            <label class="col-sm-2 control-label required">Email</label>
            
            <div class="col-sm-4">
                <asp:TextBox ID="txtEmail" class="form-control" runat="server" ></asp:TextBox>

            </div>
            <div class="col-sm-6">
                <asp:RequiredFieldValidator ID="RequirefieldEmail" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtEmail" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Pls input right email format" ControlToValidate="txtEmail" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
        </div>

         <div class="form-group">
            <label class="col-sm-2 control-label required">User Name</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtUseName" class="form-control" runat="server" ></asp:TextBox>
            </div>
            <div class="col-sm-6">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtUseName" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
           
            </div>
        </div>

         <div class="form-group">
            <label class="col-sm-2 control-label required">Password</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtPassword" type="password" class="form-control" runat="server" ></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequirefieldPass" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtPassword" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>

         <div class="form-group">
            <label class="col-sm-2 control-label required">Re-Password</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtRePassword" type="password" class="form-control" runat="server" ></asp:TextBox>
            </div>
             <div class="col-sm-4">
                 <asp:RequiredFieldValidator ID="RequirefieldRepass" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtRePassword" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                 <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password does not match" ForeColor="#CC0000" ControlToCompare="txtPassword" ControlToValidate="txtRePassword"></asp:CompareValidator>
             </div>
        </div>

         <div class="form-group">
            <label class="col-sm-2 control-label required">First Name</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtFirstName" class="form-control" runat="server" ></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequireFirstName" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtFirstName" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>

         <div class="form-group">
            <label class="col-sm-2 control-label required">SurName</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtSurName" class="form-control" runat="server" ></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequirefieldSurName" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtSurName" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>

         <div class="form-group">
            <label class="col-sm-2 control-label required">Street Address</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtStreet" class="form-control" runat="server" ></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequirefieldStreet" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtStreet" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>
                 
         <div class="form-group">
            <label class="col-sm-2 control-label required">City</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtCity" class="form-control" runat="server" ></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequirefieldCity" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtCity" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <label class="col-sm-2 control-label required">Surburb</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtSurburb" class="form-control" runat="server" ></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequirefieldSurburb" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtSurburb" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>

         <div class="form-group">
            <label class="col-sm-2 control-label required">Zipcode</label>
             <asp:Label ID="Label12" runat="server" Text="*" ForeColor="Red"></asp:Label>
           <div class="col-sm-4">
                <asp:TextBox ID="txtZipcode" class="form-control" runat="server" ></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequirefieldZip" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtZipcode" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>

         <div class="form-group">
            <label class="col-sm-2 control-label required">Phone Contact</label>
            <div class="col-sm-4">
                <asp:TextBox ID="txtPhone" class="form-control" runat="server" ></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequirefieldPhone" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtPhone" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>

                          
      

        <div class="form-group">
            <label class="col-sm-2 control-label required">How did you hear about us?</label>
            <div class="col-sm-2">
                <asp:DropDownList CssClass="form-control" ID="dropHear" runat="server">
                    <asp:ListItem>Website</asp:ListItem>
                    <asp:ListItem>Friends</asp:ListItem>
                </asp:DropDownList>
            </div>

        </div>  
        
         <div class="form-group">
            <label class="col-sm-2 control-label required">How can we contact you?</label>
            <div class="col-sm-2">
                <asp:CheckBoxList ID="chklistContact" runat="server">
                            <asp:ListItem Value="Phone">Phone</asp:ListItem>
                            <asp:ListItem Value="Email">Email</asp:ListItem>
                            <asp:ListItem Value="Letter">Letter</asp:ListItem>
                        </asp:CheckBoxList>              
            </div>
              <div class="col-sm-8">
                  <asp:Label ID="lblContactError" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>
        </div>  
        
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="btnRegister" class="btn btn-primary" runat="server" Text="Register" OnClick="btnRegister_Click" />
            </div>
        </div>
    </form>
</asp:Content>
