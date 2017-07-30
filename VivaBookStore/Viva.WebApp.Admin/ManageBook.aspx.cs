﻿using System;
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
            this.GenerateCategoryDropDown();
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
                newBook.BookName = txtBookName.Text;
                newBook.AuthorName = txtAuthorName.Text;
                newBook.CategoryId = Convert.ToInt32(ddCategory.SelectedValue);
                newBook.Description = txtDescription.Value;
                // assign picture to this new book
                newBook.PictureId = pic.Id;
                newBook.Price = Convert.ToDecimal(txtPrice.Text);
                newBook.Rate = 1;
                newBook.BookName = txtBookName.Text;

                // add new book to databaes
                this.Service.InsertBook(newBook);
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