<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageOrder.aspx.cs" Inherits="Viva.WebApp.Admin.ManageOrder" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <form runat="server">
        <!--Page Header-->
        <div class="row">
            <div class="col-md-12">
                <h1 class="page-header">Manage Order
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
                            <div class="form-group">
                                <label>Filter by Customer</label>
                                <asp:DropDownList ID="ddCustomer" class="form-control" ClientIDMode="Static" runat="server" OnSelectedIndexChanged="ddCustomer_SelectedIndexChanged" AutoPostBack="true">
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                    <div class="panel-body">

                        <div class="table-responsive">
                            <table id="customer-table" class="table table-bordered table-hover">
                                <thead>
                                    <tr>
                                        <th>Order Id</th>
                                        <th>Created Date</th>
                                        <th>Customer Name</th>                                        
                                        <th>Total</th>
                                        <th>Order Status</th>
                                        <th>Detail</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%foreach (var order in this.Orders) %>
                                    <%{ %>
                                    <tr>
                                        <td><%=order.Id %></td>
                                        <td><%=order.CreatedDate %></td>
                                        <td><%=order.Customer.FirstName + " " + order.Customer.LastName%></td>
                                        <td>$<%=order.TotalPrice%></td>
                                        <td><%=this.GetOrderStatus(order.OrderStatusId) %></td>
                                        <td>
                                            <a class="btn btn-success btn-xs" href="ManageOrder.aspx?orderid=<%=order.Id %>">
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
            </div>
            <!--End Table-->

            <%if (this.Status != PageStatus.Default && this.CurrentOrder != null)
                {%>
            <!-- Add/Edit Form -->
            <div class="col-md-5">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">Order Detail</h3>
                    </div>
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-md-12">
                                <asp:HiddenField ID="hfOrderId" runat="server" />
                                <div class="panel panel-primary">
                                    <div class="panel-heading">
                                        <h3 class="panel-title">The detail of Order <%=this.CurrentOrder.Id %></h3>
                                    </div>
                                    <div class="panel-body">
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
                                                                <p><span class="label label-success">$ <%=this.CurrentOrder.TotalPrice%></span></p>
                                                            </td>
                                                        </tr>
                                                    </tfoot>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!--Dropdown status-->
                                    <div class="form-group">
                                        <label>Status</label>
                                        <asp:DropDownList ID="ddStatus" class="form-control" ClientIDMode="Static" runat="server">
                                            <asp:ListItem Value="50">Deliveried</asp:ListItem>
                                            <asp:ListItem Value="30">Completed</asp:ListItem>
                                        </asp:DropDownList>
                                    </div>


                                </div>
                                <!--Buttons-->
                                <div class="form-group">
                                    <div class="col-md-8" style="text-align: left;">
                                        <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Change Status" OnClick="btnSave_Click" />
                                        <a class="btn btn-default" href="ManageOrder.aspx">Cancel</a>
                                    </div>


                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--End Form-->
        <%} %>
    </form>
</asp:Content>
