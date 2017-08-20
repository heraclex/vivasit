<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="Viva.WebApp.Search" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <form class="form-horizontal" runat="server">
                    <div class="form-group">
                        Keyword
                        <br />
                        <div>
                            <asp:TextBox ID="txtKeyword" class="form-control" placeholder="title/author/description" runat="server"></asp:TextBox>
                        </div>
                        <br />

                        Price range
                        <br />
                        <div class="row">
                            <div class="col-md-6">
                                <label>From</label>
                                <asp:DropDownList CssClass="form-control" ID="fromPrice" runat="server">
                                    <asp:ListItem Value="0">0</asp:ListItem>
                                    <asp:ListItem Value="20">$20</asp:ListItem>
                                    <asp:ListItem Value="40">$40</asp:ListItem>
                                    <asp:ListItem Value="60">$60</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-6">
                                <label>To</label>
                                <asp:DropDownList CssClass="form-control" ID="toPrice" runat="server">
                                    <asp:ListItem Value="20">$20</asp:ListItem>
                                    <asp:ListItem Value="40">$40</asp:ListItem>
                                    <asp:ListItem Value="60">$60</asp:ListItem>
                                    <asp:ListItem Value="80">$80</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <br />
                        Published Year
                    <br />
                        <div>
                            <asp:TextBox ID="txtPublishedYear" class="form-control" placeholder="Ex: 2017" runat="server"></asp:TextBox>
                        </div>
                        <br />
                        <br />
                        <div class="form-group">
                            <div>
                                <asp:Button ID="btnSearch" CssClass="btn btn-primary" runat="server" Text="Search" OnClick="btnSearch_Click" />
                            </div>
                        </div>

                    </div>

                </form>
            </div>

            <div class="col-md-9">
                <div class="row">
                    <div class="col-md-12">
                        <h3>
                            <strong>
                                <asp:Label ID="lblSearchNotice" runat="server" Text=""></asp:Label>
                            </strong>
                        </h3>
                    </div>
                </div>
                <div class="row">
                    <!--Generate Book Item -->
                    <% foreach (var book in this.Books) %>
                    <%{ %>
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img class="img-thumbnail book-cover"
                                src="<%=book.GetPictureUrl() %>" alt="<%=book.BookName %>">
                            <div class="caption">
                                <h4 class="pull-right">$<%=book.Price %></h4>
                                <h4><a href="ProductDetail.aspx?bookid=<%=book.Id %>"><%=book.BookName %></a></h4>
                                <p><%=book.AuthorName%></p>
                                <p><%=book.Description %></p>
                            </div>
                            <div class="ratings">
                                <p class="pull-right">15 reviews</p>
                                <p>
                                    <a href="ShoppingCart.aspx?bookid=<%=book.Id %>">Add To Card</a>
                                </p>
                            </div>
                        </div>
                    </div>
                    <%} %>
                </div>
            </div>

        </div>

    </div>
</asp:Content>
