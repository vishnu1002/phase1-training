namespace BankAPI.DTOs
{
    public class VerifyOutDTO
    {
        public bool Valid { get; set; }
        public string? Role { get; set; } // "admin" or "user"
        public string? Reason { get; set; }
    }
}
