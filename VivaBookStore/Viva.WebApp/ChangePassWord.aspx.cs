using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Viva.Service;
using Viva.DAL.Entities;


namespace Viva.WebApp
{
    public partial class ChangePassWord : System.Web.UI.Page
    {
        private readonly BookStoreService service = new BookStoreService();
        protected Customer CurrentCustomer = null;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnChanePass_Click(object sender, EventArgs e)
        {
            //Check currentPass

            if (HttpContext.Current.Session["currentuser"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            this.CurrentCustomer = (Customer)HttpContext.Current.Session["currentuser"];
            if (CurrentCustomer.Password == txtCurrentPass.Text )
            {
                CurrentCustomer.Password = txtPassword.Text;
                this.service.UpdateCustomer(CurrentCustomer);
                lblMessage.Text = "Update password successfully";
                

            }else { lblMessage.Text = "Wrong current Password"; }
            
        }
    }
}