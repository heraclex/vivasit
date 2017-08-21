<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductDetail.aspx.cs" Inherits="Viva.WebApp.ProductDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Page Content -->
    <div class="container">
        <div class="row">
            <div class="col-md-4">
                <%--<img style="height: 200px; width: 100%; display: block;"
                                    src="<%=this.GetPictureUrlFromBytes(book.Picture.PictureBinary) %>" alt="">--%>
                <img class="img-responsive" style="max-height:400px;max-width:200px" src="<%=this.GetPictureUrlFromBytes(book.Picture.PictureBinary) %>" alt="">              
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
                         <div class="col-sm-2">In stock: </div>
                         <div class="col-sm-10"><%=book.QuantityInUnit %></div>
                     </div><br />
                     <div class="form-group">
                         <div class="col-sm-2">Publisher: </div>
                         <div class="col-sm-10"><%=book.Publisher %></div>
                     </div><br />
                     <div class="form-group">
                         <div class="col-sm-2">Published Year:</div>
                         <div class="col-sm-10"><%=book.PublishedYear%></div>
                     </div>
                </div>                
                
                <div class="row"></div>
                <%--List recommendation--%>
                <div class="row">
                    <%if (HttpContext.Current.Session["currentuser"] != null)
                        {  %>
                    <form runat="server">
                        <div class="form-group">
                            <div class="col-sm-2">Your comment</div>
                            <div class="col-sm-10">
                                <asp:TextBox ID="txtComment" class="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>                                
                            </div>
                        </div>


                        <div class="form-group">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtComment" ForeColor="#CC0000"></asp:RequiredFieldValidator>                         
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">                                
                                <asp:Button ID="btnSend" class="btn btn-primary" runat="server" Text="Send" OnClick="btnSend_Click" />
                            </div>
                        </div>
                         <div class="form-group">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-10">                                
                                <asp:Label ID="lblnotice" runat="server" Text="" ForeColor="#3366FF"></asp:Label> 
                            </div>
                        </div>
                    </form>
                    <%}    else    { %>
                    <div class="form-group">
                            <div class="col-sm-6">
                                <h5>Please log in to give the feedback. </h5></div>
                            </div>
                    
                    <%} %>
                </div>

            </div>
           
    
        </div>
         <br /><br />
        <div class="row">
        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead>
                    <tr>
                        <th>Date Time</th>
                        <th>User name</th>
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
        </div>

        <!-- /.row -->           
                
              
               
            
        
</asp:Content>
