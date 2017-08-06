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
            var newContact = new Contact();
            newContact.EmailAddress = txtEmail.Text;
            newContact.Name = txtName.Text;
            newContact.Message = txtMessage.Text;

            // add new contact to databaes
            this.Service.InsertContact(newContact);
            lblnotice.Text = "Thanks for your message. We will contact you soon.";
            txtEmail.Text = "";
            txtName.Text = "";
            txtMessage.Text = "";
        }
    }
}