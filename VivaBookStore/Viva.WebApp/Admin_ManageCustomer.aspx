﻿<%@ Page Title="Manage Customer" Language="C#" MasterPageFile="~/Site.Admin.Master" AutoEventWireup="true" CodeBehind="Admin_ManageCustomer.aspx.cs" Inherits="Viva.WebApp.Admin_ManageCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">
                <%=this.Page.Title %>
            </h1>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12">
            <asp:Button ID="btnAdd" runat="server" Text="Button" />
        </div>
    </div>
    <div class="row">
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Username</th>
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
                    </tr>
                    <%} %>
                </tbody>
            </table>
        </div>
    </div>
</asp:Content>
