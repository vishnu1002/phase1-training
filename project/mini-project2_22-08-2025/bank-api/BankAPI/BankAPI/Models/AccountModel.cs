namespace BankAPI.Models;

public class AccountModel
{
    public int Id { get; set; }
    public string AccountNumber { get; set; } = default!; // unique
    public decimal Amount { get; set; }

    public int CustomerId { get; set; } // Only FK, no navigation back to Customer
}
