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
        #region Customers

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

        #endregion

        #region Books

        public List<Book> GetAllBooks(bool includePicture)
        {
            using (var context = base.GetDbContextInstance())
            {
                if (includePicture)
                {
                    return context.Books.Include(x => x.Picture).ToList();
                }
                else
                {
                    return context.Books.ToList();
                }
                
            }
        }
        public Book GetBookByID (int bookid)
        {
            using (var context = base.GetDbContextInstance())
            {
                var result = context.Books.First(x => x.Id == bookid);
                return result;
            }
        }

        public Book InsertBook(Book book)
        {
            using (var context = base.GetDbContextInstance())
            {
                context.Books.Add(book);
                context.SaveChanges();
            }
            return book;
        }

        public Book UpdateBook(Book book)
        {
            using (var context = base.GetDbContextInstance())
            {
                var entry = context.Entry(book);  // Gets the entry for entity inside context
                entry.State = EntityState.Modified; // Tell EF this entity has been modified
                context.SaveChanges();
            }
            return book;
        }

        public Book DeleteBook(Book book)
        {
            using (var context = base.GetDbContextInstance())
            {
                var entry = context.Entry(book);  // Gets the entry for entity inside context
                entry.State = EntityState.Deleted; // Tell EF this entity has been modified
                context.SaveChanges();
            }
            return book;
        }

        #endregion

        #region Pictures

        public Picture InsertPicture(Picture picture)
        {
            using (var context = new BookStoreDbContext(System.Configuration.ConfigurationManager.ConnectionStrings["VivaConnection"].ConnectionString))
            {
                context.Pictures.Add(picture);
                context.SaveChanges();
            }
            return picture;
        }

        #endregion

        public List<Category> GetAllCategories()
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Categories.ToList();
            }
        }        

        public List<Role> GetAllRoles()
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Roles.ToList();
            }
        }

        public List<Order> GetAllOrders()
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Orders.Include(x=>x.OrderItems).ToList();
            }
        }

        public List<Recommendation> GetAllRecommendations()
        {
            using (var context = base.GetDbContextInstance())
            {
                return context.Recommendations.Include(x=>x.Customer).ToList();
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
