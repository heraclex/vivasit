﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viva.DAL;
using System.Data.Entity;
using Viva.DAL.Entities;

namespace Viva.Service
{
    public class BookStoreService : BaseService
    {

        #region Customer
        public List<Customer> GetAllCustomers()
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Customers.ToList();
            }
        }

        public Customer SaveCustomer(Customer customer)
        {
            using (var context = base.GetDbContextInstance())
            {
                if (customer.Id == 0)
                {
                    // Add New
                    context.Customers.Add(customer);
                }
                else
                {
                    // Edit
                    var entry = context.Entry(customer);
                    entry.State = EntityState.Modified;
                }
                context.SaveChanges();
            }
            return customer;
        }

        public Customer DeleteCustomer(int customerId)
        {
            using (var context = base.GetDbContextInstance())
            {
                var customer = context.Customers.Find(customerId);
                customer.IsDelete = true;
                var entry = context.Entry(customer);  // Gets the entry for entity inside context
                entry.State = EntityState.Modified; // Tell EF this entity has been modified
                context.SaveChanges();
                return customer;
            }
        }

        public Customer GetCustomerByID(int customerid)
        {
            using (var context = base.GetDbContextInstance())
            {
                var result = context.Customers.First(x => x.Id == customerid);
                return result;
            }
        }

        /// <summary>
        /// For Login Service to get by user/pass
        /// </summary>
        /// <param name="username"></param>
        /// <param name="pass"></param>
        /// <returns></returns>
        public Customer GetCustomerByUserName(string username)
        {
            using (var context = base.GetDbContextInstance())
            {
                var result = context.Customers.Where(x => x.UserName == username && !x.IsDelete && x.Active)
                    .Include(x=>x.Role).FirstOrDefault();
                return result;
            }
        }
        #endregion

        #region Book

        public int GetReviewsByBookId(int bookId)
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Recommendations.Count(x => x.BookId.HasValue && x.BookId.Value == bookId);
            }
        }

        public List<Book> GetAllBooks(bool includePicture = false)
        {
            using (var context = base.GetDbContextInstance())
            {
                var query = context.Books.Where(x => x.IsDelete == false);
                if (includePicture)
                {
                    return query.Include(x => x.Picture).ToList();
                }
                else
                {
                    return query.ToList();
                }                
            }
        }

        public List<Book> GetListBooksByCatogery(int Categoryid, bool includePicture)
        {
            using (var context = base.GetDbContextInstance())
            {
                var query = context.Books.Where(x => x.IsDelete == false && x.CategoryId == Categoryid);
                if (includePicture)
                {
                    query = query.Include(x => x.Picture);
                }

                return query.ToList();
            }
        }

        public List<Book> GetListBooksNewRelease(bool includePicture)
        {
            using (var context = base.GetDbContextInstance())
            {
                var query = context.Books.Where(x => x.IsDelete == false && x.NewRelease == true);
                if (includePicture)
                {
                    query = query.Include(x => x.Picture);
                }

                return query.ToList();
            }
        }

        public List<Book> SearchBooks(string keyword, decimal? fromPrice = null, decimal? toPrice = null, string publicYear = "")
        {
            using (var context = base.GetDbContextInstance())
            {
                var query = context.Books.Where(x => x.IsDelete == false);
                query = query.Where(x => !x.IsDelete && x.BookName.Contains(keyword) || x.AuthorName.Contains(keyword) || x.Description.Contains(keyword));

                // Add price range to search criteria
                if ((fromPrice.HasValue && toPrice.HasValue) && (fromPrice <= toPrice))
                {
                    query = query.Where(x => x.Price >= fromPrice.Value && x.Price <= toPrice.Value);
                }

                // Add price range to search criteria
                if (!string.IsNullOrEmpty(publicYear))
                {
                    query = query.Where(x => x.PublishedYear == publicYear);
                }

                return query.Include(x=>x.Picture).ToList();
            }
        }
     
        public Book GetBookByID (int bookid, bool includePicture = false)
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Books.Where(x => x.Id == bookid).Include(x=>x.Picture).FirstOrDefault();
                               
            }
        }
        
        public Book SaveBook(Book book)
        {
            using (var context = base.GetDbContextInstance())
            {
                if (book.Id == 0)
                {
                    // Add New
                    context.Books.Add(book);
                }
                else
                {
                    // Edit
                    var entry = context.Entry(book); 
                    entry.State = EntityState.Modified;
                }
                
                context.SaveChanges();
            }
            return book;
        }

        public Book DeleteBook(int bookId)
        {
            using (var context = base.GetDbContextInstance())
            {
                var book = context.Books.Find(bookId);
                book.IsDelete = true;
                var entry = context.Entry(book);  // Gets the entry for entity inside context
                entry.State = EntityState.Modified; // Tell EF this entity has been modified
                context.SaveChanges();
                return book;
            }
        }
        
        public Picture InsertPicture(Picture picture)
        {
            using (var context = base.GetDbContextInstance())
            {
                context.Pictures.Add(picture);
                context.SaveChanges();
            }
            return picture;
        }

        public Picture DeletePictureById(int pictureId)
        {
            using (var context = base.GetDbContextInstance())
            {
                var picture= context.Pictures.Find(pictureId);
                var entry = context.Entry(picture);
                entry.State = EntityState.Deleted;
                context.SaveChanges();

                return picture;
            }
        }

        public List<Category> GetAllCategories()
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Categories.ToList();
            }
        }

        #endregion

        #region Orders
        public List<Order> GetAllOrders(int customerId = 0)
        {
            using (var context = base.GetDbContextInstance())
            {
                var query = context.Orders.Where(x => !x.IsDelete && x.OrderStatusId != (int)OrderStatus.Pending);

                // If customerID greter than 0, adding more condition on query
                if (customerId > 0)
                {
                    query = query.Where(x=>x.CustomerId == customerId);
                }

                return query.Include(x => x.OrderItems).Include(x=>x.Customer).ToList();
            }
        }

        public Order InsertOrder(Order newOrder)
        {
            using (var context = base.GetDbContextInstance())
            {
                context.Orders.Add(newOrder);
                context.SaveChanges();
            }
            return newOrder;
        }

        public Order ChangeStatus(Order order)
        {
            using (var context = base.GetDbContextInstance())
            {
                
                    var entry = context.Entry(order);
                    entry.State = EntityState.Modified;
                
                context.SaveChanges();
            }
            return order;
        }

        public Order UpdateOrder(Order order)
        {
            using (var context = base.GetDbContextInstance())
            {                
                // Update Order
                var orderEntry = context.Entry(order);  // Gets the entry for entity inside context
                orderEntry.State = EntityState.Modified; // Tell EF this entity has been modified

                // Update Order Details
                var index = 0;
                while (order.OrderItems.Count > 0 && index < order.OrderItems.Count)
                {
                    var orderItem = order.OrderItems[index];
                    var orderItemEntry = context.Entry(orderItem);
                    if (orderItem.Id > 0)
                    {
                        if (orderItem.Remove == true)
                        {
                            // Don't need increase index here because this item was removed
                            // that means the size of orderitems was reduce
                            orderItemEntry.State = EntityState.Deleted;
                        }
                        else
                        {
                            orderItemEntry.State = EntityState.Modified;
                            index++;
                        }
                    }
                    else
                    {                        
                        orderItemEntry.State = EntityState.Added;
                        index++;
                    }
                }

                context.SaveChanges();
            }
            return order;
        }

        public List<Order> GetCompletedOrdersByCustomer(int customerId)
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Orders.Where(x =>
                x.CustomerId == customerId
                && (x.OrderStatusId == (int)OrderStatus.Processing || x.OrderStatusId == (int)OrderStatus.Complete || x.OrderStatusId == (int)OrderStatus.Deliveried)
                && x.PaymentStatusId == (int)PaymentStatus.Paid).ToList();
            }
        }

        public Order GetCurrentOrder(int customerId)
        {
            using (var context = base.GetDbContextInstance())
            {
                // Return the current Order (ShoppingCartItems)
                // Can return null in case customer don't have any orders
                var currentOrder = context.Orders.Where(x =>
                x.CustomerId == customerId
                && x.OrderStatusId == (int)OrderStatus.Pending
                && x.PaymentStatusId == (int)PaymentStatus.Pending).Include(x => x.OrderItems).FirstOrDefault();

                if (currentOrder != null && currentOrder.OrderItems.Count > 0)
                {
                    // Get Book detail
                    foreach (var orderItem in currentOrder.OrderItems)
                    {
                        orderItem.Book = context.Books.Where(x => x.Id == orderItem.BookId).FirstOrDefault();
                    }
                }

                return currentOrder;
            }
        }

        public Order GetOrderByID(int orderid)
        {
            using (var context = base.GetDbContextInstance())
            {
                var result = context.Orders.Where(x => x.Id == orderid).Include(x => x.OrderItems).Include(x=>x.Customer).FirstOrDefault();
                if (result != null && result.OrderItems.Count > 0)
                {
                    // Get Book detail
                    foreach (var orderItem in result.OrderItems)
                    {
                        orderItem.Book = context.Books.Where(x => x.Id == orderItem.BookId).FirstOrDefault();
                    }
                }
                return result;
            }
        }
        #endregion

        #region Recommendation
        public List<Recommendation> GetAllRecommendations()
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Recommendations.Include(x => x.Customer).Include(x=>x.Book).ToList();
            }
        }

        public List<Recommendation> GetAllRecommendationsByBookID(int bookid)
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Recommendations.Where(x =>
               x.BookId == bookid).Include(x=>x.Customer).ToList();
               
            }
        }
        public Recommendation InsertRecommendation(Recommendation commend)
        {
            using (var context = base.GetDbContextInstance())
            {
                commend.CreatedDate = DateTime.Now;
                context.Recommendations.Add(commend);
                context.SaveChanges();
            }
            return commend;
        }
        #endregion

        #region Contact
        public Contact InsertContact(Contact newcontact)
        {
            using (var context = base.GetDbContextInstance())
            {
                context.Contacts.Add(newcontact);
                context.SaveChanges();
            }
            return newcontact;
        }
        #endregion

        public List<Role> GetAllRoles()
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Roles.ToList();
            }
        }

        public bool IsExistUsename(string username)
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Customers.Any(
                    x => x.UserName.Equals(username) );
            }
        }
        public bool IsExistEmail(string email)
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Customers.Any(
                    x => x.EmailAddress.Equals(email));
            }
        }

        public bool IsLoginSuccess(string username, string password)
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Customers.Any(
                    u=>u.UserName.Equals(username) && password.Equals(password));
            }
        }        
    }
}
