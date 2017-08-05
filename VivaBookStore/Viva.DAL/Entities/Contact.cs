using Viva.DAL.Entities;
using System.ComponentModel.DataAnnotations;

namespace Viva.DAL.Entities
{
    public class Contact : BaseEntity
    {
     
        public string EmailAddress { get; set; }

        public string Name { get; set; }

        public string Message { get; set; }

        
    }
}
