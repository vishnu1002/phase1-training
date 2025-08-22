using BankAPI.Models;
using Microsoft.EntityFrameworkCore;

namespace BankAPI.Context
{
    public class AppDBContext : DbContext
    {
        public AppDBContext(DbContextOptions<AppDBContext> options) : base(options) { }

        public DbSet<CustomerModel> Customers { get; set; }
        public DbSet<AccountModel> Accounts { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<CustomerModel>()
                .HasMany(c => c.Accounts)
                .WithOne()
                .HasForeignKey(a => a.CustomerId)
                .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
