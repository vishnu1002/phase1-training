namespace BankAPI.DTOs;

public class CustomerDTO
{
    public class CustomerDto
    {
        public int Id { get; set; }
        public string Name { get; set; } = string.Empty;
        public int Age { get; set; }
        public string Username { get; set; } = string.Empty;

        public List<AccountDto> Accounts { get; set; } = new();
    }

    public class AccountDto
    {
        public int Id { get; set; }
        public string AccountNumber { get; set; } = string.Empty;
        public decimal Amount { get; set; }
    }
}
