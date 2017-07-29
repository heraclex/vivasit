using Viva.DAL.Entities;
using System.ComponentModel.DataAnnotations;

namespace Viva.DAL
{
    public class Book : BaseEntity
    {
        [StringLength(50, MinimumLength = 3)]
        public string BookName { get; set; }

        [StringLength(50, MinimumLength = 3)]
        public string AuthorName { get; set; }

        public string BookDetails { get; set; }

        [DataType(DataType.Currency)]
        public decimal Price { get; set; }

        [StringLength(50, MinimumLength = 3)]
        public string Press { get; set; }

        public string Rate { get; set; }

        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }

    }
}
