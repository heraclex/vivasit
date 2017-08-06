using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Viva.DAL.Entities;
using Viva.Service;

namespace Viva.WebApp
{
    public partial class Search : System.Web.UI.Page
    {
        
        protected List<Book> Books = null;


        private readonly BookStoreService service = new BookStoreService();
        protected void Page_Load(object sender, EventArgs e)
        {
            var searchKeyword = Request.QueryString["searchkeyword"];
            var categoryIdFromQueryString = Request.QueryString["categoryId"];
            {
               

                if (string.IsNullOrEmpty(categoryIdFromQueryString))
                {
                    this.Books = this.service.GetAllBooks(true);
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
        }

        protected string GetPictureUrlFromBytes(byte[] pictureBinary)
        {
            string base64String = Convert.ToBase64String(pictureBinary, 0, pictureBinary.Length);
            return "data:image/png;base64," + base64String;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string keyword = txtKeyword.Text;
            lblSearchNotice.Text = "Result for " + txtKeyword.Text;
            this.Books = this.service.GetListBooksByKeyword(keyword, true);
            
        }
    }
}