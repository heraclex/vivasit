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
        protected Customer CurrentCustomer = null;
        protected List<Customer> Customers = null;
        protected List<Role> Roles = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Get Roles to display Role name on table
                // and it is also being used in Edit/Add new Mode
                // Therefore, this list should be always avaiable on page
                this.Roles = this.Service.GetAllRoles();

                // get all Customers to display on table
                this.Customers = this.Service.GetAllCustomers();

                // Get bookid on query string
                var queryCustomerId = Request.QueryString["customerId"];
                var customerId = 0;
                var isIDValid = Int32.TryParse(queryCustomerId, out customerId);
                if (isIDValid)
                {
                    // IF bookId > 0, get book from database.
                    if (customerId > 0)
                    {
                        this.CurrentCustomer = this.Service.GetCustomerByID(customerId);
                        this.Status = PageStatus.Edit;
                    }
                    else
                    // ELSE: Init new book object
                    {
                        this.CurrentCustomer = new Customer();
                        this.Status = PageStatus.Add;
                    }
                    this.InitFormData();
                }
            }
        }

        /// <summary>
        /// Assign current book values to controls on web page
        /// </summary>
        private void InitFormData()
        {
            // Need Hidden-Field to keep bookid at client
            this.hfCustomerId.Value = this.CurrentCustomer.Id.ToString();

            txtFirstName.Text = this.CurrentCustomer.FirstName;
            txtUserName.Text = this.CurrentCustomer.UserName;
            txtFirstName.Text = this.CurrentCustomer.FirstName;
            txtLastName.Text = this.CurrentCustomer.LastName;
            chkActive.Checked = this.CurrentCustomer.Active;
            txtAddress.Text = this.CurrentCustomer.Address;
            txtCity.Text  = this.CurrentCustomer.City;
            txtEmail.Text = this.CurrentCustomer.EmailAddress;
            txtPassword.Text = this.CurrentCustomer.Password;
            txtUserName.Text = this.CurrentCustomer.UserName;
            txtSurburb.Text = this.CurrentCustomer.Surburb;
            txtPhoneNumber.Text = this.CurrentCustomer.PhoneNumber;

            // Generate category dropdown list
            this.ddRoles.DataSource = this.Roles;
            this.ddRoles.DataTextField = "RoleName";
            this.ddRoles.DataValueField = "Id";
            this.ddRoles.DataBind();

            // Assign rolse Id to dropdown
            this.ddRoles.SelectedValue = this.CurrentCustomer.RoleId.ToString();
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var customerId = Convert.ToInt32(this.hfCustomerId.Value);
            // IF customerId > 0, get customer from Database
            // ELSE, init new Customer object
            var customer = customerId > 0
                ? this.Service.GetCustomerByID(customerId)
                : new Customer() { CreatedDate = DateTime.Now};

            customer.UserName = txtUserName.Text;
            customer.FirstName = txtFirstName.Text;
            customer.LastName = txtLastName.Text;
            customer.Active = chkActive.Checked;
            customer.Address = txtAddress.Text;
            customer.City = txtCity.Text;
            customer.EmailAddress = txtEmail.Text;
            customer.Password = txtPassword.Text;
            customer.UserName = txtUserName.Text;
            customer.Surburb = txtSurburb.Text;
            customer.PhoneNumber = txtPhoneNumber.Text;
            customer.RoleId = Convert.ToInt32(ddRoles.SelectedValue);

            this.Service.SaveCustomer(customer);
            // Reload Page to see updates on book table
            Response.Redirect("ManageCustomer.aspx");
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var customerId = Convert.ToInt32(this.hfCustomerId.Value);
            if (customerId > 0)
            {
                this.Service.DeleteCustomer(customerId);
            }
            // Reload Page to see updates on book table
            Response.Redirect("ManageCustomer.aspx");
        }
    }
}