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
    public partial class ShoppingCart : System.Web.UI.Page
    {
        protected readonly BookStoreService service = new BookStoreService();
        protected Order CurrentOrder = null;
        protected Customer CurrentCustomer = null;

        protected void Page_Load(object sender, EventArgs e)
        {
            // If user haven't login yet, redirect to Default page
            if (HttpContext.Current.Session["currentuser"] == null)
            {
                Response.Redirect("Default.aspx");
            }

            this.CurrentCustomer = (Customer)HttpContext.Current.Session["currentuser"];

            // Get CurrentOrder (order which is in Pending Status) based on customerId 
            this.CurrentOrder = this.service.GetCurrentOrder(this.CurrentCustomer.Id);

            // First Time Page Load
            if (!Page.IsPostBack)
            {     
                var bookIdQueryString = Request.QueryString["bookid"];

                if (string.IsNullOrEmpty(bookIdQueryString) && this.CurrentOrder == null)
                {
                    // If bookIdQueryString null and current order is null, return back to Defdault Page
                    // in order to force user have to by some things before viewin their cart detail.
                    Response.Redirect("Default.aspx");
                }

                if (bookIdQueryString != null)
                {
                    var bookid = 0;
                    // Try to get bookid from QueryString Ex: http://localhost:9090/ShopingCart?bookid=123
                    var isConvertToIntSuccess = Int32.TryParse(bookIdQueryString, out bookid);
                    if (isConvertToIntSuccess == true && bookid > 0)
                    {
                        var book = this.service.GetBookByID(bookid,true);
                        
                        if (this.CurrentOrder != null)
                        {
                            // Update Current Order
                            this.UpdateCurrentOrder(this.CurrentOrder, book);
                        }
                        else
                        {
                            // Create New Order(Status=Pending) with one book item
                            this.InsertNewOrder(this.CurrentCustomer.Id, book);
                        }

                        // Remove Query String in Url to avoid adding more book quntity when page reload
                        Response.Redirect("ShoppingCart.aspx");
                    }
                }
            }
        }

        protected void btnUpdateCartDetail_Click(object sender, EventArgs e)
        {
            this.CurrentOrder.TotalPrice = 0;

            foreach (var orderItem in this.CurrentOrder.OrderItems)
            {
                var isdeleted = Request.Form["deleteOrderItem_" + orderItem.Id];
                if (!string.IsNullOrEmpty(isdeleted) && isdeleted.Equals("on"))
                {
                    // When User checked delete for this item. Enable this flag
                    orderItem.Remove = true;
                }
                else
                {
                    // Get quantity data from form submit
                    orderItem.Quantity = Convert.ToInt32(Request.Form["quantityOrderItem_" + orderItem.Id]);

                    // update Total Price on Order
                    this.CurrentOrder.TotalPrice += orderItem.Book.Price * orderItem.Quantity;
                }                
            }

            this.service.UpdateOrder(this.CurrentOrder);
        }

        protected void btnSubmitOrder_Click(object sender, EventArgs e)
        {
            this.CurrentOrder.CreatedDate = DateTime.Now;
            this.CurrentOrder.OrderStatusId = (int)OrderStatus.Complete;
            this.CurrentOrder.PaymentStatusId = (int)PaymentStatus.Paid;
            this.service.UpdateOrder(this.CurrentOrder);

            // Update book Quantity In Unit
            foreach (var orderItem in this.CurrentOrder.OrderItems)
            {
                var book = this.service.GetBookByID(orderItem.BookId, false);
                book.QuantityInUnit = book.QuantityInUnit - orderItem.Quantity;
                this.service.UpdateBook(book);
            }

            Response.Redirect("Default.aspx");
        }

        private void UpdateCurrentOrder(Order currentOrder, Book book)
        {
            var existedBookItem = currentOrder.OrderItems.FirstOrDefault(bookItem => bookItem.BookId == book.Id);
            if (existedBookItem != null)
            {
                // This Book is already existed in OrderItems
                // Just need update the quantity by Increase the number of quantity
                existedBookItem.Quantity += 1;
            }
            else
            {
                // If this book IS NOT exist yet.
                // Add new Order Item with book Id
                var newOrderItem = new OrderItem()
                {
                    BookId = book.Id,
                    OrderId = currentOrder.Id,
                    Quantity = 1
                };

                currentOrder.OrderItems.Add(newOrderItem);
            }

            currentOrder.TotalPrice += book.Price;

            // Update these information to database
            this.service.UpdateOrder(currentOrder);
        }

        private void InsertNewOrder(int customerId, Book book)
        {            
            var newOrder = new Order()
            {
                CustomerId = customerId,
                OrderStatusId = (int)OrderStatus.Pending,
                PaymentStatusId = (int)PaymentStatus.Pending,
                TotalPrice = book.Price
            };

            var newOrderItem = new OrderItem()
            {
                BookId = book.Id,
                Quantity = 1
            };

            newOrder.OrderItems = new List<OrderItem>() { newOrderItem };
            this.service.InsertOrder(newOrder);

            // When Insert new Order Success, add this order to CurrentOrder
            this.CurrentOrder = newOrder;
        }
    }
}