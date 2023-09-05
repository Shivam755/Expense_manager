using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using backend.Models;

namespace backend.DBContext
{
    public class ExpenseDBContext : DbContext
    {
        public ExpenseDBContext(DbContextOptions<ExpenseDBContext> options) : base(options)
        {
            
        }
        public DbSet<Expense> Expenses { get; set; }
        public DbSet<Users> Users {get; set; }
        public DbSet<label> Labels { get; set; }

        override protected void OnModelCreating(ModelBuilder modelBuilder){

        }
    }
}