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
            this.Books = this.service.GetAllBooks();
            /*
             * Image1.Visible = id != "0";
                if (id != "0")
                {
                    byte[] bytes = (byte[])GetData("SELECT Data FROM tblFiles WHERE Id =" + id).Rows[0]["Data"];
                    string base64String = Convert.ToBase64String(bytes, 0, bytes.Length);
                    Image1.ImageUrl = "data:image/png;base64," + base64String;
                }
             */
        }
    }
}