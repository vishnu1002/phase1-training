namespace API_Post;
class Program
{
    static async Task Main()
    {
        using HttpClient client = new HttpClient();

        string baseUrl = "https://jsonplaceholder.typicode.com/";

        try
        {
            string result = await client.GetStringAsync($"{baseUrl}posts");
            Console.WriteLine(result);
        }
        catch (Exception ex)
        {
            Console.WriteLine($"Error: {ex.Message}");
        }
    }
}