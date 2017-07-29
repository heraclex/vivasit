using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viva.DAL.Entities
{
    public class CustomerRoleMapping : BaseEntity
    {
        public int CustomerId { get; set; }

        public int RoleId { get; set; }

        public virtual Role Role { get; set; }

        public virtual Customer Customer { get; set; }
    }
}
