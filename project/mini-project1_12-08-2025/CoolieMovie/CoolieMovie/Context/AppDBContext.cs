using Microsoft.EntityFrameworkCore;

namespace CoolieMovie.Context
{
    public class AppDBContext : DbContext
    {
        public AppDBContext(DbContextOptions<AppDBContext> options) : base(options)
        {
        }

        public DbSet<Models.CoolieModel> CoolieMovieDB { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Map DoB to SQL 'date' type (no time stored)
            modelBuilder.Entity<Models.CoolieModel>()
                .Property(e => e.DOB)
                .HasColumnType("date");

            base.OnModelCreating(modelBuilder);
        }
    }
}
