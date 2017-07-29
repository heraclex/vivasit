using System;
using Viva.DAL.Entities;
using System.Collections.Generic;

namespace Viva.WebApp
{
    public partial class Admin_ManageCustomer : Common.AdminPage
    {
        protected List<Customer> Customers = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Customers = this.Service.GetAllCustomers();
        }
    }
}