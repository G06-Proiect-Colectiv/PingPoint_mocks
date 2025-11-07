using Microsoft.EntityFrameworkCore;


namespace backend.Data
{
    public class PingPointDbContext : DbContext
    {
        public PingPointDbContext(DbContextOptions<PingPointDbContext> options) : base(options)
        {
        }

        public DbSet<backend.Models.Route> Routes { get; set; }
        public DbSet<backend.Models.Location> Locations { get; set; }
    }
}
