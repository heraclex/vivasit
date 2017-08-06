﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Recomendation.aspx.cs" Inherits="Viva.WebApp.Recomendation" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="lblNotice" runat="server" Text="" ForeColor="Yellow"></asp:Label>
    <br /><br />
    <form class="form-horizontal" runat="server">
        
        <div class="form-group">
            <div class="col-sm-2">
            Usename <asp:Label ID="Label1" runat="server" Text="*" ForeColor="#CC0000"></asp:Label>
                </div>
            <div class="col-sm-4">
                <asp:TextBox ID="txtName" class="form-control" runat="server" ReadOnly="True"></asp:TextBox>
            </div>
            
        </div>
         <div class="form-group">
            <div class="col-sm-2">
                Your Comment <asp:Label ID="lblComment" runat="server" Text="*" ForeColor="#CC0000"></asp:Label> 
                </div>
            <div class="col-sm-4">
                <asp:TextBox ID="txtComment" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
            </div>
            <div class="col-sm-4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtComment" ForeColor="#CC0000"></asp:RequiredFieldValidator>
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <asp:Button ID="btnCommend" runat="server" Text="Send" OnClick="btnCommend_Click"  />
            </div>
        </div>
           

        <%--List recommendation--%>
    <div class="row">
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>DateTime</th>
                        <th>Username</th>
                        <th>Recommendation</th>
                    </tr>
                </thead>
                <tbody>
                    <%foreach (var Recommendation in this.Recommendations) %>
                    <%{ %>
                    <tr>
                        <td><%=Recommendation.CreatedDate %></td>
                        <td><%=Recommendation.Customer.UserName %></td>
                        <td><%=Recommendation.Comment %></td>
                                               
                    <%} %>
                </tbody>
            </table>
        </div>
    </div>
    </form>
</asp:Content>
