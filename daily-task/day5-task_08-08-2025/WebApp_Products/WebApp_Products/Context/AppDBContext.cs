using Microsoft.EntityFrameworkCore;
using WebApp_Products.Models;

namespace WebApp_Products.Context
{
    public class AppDBContext : DbContext
    {
        public AppDBContext(DbContextOptions<AppDBContext> options) : base(options)
        {

        }
        public DbSet<ProductModel> Product { get; set; }
    }
}
