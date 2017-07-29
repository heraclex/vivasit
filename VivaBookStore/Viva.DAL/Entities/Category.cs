using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viva.DAL.Entities
{
    public class Category : BaseEntity
    {
        [StringLength(50, MinimumLength = 3)]
        public string CategoryName { get; set; }

        public virtual List<Book> Books { get; set; }
    }
}
