﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Viva.WebApp.Default.aspx.cs" Inherits="Viva.WebApp.Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <div class="list-group">
                    <a href="Default.aspx" class="list-group-item">All</a>
                    <a href="Default.aspx?NewRelease=1" class="list-group-item">New Release</a>
                    <% foreach (var category in this.Categories)
                        {%>
                    <a href="Default.aspx?categoryId=<%=category.Id%>" class="list-group-item">
                        <%=category.CategoryName %>
                    </a>
                    <%} %>
                </div>
            </div>

            <div class="col-md-9">

                <div class="row carousel-holder">

                    <div class="col-md-12">
                        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                                <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                            </ol>
                            <div class="carousel-inner">
                                <div class="item active">
                                    <img class="slide-image" src="Content/images/banner/banner1.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="Content/images/banner/banner2.jpg" alt="">
                                </div>
                                <div class="item">
                                    <img class="slide-image" src="Content/images/banner/banner3.jpg" alt="">
                                </div>
                            </div>
                            <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                            </a>
                            <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                            </a>
                        </div>
                    </div>

                </div>

                <div class="row">
                    <!--Generate Book Item -->
                    <% foreach (var book in this.Books) %>
                    <%{ %>
                        <div class="col-sm-4 col-lg-4 col-md-4">
                            <div class="thumbnail">
                                <img style="height: 200px; width: 100%; display: block;"
                                    src="<%=book.GetPictureUrl() %>" alt="<%=book.BookName %>">
                                <div class="caption">
                                    <h4 class="pull-right">$<%=book.Price %></h4>
                                    <h4><a href="ProductDetail.aspx?bookid=<%=book.Id %>&categoryid=<%=book.CategoryId %>"><%=book.BookName %></a></h4>
                                    <p><%=book.AuthorName %></p>
                                    <p><%=book.Description %></p>
                                    <%--  --%>
                                        
                                    
                                </div>
                      


                                <div class="ratings">
                                    <p class="pull-right">15 reviews</p>
                                    <p>
                                        <a href="ShoppingCart.aspx?bookid=<%=book.Id %>" >Add To Card</a>
                                    </p>
                                </div>
                            </div>
                        </div>
                    <%} %>
                </div>
                <div class="modal fade" id="LoginModal" tabindex="-1"
                    role="dialog" aria-labelledby="helpModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal">
                                    <span aria-hidden="true">&times;
                                    </span><span class="sr-only">Close</span></button>
                                <h4 class="modal-title" id="myModalLabel">Login</h4>
                            </div>
                            <div class="modal-body">
                                <div class="input-group">
                                    <span class="input-group-addon">@</span>
                                    <input type="text" class="form-control" placeholder="Email" />
                                </div>
                                <p>
                                </p>
                                <div class="input-group">
                                    <span class="input-group-addon">@</span>
                                    <input type="text" class="form-control" placeholder="Password" />
                                </div>
                                <p>
                                </p>
                                <button type="button" class="btn-primary">
                                    Login</button>
                                
                            </div>
                            

                        </div>
                </div>
            </div>
            </div>

        </div>

    </div>
    <!-- /.container -->
</asp:Content>
