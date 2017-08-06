using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viva.DAL.Entities
{
    public class Recommendation : BaseEntity
    {
        [StringLength(1000, MinimumLength = 3)]
        public string Comment {get;set;}

        public int CustomerId { get; set; }

        public virtual Customer Customer { get; set; }
    }
}
