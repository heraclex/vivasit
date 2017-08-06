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
    public partial class Recomendation : System.Web.UI.Page
    {
        protected readonly BookStoreService service = new BookStoreService();
        protected Order CurrentOrder = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["currentuser"] != null)
            {
                var customer = (Customer)HttpContext.Current.Session["currentuser"];
                txtName.Text = customer.UserName;               

            }

            txtName.Visible = false;
            txtComment.Visible = false;
            lblComment.Visible = false;
            lblUsername.Visible = false;
            lblNotice.Text = "Please login to commend";


        }

        protected void btnCommend_Click(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["currentuser"] != null)
            {
                var customer = (Customer)HttpContext.Current.Session["currentuser"];
                var newCommend = new Recommendation();
                newCommend.CustomerId = customer.Id;
                newCommend.Comment = txtComment.Text;
                this.service.InsertRecommendation(newCommend);
                lblNotice.Text = "Thanks for your recommendation";
                txtComment.Text = "";
            }
            lblNotice.Text = "Please login to commend";




        }
    }
}