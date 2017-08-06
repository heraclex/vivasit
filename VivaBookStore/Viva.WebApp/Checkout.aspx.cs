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
    public partial class Checkout : System.Web.UI.Page
    {
        protected readonly BookStoreService service = new BookStoreService();
        protected Order CurrentOrder;

        protected void Page_Load(object sender, EventArgs e)
        {
          
                    var customer = (Customer)HttpContext.Current.Session["currentuser"];
                    var orderidQueryString = Request.QueryString["orderid"];
                    if (orderidQueryString != null)
                    {
                        var orderid = 0;
                        // Try to get orderid from QueryString 
                        

                        var isConvertToIntSuccess = Int32.TryParse(orderidQueryString, out orderid);
                        if (isConvertToIntSuccess == true && orderid > 0)
                        {
                            var order = this.service.GetOrderByID(orderid);
                           
                        }
                    }
                    else
                    {
                        
                    }
                }
            }
        

        
        
    
}