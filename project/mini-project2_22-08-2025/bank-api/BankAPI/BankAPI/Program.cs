using BankAPI.Context;
using BankAPI.Security;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Text;


var builder = WebApplication.CreateBuilder(args);

// Sql connection string from appsettings.json
builder.Services.AddDbContext<AppDBContext>(o => o.UseSqlServer(builder.Configuration.GetConnectionString("Sql")));
// Jwt configuration from appsettings.json
builder.Services.Configure<JWTOptions>(builder.Configuration.GetSection("Jwt"));

// Register JWTOptions for DI as a singleton
builder.Services.AddSingleton(resolver =>
    resolver.GetRequiredService<Microsoft.Extensions.Options.IOptions<JWTOptions>>().Value);

builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
    

// HttpClient for AuthService
builder.Services.AddHttpClient("AuthService", c =>
{
    c.BaseAddress = new Uri(builder.Configuration["AuthService:BaseUrl"]!);
});

// JWT Auth
var key = builder.Configuration["Jwt:Key"]!;
var issuer = builder.Configuration["Jwt:Issuer"]!;
var audience = builder.Configuration["Jwt:Audience"]!;

builder.Services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
.AddJwtBearer(o =>
{
    o.TokenValidationParameters = new TokenValidationParameters
    {
        ValidateIssuer = true,
        ValidateAudience = true,
        ValidateIssuerSigningKey = true,
        ValidIssuer = issuer,
        ValidAudience = audience,
        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(key)),
        RoleClaimType = "role"
    };
});

builder.Services.AddAuthorization(options =>
{
    options.AddPolicy("AdminOnly", p => p.RequireRole("admin"));
});


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseAuthentication();
app.UseAuthorization();

app.MapControllers();

app.Run();
