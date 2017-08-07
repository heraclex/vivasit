using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Viva.DAL;
using Viva.DAL.Entities;

namespace Viva.WebApp.Admin
{
    public partial class ManageBook : Common.AdminPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                this.GenerateCategoryDropDown();
            }
        }

        private void GenerateCategoryDropDown()
        {
            this.ddCategory.DataSource = this.Service.GetAllCategories();
            this.ddCategory.DataTextField = "CategoryName";
            this.ddCategory.DataValueField = "Id";
            this.ddCategory.DataBind();
        }
        
        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (fileUploadImage.HasFile)
            {
                string strname = fileUploadImage.FileName.ToString();
                var pic = new Picture()
                {
                    PictureBinary = fileUploadImage.FileBytes
                };

                // Save Picture to Database
                this.Service.InsertPicture(pic);

                var newBook = new Book();

                newBook.NewRelease = chkNewRelease.Checked;

                newBook.BookName = txtBookName.Text;
                newBook.AuthorName = txtAuthorName.Text;
                newBook.Publisher = txtPublisher.Text;
                newBook.PublishedYear = txtPublishedYear.Text;
                newBook.CategoryId = Convert.ToInt32(ddCategory.SelectedValue);
                newBook.Description = txtDescription.Value;
                // assign picture to this new book
                newBook.PictureId = pic.Id;
                newBook.Price = Convert.ToDecimal(txtPrice.Text);
                newBook.QuantityInUnit = Convert.ToInt32(txtQuantity.Text);
                newBook.Rate = 1;
                newBook.BookName = txtBookName.Text;

                // add new book to databaes
                this.Service.InsertBook(newBook);
                txtBookName.Text ="";
                txtAuthorName.Text = "";
                txtPublisher.Text = "";
                txtPublishedYear.Text = "";
                txtDescription.Value = "";
                txtPrice.Text = "";
                txtQuantity.Text = "";
                chkNewRelease.Checked = true;
                lblMessage.Text = "Add new book successfully";
            }            
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            txtBookName.Text = string.Empty;
            txtAuthorName.Text = string.Empty;
            txtDescription.Value = string.Empty;
            txtPrice.Text = string.Empty;
        }
    }
}