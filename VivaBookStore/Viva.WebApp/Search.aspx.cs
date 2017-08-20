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
            if (!Page.IsPostBack)
            {
                var searchKeyword = Request.QueryString["searchkeyword"];
                txtKeyword.Text = searchKeyword;
                lblSearchNotice.Text = "Result for " + "'" + txtKeyword.Text + "'";
                this.Books = this.service.SearchBooks(searchKeyword);
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
            lblSearchNotice.Text = "Result for " + "'" + txtKeyword.Text + "'";
            var fromPrice = Convert.ToDecimal(this.fromPrice.SelectedValue);
            var toPrice = Convert.ToDecimal(this.toPrice.SelectedValue);
            this.Books = this.service.SearchBooks(keyword, fromPrice, toPrice, this.txtPublishedYear.Text);            
        }
    }
}