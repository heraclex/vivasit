using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using Viva.DAL.Entities;
using Viva.Service;

namespace Viva.WebApp
{
    public partial class Default : Page
    {
        protected List<Category> Categories = null;
        private readonly BookStoreService service = new BookStoreService();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Categories = this.service.GetAllCategories();
        }
    }
}