using Microsoft.EntityFrameworkCore;
using Mission.Entities.Models;

namespace Mission.Entities
{
    public class MissionDbContext(DbContextOptions<MissionDbContext> options) : DbContext(options)
    {
        public DbSet<User> Users { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<User>().HasData(new User()
            {
                Id = 1,
                FirstName = "Admin",
                LastName = "Tatva",
                EmailAddress = "admin@tatvasoft.com",
                Password = "admin",
                PhoneNumber = "01234567890",
                UserType = "admin",
            },
            new User()
            {
                Id = 2,
                FirstName = "Nirav",
                LastName = "Vasani",
                EmailAddress = "nirav@vasani.com",
                Password = "nirav@123",
                PhoneNumber = "9909656231",
                UserType = "user",
            });

            base.OnModelCreating(modelBuilder);
        }
    }
}
