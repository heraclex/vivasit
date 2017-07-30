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

        protected BaseService()
        {
            var vivaConnStr = System.Configuration.ConfigurationManager.ConnectionStrings["VivaConnection"];
            if (vivaConnStr == null)
                throw new NullReferenceException();

            this.ConnectionString = vivaConnStr.ConnectionString;
        }

        protected BookStoreDbContext GetDbContextInstance()
        {
            return new BookStoreDbContext(this.ConnectionString);
        }
    }
}
