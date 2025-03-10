using Microsoft.AspNetCore.Mvc;
using System.Data.SqlClient;
 
[Route("api/database")]
[ApiController]
public class DatabaseController : ControllerBase
{
    private readonly string _connectionString = "Server=localhost;Database=AutoTest;User Id=Auto_user;Password=@Use25;";
 
    [HttpGet("test")]
    public IActionResult TestConnection()
    {
        try
        {
            using (SqlConnection conn = new SqlConnection(_connectionString))
            {
                conn.Open();
                return Ok("SQL Server connection successful!");
            }
        }
        catch (Exception ex)
        {
            return StatusCode(500, ex.Message);
        }
    }
}
