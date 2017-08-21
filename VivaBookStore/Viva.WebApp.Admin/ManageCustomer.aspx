<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageCustomer.aspx.cs" Inherits="Viva.WebApp.Admin.ManageCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--Page Header-->
    <div class="row">
        <div class="col-md-12">
            <h1 class="page-header">Manage Customer
            </h1>
        </div>
    </div>
    <!--Page Content-->
    <div class="row">

        <% var leftPanelCssClass = this.Status == PageStatus.Default ? "col-md-12" : "col-md-7"; %>

        <!--Customer Table -->
        <div class="<%=leftPanelCssClass %>">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-3 pull-right">
                            <!--Add button: customerid = 0 when adding new customer-->
                            <a class="btn btn-primary pull-right" href="ManageCustomer.aspx?customerId=0">Add</a>
                        </div>
                    </div>
                </div>
                <div class="panel-body">

                    <div class="table-responsive">
                        <table id="customer-table" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Username</th>
                                    <th>Active</th>
                                    <th>Edit</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%foreach (var customer in this.Customers) %>
                                <%{ %>
                                <tr>
                                    <td><%=customer.Id %></td>
                                    <td><%=customer.FirstName %></td>
                                    <td><%=customer.LastName %></td>
                                    <td><%=customer.UserName %></td>
                                    <td><input type="checkbox" disabled checked="<%=customer.Active %>"></td></td>
                                    <td>
                                        <a class="btn btn-success btn-xs" href="ManageCustomer.aspx?customerId=<%=customer.Id %>">
                                            <i class="fa fa-pencil" aria-hidden="true"></i>
                                        </a>
                                    </td>

                                    <%} %>
                            </tbody>
                        </table>
                        <script type="text/javascript">
                            $(document).ready(function () {
                                // Binding click event on button Sign In
                                $('#customer-table').DataTable();
                            });
                        </script>
                    </div>

                </div>
            </div>
        </div><!--End Table-->

        <%if (this.Status != PageStatus.Default && this.CurrentCustomer != null)
            {%>
        <!-- Add/Edit Form -->
        <div class="col-md-5">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Manage Customer</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <form runat="server">
                                <asp:HiddenField ID="hfCustomerId" runat="server" />

                                <!--User Name-->
                                <div class="form-group">
                                    <label>User Name</label> <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtUserName" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequirefieldEmail" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtUserName" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                                </div>
                                <!--Password-->
                                <div class="form-group">
                                    <label>Password</label><asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtPassword"  type="password" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtPassword" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                                </div>
                                <!--EmailAddress-->
                                <div class="form-group">
                                    <label>Email Address</label><asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtEmail" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtEmail" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Pls input right email format" ControlToValidate="txtEmail" ForeColor="#CC0000" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </div>
                                <!--PhoneNumber-->
                                <div class="form-group">
                                    <label>Phone Number</label><asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtPhoneNumber" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtPhoneNumber" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                                </div>
                                <!--First Name-->
                                <div class="form-group">
                                    <label>Customer Name</label><asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtFirstName" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtFirstName" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                                </div>
                                <!--Last Name-->
                                <div class="form-group">
                                    <label>Last Name</label><asp:Label ID="Label6" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtLastName" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtLastName" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                                </div>
                                 <!--Address-->
                                <div class="form-group">
                                    <label>Address</label><asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtAddress" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtAddress" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                                </div>
                                 <!--City-->
                                <div class="form-group">
                                    <label>City</label><asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtCity" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtCity" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                                </div>
                                <!--Surburb-->
                                <div class="form-group">
                                    <label>Surburb</label><asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtSurburb" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtSurburb" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                                </div>
                                <!--zipcode-->
                                <div class="form-group">
                                    <label>Zipcode</label><asp:Label ID="Label11" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtZipcode" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtZipcode" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                                </div>
                                <!--Active-->
                                <div class="form-group">
                                    <label>
                                        <asp:CheckBox ID="chkActive" runat="server" Checked="True" />
                                        Active 
                                    </label>
                                </div>
                                <!--Role-->
                                <div class="form-group">
                                    <label>Role</label><asp:Label ID="Label10" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:DropDownList ID="ddRoles" class="form-control" ClientIDMode="Static" runat="server"></asp:DropDownList>
                                </div>

                                <!--Buttons-->
                                <div class="form-group">
                                    <div class="col-md-8" style="text-align: left;">
                                        <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Click" />
                                        <a class="btn btn-default" href="ManageCustomer.aspx">Cancel</a>
                                    </div>

                                    <% // only diplay delete button in Edit Mode
                                        if (this.Status == PageStatus.Edit && this.CurrentCustomer.Id > 0)
                                        {%>
                                   
                                    <%} %>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div><!--End Form-->
        <%} %>

    </div><!--End Page Content-->
</asp:Content>
