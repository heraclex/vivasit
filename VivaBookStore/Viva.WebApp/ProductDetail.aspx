<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="Viva.WebApp.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <div class="col-md-4">
                <img class="img-responsive" src="http://placehold.it/750x500" alt="">
               
            </div>

            <div class="col-md-8">
                <h3><%=book.BookName %></h3>
                <h3><%=book.AuthorName %></h3>
                <p><%=book.Description %></p>
                <h3><%=book.Price %></h3>
                <h3><%=book.QuantityInUnit %></h3>
                <h5><a href="ShoppingCart.aspx?bookid=<%=book.Id %>">Add to Cart</a></h5>
            </div>

        </div>
        </div>

        <!-- /.row -->           
                
              
               
            
        <!-- Related Projects Row -->
        <div class="row">

            <div class="col-lg-12">
                <h3 class="page-header">Related Projects</h3>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
                </a>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
                </a>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
                </a>
            </div>

            <div class="col-sm-3 col-xs-6">
                <a href="#">
                    <img class="img-responsive portfolio-item" src="http://placehold.it/500x300" alt="">
                </a>
            </div>

        </div>
        <!-- /.row -->
</asp:Content>
