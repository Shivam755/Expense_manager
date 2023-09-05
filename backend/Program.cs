using backend.DBContext;
using Microsoft.EntityFrameworkCore;
using backend.Services.UserService;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddTransient<IUserService, UserService>();
builder.Services.AddControllers();
builder.Services.AddDbContext<ExpenseDBContext>(options => {
    options.UseSqlite(builder.Configuration.GetConnectionString("Default"));
});

var app = builder.Build();


app.MapControllers();

app.Run();
