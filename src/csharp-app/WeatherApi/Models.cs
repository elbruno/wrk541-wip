namespace WeatherApi;

/// <summary>
/// Represents monthly weather data with high and low temperatures
/// </summary>
public record MonthlyWeather(int High, int Low);

/// <summary>
/// Represents the weather data structure loaded from weather.json
/// </summary>
public class WeatherData
{
    public Dictionary<string, Dictionary<string, Dictionary<string, MonthlyWeather>>> Data { get; set; } = new();
}
