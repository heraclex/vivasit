using System;
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

        public Customer InsertCustomer(Customer customer)
        {
            using (var context = base.GetDbContextInstance())
            {
                context.Customers.Add(customer);
                context.SaveChanges();
            }
            return customer;
        }

        public Customer UpdateCustomer(Customer customer)
        {
            using (var context = base.GetDbContextInstance())
            {
                var entry = context.Entry(customer);  // Gets the entry for entity inside context
                entry.State = EntityState.Modified; // Tell EF this entity has been modified
                context.SaveChanges();
            }
            return customer;
        }

        public Customer DeleteCustomer(Customer customer)
        {
            using (var context = base.GetDbContextInstance())
            {
                var entry = context.Entry(customer);  // Gets the entry for entity inside context
                entry.State = EntityState.Deleted; // Tell EF this entity has been modified
                context.SaveChanges();
            }
            return customer;
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
                var result = context.Customers.FirstOrDefault(x => x.UserName == username);
                return result;
            }
        }
        #endregion

        #region Book
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
                var query = context.Books.Where(x => x.CategoryId == Categoryid);
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

        public List<Book> GetListBooksByKeyword(string keyword, bool includePicture)
        {
            using (var context = base.GetDbContextInstance())
            {
                var query = context.Books.Where(x => x.IsDelete == false);
                query = query.Where(x => x.BookName.Contains(keyword) || x.AuthorName.Contains(keyword) || x.Description.Contains(keyword));
                if (includePicture)
                {
                    query = query.Include(x => x.Picture);
                }

                return query.ToList();
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
        public List<Order> GetAllOrders()
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Orders.Include(x => x.OrderItems).ToList();
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

        public List<Order> GetCompeltedOrdersByCustomer(int customerId)
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Orders.Where(x =>
                x.CustomerId == customerId
                && (x.OrderStatusId == (int)OrderStatus.Processing || x.OrderStatusId == (int)OrderStatus.Complete)
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
                var result = context.Orders.Where(x => x.Id == orderid).Include(x => x.OrderItems).FirstOrDefault();
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
                return context.Recommendations.Include(x => x.Customer).ToList();
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
