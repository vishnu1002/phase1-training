using BankAPI.Context;
using BankAPI.DTOs;
using BankAPI.Models;
using BankAPI.Security;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using System.Linq;
using System.Security.Claims;
using static BankAPI.DTOs.CustomerDTO;

namespace BankAPI.Controllers;

[ApiController]
public class CustomerController : ControllerBase
{
    private readonly AppDBContext _context;
    private readonly JWTOptions _jwtOptions;

    public CustomerController(AppDBContext context, JWTOptions jwtOptions)
    {
        _context = context;
        _jwtOptions = jwtOptions;
    }



    // -------------------
    // LOGIN - calls FastAPI
    // -------------------

    [AllowAnonymous]
    [HttpPost("/Login")]
    public async Task<IActionResult> Login([FromBody] LoginDTO login, [FromServices] IHttpClientFactory clientFactory)
    {
        var client = clientFactory.CreateClient("AuthService");

        // Call FastAPI /auth/verify
        var response = await client.PostAsJsonAsync("/auth/verify", login);
        if (!response.IsSuccessStatusCode)
            return Unauthorized("Invalid credentials");

        var result = await response.Content.ReadFromJsonAsync<VerifyOutDTO>();
        if (result == null || !result.Valid)
            return Unauthorized("Invalid credentials");

        // Generate JWT with role
        var claims = new List<Claim>
    {
        new Claim(ClaimTypes.NameIdentifier, login.Username),
        new Claim(ClaimTypes.Name, login.Username),
        new Claim("role", result.Role ?? "user") // default to "user"
    };

        var token = JWTService.CreateJWTToken(_jwtOptions, claims);
        return Ok(new { token });
    }



    // -------------------
    // ADD CUSTOMER - Admin only
    // -------------------
    [Authorize(Roles = "admin")]
    [HttpPost("/AddCustomer")]
    public IActionResult AddCustomer([FromBody] CustomerDto customer)
    {
        var newCustomer = new CustomerModel
        {
            Name = customer.Name,
            Age = customer.Age,
            Username = customer.Username
        };

        // Add accounts if any
        if (customer.Accounts != null)
        {
            foreach (var acc in customer.Accounts)
            {
                newCustomer.Accounts.Add(new AccountModel
                {
                    AccountNumber = acc.AccountNumber,
                    Amount = acc.Amount
                });
            }
        }

        _context.Customers.Add(newCustomer);
        _context.SaveChanges();

        return Ok(customer);
    }



    // -------------------
    // GET BALANCE - Logged in user
    // -------------------
    [Authorize]
    [HttpGet("/GetBalance")]
    public IActionResult GetBalance()
    {
        // Identify the logged-in user
        var username = User.Identity?.Name;
        if (string.IsNullOrEmpty(username))
            return Unauthorized();

        var customer = _context.Customers
            .Include(c => c.Accounts)
            .FirstOrDefault(c => c.Username == username);

        if (customer == null)
            return NotFound("Customer not found");

        var totalBalance = customer.Accounts.Sum(a => a.Amount);
        return Ok(new { Username = customer.Username, Balance = totalBalance });
    }



    // -------------------
    // List all customers - Admin only
    // -------------------
    //[Authorize(Roles = "admin")]
    [HttpGet("/AllCustomers")]
    public IActionResult GetAllCustomers()
    {
        var userClaims = User.Claims.Select(c => new { c.Type, c.Value }).ToList();
        Console.WriteLine(System.Text.Json.JsonSerializer.Serialize(userClaims));

        var customers = _context.Customers
            .Include(c => c.Accounts)
            .Select(c => new CustomerDto
            {
                Id = c.Id,
                Name = c.Name,
                Age = c.Age,
                Username = c.Username,
                Accounts = c.Accounts.Select(a => new AccountDto
                {
                    Id = a.Id,
                    AccountNumber = a.AccountNumber,
                    Amount = a.Amount
                }).ToList()
            }).ToList();

        return Ok(customers);
    }
}
