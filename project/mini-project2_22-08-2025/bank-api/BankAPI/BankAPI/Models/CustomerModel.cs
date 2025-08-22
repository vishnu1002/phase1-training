namespace BankAPI.Models;

public class CustomerModel
{
    public int Id { get; set; }
    public string Name { get; set; }
    public int Age { get; set; }
    public string Username { get; set; }
    
    public List<AccountModel> Accounts { get; set; } = new(); // Customer → Accounts
}
