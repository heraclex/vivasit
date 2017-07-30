﻿using Viva.DAL.Entities;
using System.ComponentModel.DataAnnotations;

namespace Viva.DAL
{
    public class Book : BaseEntity
    {
        [StringLength(50, MinimumLength = 3)]
        public string BookName { get; set; }

        [StringLength(50, MinimumLength = 3)]
        public string AuthorName { get; set; }

        public string Description { get; set; }

        [DataType(DataType.Currency)]
        public decimal Price { get; set; }

        [StringLength(50, MinimumLength = 3)]
        public string ImageUrl { get; set; }

        [Range(0, 5)]
        public int Rate { get; set; }

        public int CategoryId { get; set; }

        public virtual Category Category { get; set; }

        public int PictureId { get; set; }

        public virtual Picture Picture { get; set; }

    }
}
