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
                        <div>
                            <asp:DropDownList CssClass="form-control" ID="dropPrice" runat="server">
                                <asp:ListItem>All</asp:ListItem>
                                <asp:ListItem>Under $20</asp:ListItem>
                                <asp:ListItem>$20 to $40</asp:ListItem>
                                <asp:ListItem>$40+</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                         <br />
                    Published Year
                    <br />
                    <div>
                        <asp:TextBox ID="txtPublishedYear" class="form-control" placeholder="Ex: 2017" runat="server"></asp:TextBox>
                    </div> <br /> <br />
                    <div class="form-group">
                        <div>
                            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                        </div>
                    </div>

                    </div>
                   
                </form>
            </div>

            <div class="col-md-9">
                <div class="row">
                   <h3> <strong><asp:Label ID="lblSearchNotice" runat="server" Text=""></asp:Label></strong>  </h3>
                </div>
                <div class="row">
                    <!--Generate Book Item -->
                    <% foreach (var book in this.Books) %>
                    <%{ %>
                        <div class="col-sm-4 col-lg-4 col-md-4">
                            <div class="thumbnail">
                                <img style="height: 200px; width: 100%; display: block;"
                                    src="<%=this.GetPictureUrlFromBytes(book.Picture.PictureBinary) %>" alt="<%=book.BookName %>">
                                <div class="caption">
                                    <h4 class="pull-right">$<%=book.Price %></h4>
                                    <h4><a href="ProductDetail.aspx?bookid=<%=book.Id %>"><%=book.BookName %></a></h4>
                                    <p><%=book.Description %></p>
                                    <%--  --%>
                                        
                                    
                                </div>
                      


                                <div class="ratings">
                                    <p class="pull-right">15 reviews</p>
                                    <p>
                                        <a href="ProductDetail.aspx?bookid=<%=book.Id %>" >Add To Card</a>
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
</asp:Content>
