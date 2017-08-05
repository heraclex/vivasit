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
    public partial class ContactUs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private readonly BookStoreService Service = new BookStoreService();
        protected void btnContact_Click(object sender, EventArgs e)
        {
            //var newCustomer = new Customer();
            //newCustomer.EmailAddress = txtEmail.Text;
            //newCustomer.Password = txtPassword.Text;
            //newCustomer.FirstName = txtFirstName.Text;
            //newCustomer.LastName = txtSurName.Text;
            //newCustomer.City = txtCity.Text;
            //newCustomer.Address = txtStreet.Text;
            //newCustomer.Surburb = txtSurburb.Text;
            //newCustomer.Zipcode = txtZipcode.Text;
            //newCustomer.PhoneNumber = txtPhone.Text;
            //newCustomer.HowContactYou = chklistContact.Text;
            //newCustomer.HearUs = dropHear.Text;
            //newCustomer.RoleId = 3;
            //// add new customer to databaes
            //this.Service.InsertCustomer(newCustomer);
            //lblMessage.Text = "Register sucessfully";
        }
    }
}