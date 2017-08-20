using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;
using Viva.DAL.Entities;
using Viva.Service;

namespace Viva.WebApp
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        private readonly BookStoreService service = new BookStoreService();
        protected Book book = null;
        protected List<Book> RelatedBooks = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            var bookidString = Request.QueryString["bookid"];
            var categoryString = Request.QueryString["categoryid"];
            if (bookidString != null && categoryString != null)
            {
                var bookid = 0; var categoryid = 0;
                var isConvertToIntSuccess = Int32.TryParse(bookidString, out bookid);
                var isConvertCategory= Int32.TryParse(bookidString, out categoryid);
                if (isConvertToIntSuccess == true && bookid > 0)
                {
                   this.book = this.service.GetBookByID(bookid,true);
                   this.RelatedBooks = this.service.GetListBooksByCatogery(categoryid,true);
                }
            }          
            
        }
    }
}