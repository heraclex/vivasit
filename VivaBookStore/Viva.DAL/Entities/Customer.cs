using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Viva.DAL.Entities
{
    public class Customer : BaseEntity
    {
        public string UserName { get; set; }

        public string Password { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public string Address { get; set; }

        public string Suburb { get; set; }

        public string City { get; set; }

        public string Country { get; set; }
        
        public string PhoneNumber { get; set; }

        public string EmailAddress { get; set; }

        public string CreditCardNumber { get; set; }

        public string CardExpiredDate { get; set; }

        public bool Subscribe { get; set; }
    }
}
