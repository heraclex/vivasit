using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Viva.DAL.Entities;

namespace Viva.WebApp.Admin
{
    public partial class ManageCustomer : Common.AdminPage
    {
        protected List<Customer> Customers = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Customers = this.Service.GetAllCustomers();
        }
    }
}