<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Viva.WebApp.Admin.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Viva Dashboar Login</title>
    <!-- Bootstrap Core CSS -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <!-- Custom Fonts -->
    <link href="Content/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Site.css" rel="stylesheet" />
</head>
<body>
    <div class="container" style="margin-top: 40px">
        <div class="row">
            <div class="col-sm-6 col-md-4 col-md-offset-4">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <strong>Sign in to continue</strong>
                    </div>
                    <div class="panel-body">
                        <form name="form" id="loginForm" runat="server" class="form-horizontal" enctype="multipart/form-data" method="POST">
                            <fieldset>
                                <div class="row">
                                    <div class="center-block">
                                        <img class="profile-img"
                                            src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120" alt="" />
                                    </div>
                                </div>                               
                                <div class="row">
                                    <div class="col-sm-12 col-md-10  col-md-offset-1 ">
                                        <div class="form-group">
                                            <!--User Name-->
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="glyphicon glyphicon-user"></i>
                                                </div>
                                                <asp:TextBox class="form-control" placeholder="Username" ID="txtUserName" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequirefieldUserName" class="control-label" runat="server"
                                                ErrorMessage="UserName is required!" ControlToValidate="txtUserName" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                        </div>
                                        <!--Pass Word-->
                                        <div class="form-group">
                                            <div class="input-group">
                                                <div class="input-group-addon">
                                                    <i class="fa fa-lock"></i>
                                                </div>
                                                <asp:TextBox class="form-control" type="password" placeholder="Password" ID="txtPassword" runat="server"></asp:TextBox>
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequirefieldPassword" class="control-label" runat="server"
                                                ErrorMessage="Password is required!" ControlToValidate="txtPassword" ForeColor="#CC0000"></asp:RequiredFieldValidator>
                                        </div>
                                        <!--Remember me-->
                                        <div class="form-group">
                                            <div class="checkbox">
                                                <label>
                                                    <asp:CheckBox ID="chkRememberMe" runat="server" />Remember me
                                                </label>
                                            </div>
                                        </div>
                                        <!--Sign In Button-->
                                        <div class="form-group">
                                            <asp:Button ID="btnLogin" class="btn btn-lg btn-primary btn-block" runat="server" Text="Sign in" OnClick="btnLogin_Click" />
                                        </div>
                                    </div>
                                </div>
                                <%if (this.loginSuccess == false)
                                    {%>
                                <!--If login fail, display error message!-->
                                <div class="row">
                                    <div class="col-sm-12 col-md-10  col-md-offset-1 ">
                                        <div class="alert alert-danger" role="alert">Login Fail! Try again.</div>
                                    </div>
                                </div>
                                <%} %>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>


</body>
</html>
