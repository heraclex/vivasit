using Viva.DAL.Entities;
using System.Data.Entity;

namespace Viva.DAL
{
    public class BookStoreDbContext : DbContext
    {
        public DbSet<Book> Books { get; set; }

        public DbSet<Category> Categories { get; set; }

        public DbSet<Order> Orders { get; set; }

        public DbSet<OrderItem> OrderDetails { get; set; }

        public DbSet<Customer> Customers { get; set; }

        public DbSet<Role> Roles { get; set; }
        
        public DbSet<Recommendation> Recommendations { get; set; }

        public DbSet<Picture> Pictures { get; set; }

        /// <summary>
        /// Initializes a new instance of the <see cref="BookStoreDbContext"/> class.
        /// </summary>
        public BookStoreDbContext() : this("DefaultConnection")
        {
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="BookStoreDbContext"/> class.
        /// </summary>
        /// <param name="connectionString">
        /// connection string name.
        /// </param>
        public BookStoreDbContext(string connectionString)
            : base(connectionString)
        {
            Database.SetInitializer(new Initializers.CreateDatabaseIfNotExists());
            this.Configuration.AutoDetectChangesEnabled = true;
            this.Configuration.ProxyCreationEnabled = false;
        }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {            
            base.OnModelCreating(modelBuilder);
        }        
    }
}
