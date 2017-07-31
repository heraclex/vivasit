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
    public partial class Register : System.Web.UI.Page
            {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private readonly BookStoreService Service = new BookStoreService();

        private bool IscheckHowContactYou()
        {
            var howContactYou = String.Join(", ",
                   chklistContact.Items.Cast<ListItem>().Where(item => item.Selected)
                   .Select(item => item.Value).ToArray());

            if (string.IsNullOrEmpty(howContactYou))
            {
                lblContactError.Text = "Please select at least one way we contact you";
                return false;
            }
            return true;
        }
    protected void btnRegister_Click(object sender, EventArgs e)
        {
                 
            if (IscheckHowContactYou() == true)
            {
                var newCustomer = new Customer();
                newCustomer.EmailAddress = txtEmail.Text;
                newCustomer.Password = txtPassword.Text;
                newCustomer.FirstName = txtFirstName.Text;
                newCustomer.LastName = txtSurName.Text;
                newCustomer.City = txtCity.Text;
                newCustomer.Address = txtStreet.Text;
                newCustomer.Country = txtCountry.Text;
                newCustomer.PhoneNumber = txtPhone.Text;
                newCustomer.HowContactYou = chklistContact.Text;
                newCustomer.HearUs = dropHear.Text;

                // add new book to databaes
                this.Service.InsertCustomer(newCustomer);
            }
        }
    }
}