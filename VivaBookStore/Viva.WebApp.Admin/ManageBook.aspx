<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageBook.aspx.cs" Inherits="Viva.WebApp.Admin.ManageBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-lg-12">
            <h1 class="page-header">Manage Book
            </h1>
        </div>
    </div>

    <form id="manageBookForm" runat="server" class="form-horizontal">

        <div class="panel panel-default">
            <div class="panel-heading">
                <h3 class="panel-title">Manage Book</h3>
            </div>
            <div class="panel-body">
                <!--Book Name-->
                <div class="form-group">
                    <label class="col-sm-2 control-label">Book Name</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtBookName" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <!--Author Name-->
                <div class="form-group">
                    <label class="col-sm-2 control-label">AuthorName</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtAuthorName" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <!--Description-->
                <div class="form-group">
                    <label class="col-sm-2 control-label">Description</label>
                    <div class="col-sm-10">
                        <textarea id="txtDescription" cols="20" rows="2" clientidmode="Static" class="form-control" runat="server"></textarea>
                    </div>
                </div>
                <!--Price-->
                <div class="form-group">
                    <label class="col-sm-2 control-label">Price</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtPrice" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-2 control-label">Quantity</label>
                    <div class="col-sm-10">
                        <asp:TextBox ID="txtQuantity" ClientIDMode="Static" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <!--ImageUrl-->
                <div class="form-group">
                    <label class="col-sm-2 control-label">Image</label>
                    <div class="col-sm-5">
                        <asp:FileUpload ID="fileUploadImage" ClientIDMode="Static" runat="server" />
                    </div>
                </div>
                <!--Category-->
                <div class="form-group">
                    <label class="col-sm-2 control-label">Category</label>
                    <div class="col-sm-10">
                        <asp:DropDownList ID="ddCategory" class="form-control" ClientIDMode="Static" runat="server"></asp:DropDownList>
                    </div>
                </div>
                <!--Buttons-->
                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <asp:Button ID="btnSave" class="btn btn-primary" runat="server" Text="Create" OnClick="btnSave_Click" />
                        <asp:Button ID="btnCancel" class="btn btn-default" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </div>
                </div>
            </div>
        </div>


    </form>
</asp:Content>
