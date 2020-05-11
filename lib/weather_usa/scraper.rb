
class Scraper
  # URL = "https://api.weather.gov/points/"

  def self.scrape_weather_dot_gov(url, latitude, longitude)
    weather_array = []
    doc = Scraper::get_doc(url + "#{latitude},#{longitude}/forecast")
    periods = doc["properties"]["periods"]
    
    periods.each do |period|
      weather = {}
      weather[:number] = period["number"]
      weather[:name] = period["name"]
      weather[:temperature] = period["temperature"]
      weather[:wind_speed] = period["windSpeed"]
      weather[:wind_direction] = period["windDirection"]
      weather[:short_forecast] = period["shortForecast"]
      weather[:detailed_forecast] = period["detailedForecast"] 
      
      weather_array << weather    
    end    
    weather_array
  end

  def self.get_doc(url)
    JSON.load(URI.open(url))       
  end

end