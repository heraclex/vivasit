using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Viva.DAL.Entities;
using Viva.Service;

namespace Viva.WebApp.Admin
{
    public partial class ManageCustomer : Common.AdminPage
    {
        private readonly BookStoreService service = new BookStoreService();
        protected Customer customer = null;
        protected List<Customer> Customers = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Customers = this.Service.GetAllCustomers();

        }


        protected void Active(int customerid)
        {
            var customeridString = Request.QueryString["customerid"];
            if (customeridString != null)
            {
                //int customerid = 0;
                var isConvertToIntSuccess = Int32.TryParse(customeridString, out customerid);
                if (isConvertToIntSuccess == true && customerid > 0)
                {
                    this.customer = this.service.GetCustomerByID(customerid);
                }
            }
        }
    }
}