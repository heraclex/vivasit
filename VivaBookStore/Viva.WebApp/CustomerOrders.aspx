<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerOrders.aspx.cs" Inherits="Viva.WebApp.CustomerOrders" %>

<%--http://www.c-sharpcorner.com/UploadFile/7eb164/gridview-control-in-Asp-Net/--%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-xs-12">
            <div class="form-horizontal">
                <div class="form-group">
                    <label class="col-sm-5 control-label">Customer Name: </label>
                    <div class="col-sm-7">
                        <p class="form-control-static"><%=this.CurrentCustomer.FirstName + " " + this.CurrentCustomer.LastName %></p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-5 control-label">Email: </label>
                    <div class="col-sm-7">
                        <p class="form-control-static"><%=this.CurrentCustomer.EmailAddress %></p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-5 control-label">Address: </label>
                    <div class="col-sm-7">
                        <p class="form-control-static"><%=this.CurrentCustomer.Address %></p>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-5 control-label">PhoneNumber: </label>
                    <div class="col-sm-7">
                        <p class="form-control-static"><%=this.CurrentCustomer.PhoneNumber %></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <form runat="server">
        <asp:GridView ID="GridViewCustomerOrders" runat="server" CssClass="table table-bordered table-hover"
            AutoGenerateColumns="false" ShowFooter="true">
            <Columns>
                <asp:TemplateField HeaderText="ID">
                    <ItemTemplate>
                        <asp:Label ID="lblID" runat="server" Text='<%#Eval("Id")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="CreatedDate">
                    <ItemTemplate>
                        <asp:Label ID="lblCreatedDate" runat="server" Text='<%#Eval("CreatedDate")%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Order Status">
                    <ItemTemplate>
                        <asp:Label ID="lblOrderStatus" runat="server" Text='<%#this.GetOrderStatus(Eval("OrderStatusId").ToString())%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Payment Status">
                    <ItemTemplate>
                        <asp:Label ID="lblPaymentStatus" runat="server" Text='<%#this.GetPaymentStatus(Eval("PaymentStatusId").ToString())%>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Detail">
                    <ItemTemplate>
                        <a class="btn btn-primary btn-xs" href="CustomerOrders.aspx?viewdetailorderId=<%#Eval("Id") %>">Detail</a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <%if (this.SelectedOrder != null)
            {%>
        <div class="panel panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title">Order (ID:<%=this.SelectedOrder.Id %>) Detail</h3>
            </div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-xs-12">
                        <table class="table table-bordered table-hover table-condensed">
                            <thead>
                                <tr>
                                    <th style="width: 50%">Boock Name</th>
                                    <th style="width: 20%">Price</th>
                                    <th style="width: 20%">Quantity</th>
                                    <th style="width: 10%" class="text-center">Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% foreach (var orderItem in this.SelectedOrder.OrderItems)
                                    {
                                %>
                                <tr>
                                    <td><%=orderItem.Book.BookName %></td>
                                    <td>$ <%=orderItem.Book.Price %></td>
                                    <td><%=orderItem.Quantity %></td>
                                    <td class="text-center">$ <%=orderItem.Quantity * orderItem.Book.Price%></td>
                                </tr>
                                <%} %>
                            </tbody>
                            <tfoot>
                                <tr style="font-size: 20px;">
                                    <td colspan="3" class="text-right">Total</td>
                                    <td colspan="1" class="text-center">
                                        <p><span class="label label-success">$ <%=this.SelectedOrder.TotalPrice %></span></p>
                                    </td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
            <%--<div class="panel-footer">Panel footer</div>--%>
        </div>

        <%} %>
    </form>
</asp:Content>
