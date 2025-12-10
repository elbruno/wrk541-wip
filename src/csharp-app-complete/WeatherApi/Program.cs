using System.Text.Json;
using WeatherApi;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(c =>
{
    c.SwaggerDoc("v1", new() { Title = "Weather API", Version = "v1" });
});

var app = builder.Build();

// Load weather data from JSON file
var weatherDataPath = Path.Combine(AppContext.BaseDirectory, "weather.json");
var weatherJson = File.ReadAllText(weatherDataPath);
var weatherData = JsonSerializer.Deserialize<Dictionary<string, Dictionary<string, Dictionary<string, MonthlyWeather>>>>(weatherJson, new JsonSerializerOptions
{
    PropertyNameCaseInsensitive = true
}) ?? new Dictionary<string, Dictionary<string, Dictionary<string, MonthlyWeather>>>();

// Configure Swagger UI
app.UseSwagger();
app.UseSwaggerUI(c =>
{
    c.SwaggerEndpoint("/swagger/v1/swagger.json", "Weather API v1");
    c.RoutePrefix = "docs"; // Swagger UI at /docs
});

// Root endpoint - redirect to Swagger docs
app.MapGet("/", () => Results.Redirect("/docs", permanent: true))
    .WithName("Root")
    .WithTags("Navigation");

// Countries endpoint - return list of all countries
app.MapGet("/countries", () =>
{
    return Results.Ok(weatherData.Keys.ToList());
})
.WithName("GetCountries")
.WithTags("Weather")
.WithSummary("Get all countries")
.WithDescription("Returns a list of all countries with weather data");

// Monthly average endpoint - return weather data for specific country/city/month
app.MapGet("/countries/{country}/{city}/{month}", (string country, string city, string month) =>
{
    if (!weatherData.ContainsKey(country))
    {
        return Results.NotFound($"Country '{country}' not found");
    }
    
    if (!weatherData[country].ContainsKey(city))
    {
        return Results.NotFound($"City '{city}' not found in country '{country}'");
    }
    
    if (!weatherData[country][city].ContainsKey(month))
    {
        return Results.NotFound($"Month '{month}' not found for city '{city}' in country '{country}'");
    }
    
    return Results.Ok(weatherData[country][city][month]);
})
.WithName("GetMonthlyAverage")
.WithTags("Weather")
.WithSummary("Get monthly weather average")
.WithDescription("Returns the high and low temperatures for a specific country, city, and month");

app.Run();

// Make the Program class accessible for testing
public partial class Program { }

