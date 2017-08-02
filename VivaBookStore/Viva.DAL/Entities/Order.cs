using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viva.DAL.Entities
{
    public class Order : BaseEntity
    {
        public int CustomerId { get; set; }

        [DataType(DataType.Currency)]
        public decimal TotalPrice { get; set; }

        public DateTime? CreatedDate { get; set; }

        public int OrderStatusId { get; set; }

        public int PaymentStatusId { get; set; }

        public virtual Customer Customer { get; set; }

        public virtual List<OrderItem> OrderItems { get; set; }
    }
}
