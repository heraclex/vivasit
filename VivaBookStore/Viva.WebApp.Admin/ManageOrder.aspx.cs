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
    public partial class ManageOrder : Common.AdminPage
    {
        protected List<Order> Orders = null;
        protected Order CurrentOrder = null;
        protected void Page_Load(object sender, EventArgs e)
        {

            // If user haven't login yet, redirect to Login page
            if (HttpContext.Current.Session["currentuser"] == null)
            {
                Response.Redirect("Login.aspx");
            }

            if (!Page.IsPostBack)
            {
                this.ddCustomer.DataSource = this.Service.GetAllCustomers();
                this.ddCustomer.DataTextField = "FirstName";
                this.ddCustomer.DataValueField = "Id";
                this.ddCustomer.DataBind();

                var selectedCustomerId = Convert.ToInt32(this.ddCustomer.SelectedValue);
                this.Orders = this.Service.GetAllOrders(selectedCustomerId);

                var queryOrderId = Request.QueryString["orderid"];
                var orderId = 0;
                var isIDValid = Int32.TryParse(queryOrderId, out orderId);
                if (isIDValid)
                {

                    // IF orderId > 0, get orderdetail from database.
                    if (orderId > 0)
                    {
                        this.CurrentOrder = this.Service.GetOrderByID(Convert.ToInt32(orderId));
                        this.Status = PageStatus.Edit;
                    }

                    this.InitFormData();
                }
            }            
        }

        private void InitFormData()
        {
            // Need Hidden-Field to keep bookid at client
            this.hfOrderId.Value = this.CurrentOrder.Id.ToString();            
            this.ddStatus.SelectedValue = this.CurrentOrder.OrderStatusId.ToString();

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            var orderid = Convert.ToInt32(this.hfOrderId.Value);
            var Order = this.Service.GetOrderByID(orderid);

            Order.OrderStatusId = Convert.ToInt32(ddStatus.SelectedValue);
            this.Service.ChangeStatus(Order);
            Response.Redirect("ManageOrder.aspx");
        }

        protected string GetOrderStatus(int status)
        {
            switch ((OrderStatus)status)
            {
                case OrderStatus.Pending:
                    return "Pending";
                case OrderStatus.Processing:
                    return "Processing";
                case OrderStatus.Complete:
                    return "Completed";
                case OrderStatus.Cancelled:
                    return "Cancelled";
                case OrderStatus.Deliveried:
                    return "Deliveried";
                default:
                    return string.Empty;
            }
        }

        protected void ddCustomer_SelectedIndexChanged(object sender, EventArgs e)
        {
            var selectedCustomerId = Convert.ToInt32(this.ddCustomer.SelectedValue);
            this.Orders = this.Service.GetAllOrders(selectedCustomerId);

        }
    }
}