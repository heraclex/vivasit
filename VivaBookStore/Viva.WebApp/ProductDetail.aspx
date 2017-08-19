<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="Viva.WebApp.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <%--<img style="height: 200px; width: 100%; display: block;"
                                    src="<%=this.GetPictureUrlFromBytes(book.Picture.PictureBinary) %>" alt="">--%>
                <img class="img-responsive" src="<%=this.GetPictureUrlFromBytes(book.Picture.PictureBinary) %>" alt="">              
            </div>

            <div class="col-md-8">
                <h3><%=book.BookName %></h3>
                <h4>$ <%=book.Price %></h4> <h4><a href="ShoppingCart.aspx?bookid=<%=book.Id %>">Add to Cart</a></h4>
                 <div class="row">
                     <div class="form-group">
                         <div class="col-sm-2">Author:</div>
                         <div class="col-sm-4"><%=book.AuthorName %></div>
                     </div><br />

                     <div class="form-group">
                         <div class="col-sm-2">Description:</div>
                         <div class="col-sm-10"><%=book.Description %></div>
                     </div><br />
                     <div class="form-group">
                         <div class="col-sm-2">In STock: </div>
                         <div class="col-sm-10"><%=book.QuantityInUnit %></div>
                     </div><br />
                     <div class="form-group">
                         <div class="col-sm-2">Publisher: </div>
                         <div class="col-sm-10"><%=book.Publisher %></div>
                     </div><br />
                     <div class="form-group">
                         <div class="col-sm-2">Published Year:</div>
                         <div class="col-sm-10"><%=book.PublishedYear%></div>
                     </div><br />
                </div>                
                
            </div>

        </div>
        </div>

        <!-- /.row -->           
                
              
               
            
        <!-- Related Projects Row -->
        <div class="row">
            
            <div class="col-lg-12">
                <h3 class="page-header">Related Projects</h3>
            </div>
            <% foreach (var Relatedbook in this.RelatedBooks) %>
                    <%{ %>
            <div class="col-sm-3">
                <a href="ProductDetail.aspx?bookid=<%=Relatedbook.Id %>&categoryid=<%=Relatedbook.CategoryId %>">
                    <img class="img-responsive portfolio-item" src="<%=this.GetPictureUrlFromBytes(Relatedbook.Picture.PictureBinary) %>" alt="<%=Relatedbook.BookName %>">
                </a>
            </div>
           
            <%} %>
        </div>
        <!-- /.row -->
</asp:Content>
