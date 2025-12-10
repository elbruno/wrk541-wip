# Weather API - C# Implementation

A travel weather API built with ASP.NET Core Minimal APIs, demonstrating migration from Python/FastAPI to C#/.NET.

## Features

- ✅ Minimal API endpoints
- ✅ Swagger/OpenAPI integration
- ✅ MSTest unit tests
- ✅ Weather data for multiple countries and cities
- ✅ JSON-based data storage

## Requirements

- .NET 10 SDK or later
- Visual Studio Code with C# Dev Kit (recommended)

## Project Structure

```
csharp-app/
├── WeatherApi/           # Main application
│   ├── Program.cs        # Application entry point and endpoint definitions
│   ├── Models.cs         # Data models
│   └── weather.json      # Weather data
└── WeatherApi.Tests/     # MSTest unit tests
    └── Test1.cs          # Integration tests
```

## Running the Application

### Using dotnet CLI

```bash
cd src/csharp-app/WeatherApi
dotnet run
```

The application will start on `http://localhost:5000` by default.

To run on a specific port (e.g., port 8000 to match Python app):

```bash
dotnet run --urls "http://localhost:8000"
```

### Using Visual Studio Code

1. Open the `src/csharp-app` folder in VS Code
2. Press F5 or click Run → Start Debugging
3. Select ".NET Core Launch (web)" configuration

## API Endpoints

### Root Endpoint
- **GET /** - Redirects to Swagger UI at `/docs`
- Returns: HTTP 301 redirect

### Countries Endpoint
- **GET /countries** - Returns list of all countries
- Returns: JSON array of country names
- Example: `["England", "France", "Germany", "Italy", "Peru", "Portugal", "Spain"]`

### Monthly Weather Endpoint
- **GET /countries/{country}/{city}/{month}** - Returns weather data
- Parameters:
  - `country`: Country name (e.g., "England")
  - `city`: City name (e.g., "London")
  - `month`: Month name (e.g., "January")
- Returns: JSON object with high and low temperatures
- Example: `{"high": 45, "low": 36}`

## API Documentation

Once the application is running, visit:
- Swagger UI: `http://localhost:8000/docs` (or your configured port)
- OpenAPI JSON: `http://localhost:8000/swagger/v1/swagger.json`

## Running Tests

### Run all tests

```bash
cd src/csharp-app/WeatherApi.Tests
dotnet test
```

### Run tests with detailed output

```bash
dotnet test --logger "console;verbosity=normal"
```

### Test Coverage

The test suite includes:
- ✅ Root redirect endpoint test
- ✅ Countries list endpoint test
- ✅ Monthly weather data endpoint test
- ✅ Error handling tests (invalid country, city, month)

All tests use MSTest framework with WebApplicationFactory for integration testing.

## Building the Application

```bash
cd src/csharp-app/WeatherApi
dotnet build
```

## Publishing the Application

For production deployment:

```bash
cd src/csharp-app/WeatherApi
dotnet publish -c Release -o out
```

## Comparison with Python Implementation

| Feature | Python (FastAPI) | C# (Minimal API) |
|---------|------------------|------------------|
| Framework | FastAPI | ASP.NET Core Minimal API |
| Default Port | 8000 | 5000 |
| API Docs | /docs (auto) | /docs (Swagger UI) |
| OpenAPI | Built-in | Swashbuckle |
| Testing | pytest | MSTest |
| JSON Serialization | Pydantic | System.Text.Json |

## Migration Notes

This C# implementation maintains full API compatibility with the original Python version:
- Same endpoint paths
- Same JSON response structure
- Same HTTP status codes
- Compatible data models

### Key Differences

1. **Port Configuration**: Default port is 5000 instead of 8000. Use `--urls` parameter to change.
2. **Redirect Status Code**: Uses 301 (permanent) instead of 302 (temporary) for root redirect.
3. **Type Safety**: C# provides compile-time type checking vs Python's runtime checking.
4. **Performance**: Generally faster execution and lower memory footprint.

## Troubleshooting

### Port Already in Use

If you get an error about the port being in use:

```bash
# Find and kill the process using the port (Linux/Mac)
lsof -ti:8000 | xargs kill -9

# Or use a different port
dotnet run --urls "http://localhost:8001"
```

### weather.json Not Found

Make sure the `weather.json` file is copied to the output directory. This is configured in `WeatherApi.csproj`:

```xml
<ItemGroup>
  <None Update="weather.json">
    <CopyToOutputDirectory>PreserveNewest</CopyToOutputDirectory>
  </None>
</ItemGroup>
```

## Development

### Adding New Endpoints

Add new endpoints in `Program.cs` after the weather data is loaded:

```csharp
app.MapGet("/new-endpoint", () => Results.Ok("Response"))
    .WithName("EndpointName")
    .WithTags("Category")
    .WithSummary("Description");
```

### Modifying Models

Update `Models.cs` to add new properties or classes. The JSON serializer will automatically handle the new structure.

### Writing Tests

Add new test methods to `WeatherApi.Tests/Test1.cs`:

```csharp
[TestMethod]
public async Task TestNewEndpoint()
{
    var response = await _client!.GetAsync("/new-endpoint");
    Assert.AreEqual(HttpStatusCode.OK, response.StatusCode);
}
```

## License

See the repository LICENSE file for details.
