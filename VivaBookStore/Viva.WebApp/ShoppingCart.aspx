<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ShoppingCart.aspx.cs" Inherits="Viva.WebApp.ShoppingCart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <table id="cart" class="table table-hover table-condensed">
        <thead>
            <tr>
                <th style="width: 50%">Product</th>
                <th style="width: 10%">Instock</th>
                <th style="width: 10%">Price</th>
                <th style="width: 8%">Quantity</th>
                <th style="width: 12%" class="text-center">Subtotal</th>
                <th style="width: 10%"></th>
            </tr>
        </thead>
        <tbody>
            <% foreach (var orderItem in this.CurrentOrder.OrderItems) %>
            <%{ %>
            <%var bookDetail = this.service.GetBookByID(orderItem.BookId); %>
            <tr>
                <td data-th="Product">
                    <div class="row">
                        <div class="col-sm-10">
                            <h4 class="nomargin"><%=bookDetail.BookName %></h4>
                        </div>
                    </div>
                </td>
                <td data-th="InSTock"><%=bookDetail.QuantityInUnit %></td>
                <td data-th="Price">$ <%=bookDetail.Price %></td>
                <td data-th="Quantity">
                    <input id="txtQuantity" type="number" class="form-control text-center" 
                        value="<%=orderItem.Quantity %>" />
                </td>
                <td data-th="Subtotal" class="text-center">1.99</td>
                <td class="actions" data-th="">
                    <button class="btn btn-info btn-sm"><i class="fa fa-refresh"></i></button>
                    <button class="btn btn-danger btn-sm"><i class="fa fa-trash-o"></i></button>
                </td>
            </tr>
            <%} %>
        </tbody>
        <tfoot>
            <tr class="visible-xs">
                <td class="text-center"><strong>Total $<%=this.CurrentOrder.TotalPrice %></strong></td>
            </tr>
            <tr>
                <td><a href="#" class="btn btn-warning"><i class="fa fa-angle-left"></i>Continue Shopping</a></td>
                <td colspan="2" class="hidden-xs"></td>
                <td class="hidden-xs text-center"><strong>Total $1.99</strong></td>
                <td><a href="#" class="btn btn-success btn-block">Checkout <i class="fa fa-angle-right"></i></a></td>
            </tr>
        </tfoot>
    </table>
</asp:Content>
