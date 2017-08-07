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
                this.Books = this.service.GetListBooksByKeyword(searchKeyword, true);
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
            //Decimal pricefrom; Decimal priceto;
            //switch(Convert.ToDecimal(dropPrice.SelectedValue))
            //{
            //    case 2: pricefrom = 0; priceto = 19; break;
            //    case 3: pricefrom = 20; priceto = 39; break;
            //    case 4: pricefrom = 40; priceto = 40; break;
            //    default: pricefrom = 40; priceto = 40; break;
            //}
            lblSearchNotice.Text = "Result for " + "'" + txtKeyword.Text + "'";
            this.Books = this.service.GetListBooksByKeyword(keyword, true);
            
        }
    }
}