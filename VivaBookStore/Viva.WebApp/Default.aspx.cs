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
            this.Categories = this.service.GetAllCategories();
            this.Books = this.service.GetAllBooks(true);
        }

        protected string GetPictureUrlFromBytes(byte[] pictureBinary)
        {
            string base64String = Convert.ToBase64String(pictureBinary, 0, pictureBinary.Length);
            return "data:image/png;base64," + base64String;
        }
    }
}