using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using Viva.DAL;
using Viva.DAL.Entities;
using Viva.Service;

namespace Viva.WebApp
{
    public partial class Default : Page
    {
        protected List<Category> Categories = null;

        protected List<Book> Books = null;
       

        private readonly BookStoreService service = new BookStoreService();
        protected void Page_Load(object sender, EventArgs e)
        {
            var categoryIdFromQueryString = Request.QueryString["categoryId"];
            var NewRelease = Request.QueryString["NewRelease"];
            // Filter By CategoryId
            this.Categories = this.service.GetAllCategories();

            if (string.IsNullOrEmpty(categoryIdFromQueryString))
            {
                if (NewRelease == null)
                {
                    this.Books = this.service.GetAllBooks(true);
                }
                else { this.Books = this.service.GetListBooksNewRelease(true); }

            }
            else
            {
                var categoryId = 0;
                var isConvertToIntSuccess = Int32.TryParse(categoryIdFromQueryString, out categoryId);
                if (isConvertToIntSuccess && categoryId > 0)
                {
                    this.Books = this.service.GetListBooksByCatogery(categoryId, true);
                }
            }
        }


        protected int GetReviewsByBookId(int bookId)
        {
            return this.service.GetReviewsByBookId(bookId);
        }
    }
}