using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Viva.DAL;

namespace Viva.Service
{
    public class BaseService
    {
        private string ConnectionString = string.Empty;

        private BookStoreDbContext _dbContext;        

        protected BaseService()
        {
            var vivaConnStr = System.Configuration.ConfigurationManager.ConnectionStrings["VivaConnection"];
            if (vivaConnStr == null)
                throw new NullReferenceException();

            this.ConnectionString = vivaConnStr.ConnectionString;
        }

        protected BookStoreDbContext GetDbContextInstance()
        {
            if (this._dbContext == null)
            {
                if (string.IsNullOrEmpty(ConnectionString))
                {
                    throw new Exception("Missing Connection String");
                }
                this._dbContext = new BookStoreDbContext(this.ConnectionString);
            }
            // Init dbContext
            return this._dbContext;
        }
    }
}
