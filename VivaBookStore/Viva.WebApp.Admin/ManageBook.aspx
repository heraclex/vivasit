<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageBook.aspx.cs" Inherits="Viva.WebApp.Admin.ManageBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <!--Page Header-->
    <div class="row">
        <div class="col-md-12">
            <h1 class="page-header">Manage Book
            </h1>
        </div>
    </div>

    <!--Page Content-->
    <div class="row">

        <% var leftPanelCssClass = this.Status == PageStatus.Default ? "col-md-12" : "col-md-7"; %>

        <!--Book Table -->
        <div class="<%=leftPanelCssClass %>">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <div class="row">
                        <div class="col-md-3 pull-right">
                            <!--Add button: bookid = 0 when adding new book-->
                            <a class="btn btn-primary pull-right" href="ManageBook.aspx?bookid=0">Add</a>
                        </div>
                    </div>
                </div>
                <div class="panel-body">
                    <div class="table-responsive">
                        <table id="book-table" class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Book Name</th>
                                    <th>Author Name</th>
                                    <th>Price</th>
                                    <th>In stock</th>
                                    <th>Category</th>
                                    <th>New Release</th>
                                    <th>Edit</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%foreach (var book in this.Books.OrderByDescending(x => x.Id)) %>
                                <%{ %>
                                <tr>
                                    <td><%=book.Id %></td>
                                    <td><%=book.BookName %></td>
                                    <td><%=book.AuthorName %></td>
                                    <td>$<%=book.Price %></td>
                                    <td><%=book.QuantityInUnit %></td>
                                    <td><%=this.Categories.First(x=>x.Id == book.CategoryId).CategoryName %></td>
                                    <td>
                                        <input type="checkbox" disabled <%if (book.NewRelease){%> checked <%} %> /></td>
                                    <td>
                                        <a class="btn btn-success btn-xs" href="ManageBook.aspx?bookid=<%=book.Id %>">
                                            <i class="fa fa-pencil" aria-hidden="true"></i>
                                        </a>
                                    </td>
                                </tr>
                                <%} %>
                            </tbody>
                        </table>
                       
                        <script type="text/javascript">
                            $(document).ready(function () {
                              //paging  
                                $('#book-table').DataTable();
                            });
                        </script>
                    </div>
                </div>
            </div>
        </div>

        <%if (this.Status != PageStatus.Default && this.CurrentBook != null)
            {%>
        <!-- Add/Edit Form -->
        <div class="col-md-5">
            <div class="panel panel-default">
                <div class="panel-heading">
                    <h3 class="panel-title">Manage Book</h3>
                </div>
                <div class="panel-body">
                    <div class="row">
                        <div class="col-md-12">
                            <form runat="server">
                                <asp:HiddenField ID="hfBookId" runat="server" />
                                <!--Book Name-->
                                <div class="form-group">
                                    <label>Book Name</label> <asp:Label ID="Label1" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtBookName" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                 <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequirefieldEmail" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtBookName" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                                </div>
                                <!--Author Name-->
                                <div class="form-group">
                                    <label>Author Name</label><asp:Label ID="Label2" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtAuthorName" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtAuthorName" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                                </div>
                                <!--Description-->
                                <div class="form-group">
                                    <label>Description</label><asp:Label ID="Label3" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <textarea id="txtDescription" rows="4" clientidmode="Static" class="form-control" runat="server"></textarea>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtDescription" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                                </div>
                                <!--Price-->
                                <div class="form-group">
                                    <label>Price</label><asp:Label ID="Label4" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtPrice" ClientIDMode="Static" class="form-control"  runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtPrice" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                                </div>
                                <!--Quantity-->
                                <div class="form-group">
                                    <label>Quantity</label><asp:Label ID="Label5" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtQuantity" ClientIDMode="Static" class="form-control" TextMode="Number" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtQuantity" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                                </div>
                                <!--New Release-->
                                <div class="form-group">
                                    <label>
                                        <asp:CheckBox ID="chkNewRelease" runat="server" Checked="True" />
                                        New Release
                                    </label>
                                </div>
                               
                                <!--Publisher-->
                                <div class="form-group">
                                    <label>Publisher</label><asp:Label ID="Label6" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtPublisher" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtPublisher" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                                </div>
                                <!--Published Year-->
                                <div class="form-group">
                                    <label>Published Year</label><asp:Label ID="Label7" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:TextBox ID="txtPublishedYear" TextMode="Number" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" class="control-label" runat="server" ErrorMessage="Required field!" ControlToValidate="txtPublishedYear" ForeColor="#CC0000" ></asp:RequiredFieldValidator>
                                </div>
                                <!--ImageUrl-->
                                <div class="form-group">
                                    <label>Image</label><asp:Label ID="Label8" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <!--Generate image in Edit Mode-->
                                    <% var imgLabel = "";
                                        if (this.CurrentBook.Id > 0 && this.CurrentBook.Picture != null)
                                        {
                                            imgLabel = "Chose another image";
                                    %>
                                    <img class="img-thumbnail" style="max-width: 100px;" src="<%=this.CurrentBook.GetPictureUrl() %>" alt="<%=this.CurrentBook.BookName %>"><br>
                                    <%} %>

                                    <label><%=imgLabel %></label>
                                    <asp:FileUpload ID="fileUploadImage" ClientIDMode="Static" runat="server" />
                                </div>
                               

                                <!--Category-->
                                <div class="form-group">
                                    <label>Category</label><asp:Label ID="Label9" runat="server" Text="*" ForeColor="Red"></asp:Label>
                                    <asp:DropDownList ID="ddCategory" class="form-control" ClientIDMode="Static" runat="server"></asp:DropDownList>
                                </div>
                                <!--Buttons-->
                                <div class="form-group">
                                    <div class="col-md-8" style="text-align: left;">
                                        <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Save" OnClick="btnSave_Click" />
                                        <a class="btn btn-default" href="ManageBook.aspx">Cancel</a>
                                    </div>
                                    <% // only diplay delete button in Edit Mode
                                        if (this.CurrentBook.Id > 0)
                                        {%>
                                    <div class="col-md-4">
                                        <asp:Button ID="btnDelete" class="btn btn-danger" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                                    </div>
                                    <%} %>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%} %>
    </div>
</asp:Content>

