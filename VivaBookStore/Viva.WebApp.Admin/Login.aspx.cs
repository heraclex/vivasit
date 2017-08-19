using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Viva.WebApp.Admin.Common;

namespace Viva.WebApp.Admin
{
    public partial class Login : AdminPage
    {
        protected bool loginSuccess = true;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            var customer = this.Service.GetCustomerByUserName(txtUserName.Text);
            if (customer != null 
                && customer.Role.RoleName != "User" // NOT Allow user login in to admin area
                && customer.Password == txtPassword.Text)
            {
                if (HttpContext.Current.Session["currentuser"] == null)
                {
                    HttpContext.Current.Session.Add("currentuser", customer);
                }

                Response.Redirect("ManageBook.aspx");
            }

            this.loginSuccess = false;
        }
    }
}