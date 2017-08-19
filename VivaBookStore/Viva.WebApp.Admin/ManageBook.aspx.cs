using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
using Viva.DAL;
using Viva.DAL.Entities;
using Viva.Service;

namespace Viva.WebApp.Admin
{
    public partial class ManageBook : Common.AdminPage
    {
        protected List<Book> Books = null;
        protected List<Category> Categories = null;

        protected Book CurrentBook = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            // If user haven't login yet, redirect to Login page
            if (HttpContext.Current.Session["currentuser"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!Page.IsPostBack)
            {
                // Get categories to display category name on table
                // and it is also being used in Edit/Add new Mode
                // Therefore, this list should be always avaiable on page
                this.Categories = this.Service.GetAllCategories();

                // get all books to display on table
                this.Books = this.Service.GetAllBooks();

                // Get bookid on query string
                var queryBookId = Request.QueryString["bookId"];
                var bookId = 0;
                var isIDValid = Int32.TryParse(queryBookId, out bookId);
                if (isIDValid)
                {
                    // IF bookId > 0, get book from database.
                    if (bookId > 0)
                    {
                        this.CurrentBook = this.Service.GetBookByID(bookId, true);
                        this.Status = PageStatus.Edit;
                    }
                    else
                    // ELSE: Init new book object
                    {
                        this.CurrentBook = new Book()
                        {
                            Id = 0,
                            NewRelease = true,
                            CategoryId = 1
                        };
                        this.Status = PageStatus.Add;
                    }
                    this.InitFormData();
                }
            }            
        }

        /// <summary>
        /// Assign current book values to controls on web page
        /// </summary>
        private void InitFormData()
        {
            // Need Hidden-Field to keep bookid at client
            this.hfBookId.Value = this.CurrentBook.Id.ToString();

            txtBookName.Text = this.CurrentBook.BookName;
            txtAuthorName.Text = this.CurrentBook.AuthorName;
            txtPublisher.Text = this.CurrentBook.Publisher;
            txtPublishedYear.Text = this.CurrentBook.PublishedYear;
            txtDescription.Value = this.CurrentBook.Description;
            txtPrice.Text = this.CurrentBook.Price.ToString();
            txtQuantity.Text = this.CurrentBook.QuantityInUnit.ToString();
            chkNewRelease.Checked = this.CurrentBook.NewRelease;

            // Generate category dropdown list
            this.ddCategory.DataSource = this.Categories;
            this.ddCategory.DataTextField = "CategoryName";
            this.ddCategory.DataValueField = "Id";
            this.ddCategory.DataBind();

            // Assign category Id to dropdown
            this.ddCategory.SelectedValue = this.CurrentBook.CategoryId.ToString();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var bookId = Convert.ToInt32(this.hfBookId.Value);
            // IF bookId > 0, get book from Database
            // ELSE, init new Book object
            var book = bookId > 0
                ? this.Service.GetBookByID(bookId)
                : new Book();

            book.NewRelease = chkNewRelease.Checked;
            book.BookName = txtBookName.Text;
            book.AuthorName = txtAuthorName.Text;
            book.Publisher = txtPublisher.Text;
            book.PublishedYear = txtPublishedYear.Text;
            book.CategoryId = Convert.ToInt32(ddCategory.SelectedValue);
            book.Description = txtDescription.Value;
            book.Price = Convert.ToDecimal(txtPrice.Text);
            book.QuantityInUnit = Convert.ToInt32(txtQuantity.Text);
            book.Rate = 1;
            book.BookName = txtBookName.Text;

            if (fileUploadImage.HasFile)
            {
                // PictureId is only available in Edit Mode, so have to delete before switch to new picture
                if (book.PictureId > 0)
                {
                    // delete old picture
                    this.Service.DeletePictureById(book.PictureId);
                }
                
                var pic = new Picture()
                {
                    PictureBinary = fileUploadImage.FileBytes
                };
                // add new picture to database
                this.Service.InsertPicture(pic);

                // specify new pictureid to book 
                book.PictureId = pic.Id;
            }

            this.Service.SaveBook(book);
            // Reload Page to see updates on book table
            Response.Redirect("ManageBook.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var bookId = Convert.ToInt32(this.hfBookId.Value);
            if (bookId > 0)
            {
                this.Service.DeleteBook(bookId);
            }
            // Reload Page to see updates on book table
            Response.Redirect("ManageBook.aspx");
        }
       
    }
}