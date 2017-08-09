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
    public partial class CustomerOrders : System.Web.UI.Page
    {
        protected readonly BookStoreService service = new BookStoreService();

        protected Customer CurrentCustomer = null;

        protected Order SelectedOrder = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            // If user haven't login yet, redirect to Default page
            if (HttpContext.Current.Session["currentuser"] == null)
            {
                Response.Redirect("Default.aspx?usernotlogin=true");
            }

            this.CurrentCustomer = (Customer)HttpContext.Current.Session["currentuser"];

            var viewdetailorderId = Request.QueryString["viewdetailorderId"];
            if (!string.IsNullOrEmpty(viewdetailorderId))
            {
                this.SelectedOrder = this.service.GetOrderByID(Convert.ToInt32(viewdetailorderId));
            }

            this.GridViewCustomerOrders.DataSource = this.service.GetCompeltedOrdersByCustomer(this.CurrentCustomer.Id);
            this.GridViewCustomerOrders.DataBind();
        }      

        protected string GetOrderStatus(string status)
        {
            var orderStatusId = Convert.ToInt32(status);
            switch ((OrderStatus)orderStatusId)
            {
                case OrderStatus.Pending:
                    return "Pending";
                case OrderStatus.Processing:
                    return "Processing";
                case OrderStatus.Complete:
                    return "Complete";
                case OrderStatus.Cancelled:
                    return "Cancelled";
                default:
                    return string.Empty;
            }
        }

        protected string GetPaymentStatus(string status)
        {
            var paymentStatusId = Convert.ToInt32(status);
            switch ((PaymentStatus)paymentStatusId)
            {
                case PaymentStatus.Pending:
                    return "Pending";
                case PaymentStatus.Authorized:
                    return "Authorized";
                case PaymentStatus.Paid:
                    return "Paid";
                case PaymentStatus.PartiallyRefunded:
                    return "PartiallyRefunded";
                case PaymentStatus.Voided:
                    return "Voided";
                default:
                    return string.Empty;
            }
        }
        
    }
}