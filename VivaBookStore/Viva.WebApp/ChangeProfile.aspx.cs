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
    public partial class ChangeProfile : System.Web.UI.Page
    {
        private readonly BookStoreService service = new BookStoreService();
        protected Customer customer = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            // If user haven't login yet, redirect to Default page
            if (HttpContext.Current.Session["currentuser"] == null)
            {
                Response.Redirect("Default.aspx?usernotlogin=true");
            }

            var customeridString = Request.QueryString["customerid"];
            if (customeridString != null)
            {
                var customerid = 0;
                var isConvertToIntSuccess = Int32.TryParse(customeridString, out customerid);
                if (isConvertToIntSuccess == true && customerid > 0)
                {
                    this.customer = this.service.GetCustomerByID(customerid);
                    txtEmail.Text = customer.EmailAddress;
                    txtUsename.Text = customer.UserName;
                    txtFirstName.Text= customer.FirstName ;
                    txtSurName.Text= customer.LastName ;
                    txtCity.Text= customer.City ;
                    txtStreet.Text= customer.Address;
                    txtSurburb.Text=customer.Surburb ;
                    txtZipcode.Text = customer.Zipcode;
                    txtPhone.Text = customer.PhoneNumber ;
                    chklistContact.Text = customer.HowContactYou ;
                    dropHear.Text = customer.HearUs ;
                    hiddenFieldCustomerId.Value = customer.Id.ToString();
                }
            }
        }
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

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (IscheckHowContactYou() == true)
            {
                var customerId = Convert.ToInt32(hiddenFieldCustomerId.Value);

                this.customer = this.service.GetCustomerByID(customerId);

                                
                customer.LastName = txtSurName.Text;
                customer.City = txtCity.Text;
                customer.Address = txtStreet.Text;
                customer.Surburb = txtSurburb.Text;
                customer.Zipcode = txtZipcode.Text;
                customer.PhoneNumber = txtPhone.Text;
                customer.HowContactYou = chklistContact.Text;
                customer.HearUs = dropHear.Text;
                customer.RoleId = 3;
                // add new customer to databaes
                this.service.SaveCustomer(customer);
                lblMessage.Text = "Update sucessfully";

                txtFirstName.ReadOnly = true;
                txtSurName.ReadOnly = true;
                txtCity.ReadOnly = true;
                txtStreet.ReadOnly = true;
                txtSurburb.ReadOnly = true;
                txtPhone.ReadOnly = true;
                btnUpdate.Visible = true;
                btnSubmit.Visible = false;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
                       
            txtFirstName.ReadOnly = false;
            txtSurName.ReadOnly = false;
            txtCity.ReadOnly = false;
            txtStreet.ReadOnly = false;
            txtZipcode.ReadOnly = false;
            txtSurburb.ReadOnly = false;
            txtPhone.ReadOnly = false;
            btnSubmit.Visible = true;
            btnUpdate.Visible = false;
        }

        protected void btnChanePass_Click(object sender, EventArgs e)
        {
            Response.Redirect("ChangePassWord.aspx");
        }
    }
}