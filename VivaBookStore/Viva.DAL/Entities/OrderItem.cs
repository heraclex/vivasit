using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viva.DAL.Entities
{
    public class OrderItem : BaseEntity
    {
        public int BookId { get; set; }

        public int OrderId { get; set; }

        public int Quantity { get; set; }
        
        public virtual Book Book { get; set; }

        public virtual Order Order { get; set; }
        
        [NotMapped]
        public bool Remove { get; set; }
    }
}
