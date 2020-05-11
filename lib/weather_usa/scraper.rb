
class Scraper
  
  def self.scrape_weather_dot_gov(url, location)
    
    doc = Scraper::get_doc(url + "#{location.latitude},#{location.longitude}/forecast")
    periods = doc["properties"]["periods"]
    weather_array = []
    periods.each do |period|

      weather_period = {}
      weather_period[:number] = period["number"]
      weather_period[:name] = period["name"]
      weather_period[:temperature] = period["temperature"]
      weather_period[:wind_speed] = period["windSpeed"]
      weather_period[:wind_direction] = period["windDirection"]
      weather_period[:short_forecast] = period["shortForecast"]
      weather_period[:detailed_forecast] = period["detailedForecast"] 
      
      weather_array << weather_period    
    end 
    weather_array
  end

  def self.get_doc(url)
    JSON.load(URI.open(url))       
  end

end