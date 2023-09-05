using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace backend.Models
{
    [Table("Expense")]
    public class Expense
    {
        [Key]
        public int Id { get; set; }

        public int Amount { get; set; }

        public string? Description { get; set; }

        public label Label{ get; set; }
        public Users Owner { get; set; }

        
    }
}