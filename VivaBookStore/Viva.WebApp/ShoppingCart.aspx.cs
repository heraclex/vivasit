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

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // When the first time load to this page
                var bookIdQueryString = Request.QueryString["bookid"];
                var customerId = 1;//(int)HttpContext.Current.Session["customerid"];
                if (bookIdQueryString != null)
                {
                    var bookid = 0;
                    // Try to get bookid from QueryString 
                    // http://localhost:9090/ShopingCart?bookid=123

                    var isConvertToIntSuccess = Int32.TryParse(bookIdQueryString, out bookid);
                    if (isConvertToIntSuccess == true && bookid > 0)
                    {
                        var book = this.service.GetBookByID(bookid);
                        this.CurrentOrder = this.service.GetCurrentOrder(customerId);
                        if (this.CurrentOrder != null)
                        {
                            this.UpdateOrderDetails(this.CurrentOrder, book);
                        }
                        else
                        {
                            this.InsertNewOrder(customerId, book);
                        }
                    }
                }
                else
                {
                    this.CurrentOrder = this.service.GetCurrentOrder(customerId);
                    // If User has no Shopping cart, return to Defautl page
                    if (this.CurrentOrder == null)
                    {
                        Server.MapPath("Default.aspx");
                    }
                }
            }
        }

        private void UpdateOrderDetails(Order currentOrder, Book book)
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