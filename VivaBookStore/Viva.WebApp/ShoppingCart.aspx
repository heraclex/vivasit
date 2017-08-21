<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="Viva.WebApp.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <form id="OrderDetailForm" runat="server">
        <input type="hidden" name="orderId" value="<%=this.CurrentOrder.Id %>" />
        <table id="cart" class="table table-hover table-condensed">
            <thead>
                <tr>
                    <th style="width: 50%">Book Name</th>
                    <th style="width: 10%">In stock</th>
                    <th style="width: 10%">Price</th>
                    <th style="width: 8%">Quantity</th>
                    <th style="width: 12%" class="text-center">Subtotal</th>
                    <th style="width: 10%">Remove</th>
                </tr>
            </thead>
            <tbody>
                <% foreach (var orderItem in this.CurrentOrder.OrderItems)
                    {
                %>
                <tr>
                    <td data-th="Product">
                        <div class="row">
                            <div class="col-sm-10">
                                <h4 class="nomargin"><%=orderItem.Book.BookName %></h4>
                            </div>
                        </div>
                    </td>
                    <td data-th="InSTock"><%=orderItem.Book.QuantityInUnit %></td>
                    <td data-th="Price">$ <%=orderItem.Book.Price %></td>
                    <td data-th="Quantity">
                        <input id="txtQuantity" name="quantityOrderItem_<%=orderItem.Id %>"
                            min="1" max="<%=orderItem.Book.QuantityInUnit %>"
                            type="number"
                            class="form-control text-center"
                            value="<%=orderItem.Quantity %>" />
                    </td>
                    <td data-th="Subtotal" class="text-center">$ <%=orderItem.Quantity * orderItem.Book.Price%></td>
                    <td class="actions" data-th="<%=orderItem.Id %>">
                        <input name="deleteOrderItem_<%=orderItem.Id %>" type="checkbox" class="form-control text-center" />
                    </td>
                </tr>
                <%} %>
            </tbody>
            <tfoot>
                <tr style="font-size: 30px;">
                    <td colspan="4" class="text-right">Total</td>
                    <td colspan="1" class="text-center">
                        <p><span class="label label-success">$ <%=this.CurrentOrder.TotalPrice %></span></p>
                    </td>
                    <td colspan="1" class="text-right"></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <a href="Default.aspx" class="btn btn-primary">
                            <i class="fa fa-angle-left"></i>Continue Shopping
                        </a>
                    </td>
                    <td colspan="2">
                        <asp:Button ID="btnUpdateCartDetail" class="btn btn-primary" runat="server" Text="Update" OnClick="btnUpdateCartDetail_Click" />
                    </td>
                    <td colspan="2">
                        <!-- Button trigger modal -->
                        <button type="button" class="btn btn-warning btn-block" data-toggle="modal" data-target="#myOrderModal">
                            Checkout
                        </button>
                    </td>
                </tr>
            </tfoot>
        </table>

        <!-- Modal -->
        <div class="modal fade" id="myOrderModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">Order Detail</h4>
                    </div>
                    <div class="modal-body">
                        <!--Customer Form Infor-->
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
                                        <label class="col-sm-5 control-label">Phone Number: </label>
                                        <div class="col-sm-7">
                                            <p class="form-control-static"><%=this.CurrentCustomer.PhoneNumber %></p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <table class="table table-bordered table-hover table-condensed">
                                    <thead>
                                        <tr>
                                            <th style="width: 50%">Book Name</th>
                                            <th style="width: 20%">Price</th>
                                            <th style="width: 20%">Quantity</th>
                                            <th style="width: 10%" class="text-center">Subtotal</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% foreach (var orderItem in this.CurrentOrder.OrderItems)
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
                                                <p><span class="label label-success">$ <%=this.CurrentOrder.TotalPrice %></span></p>
                                            </td>
                                        </tr>
                                         <tr style="font-size: 10px;">
                                            <td colspan="4" class="text-right">The price is included 15% GST</td>
                                            
                                        </tr>
                                    </tfoot>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <asp:Button ID="btnSubmitOrder" class="btn btn-primary" runat="server" Text="Submit Order" OnClick="btnSubmitOrder_Click" />
                    </div>
                </div>
            </div>
        </div>
    </form>
</asp:Content>

