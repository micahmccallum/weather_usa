
class Scraper
  
  def self.scrape_weather_dot_gov(url, location)
    
    weather_array = []
    alert = {}
    base_url = url + "points/#{location.latitude},#{location.longitude}"
    forecast_url = base_url + "/forecast"
    zone_doc = Scraper::get_doc(base_url)
    zone = zone_doc["properties"]["forecastZone"].split("/").last
    alert_url  = url + "alerts/active/zone/#{zone}"
    alerts = Scraper::get_doc(alert_url)
    if alerts["features"].count > 0
      alerts["features"].each do |feature|
        alert[:headline] = feature["properties"]["headline"]
        alert[:description] = feature["properties"]["description"]
      end
    end    
    forecast_doc = Scraper::get_doc(forecast_url)
    periods = forecast_doc["properties"]["periods"]
    
    
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
    weather_array[0][:alert] = alert
    weather_array
  end

  def self.get_doc(url)
    JSON.load(URI.open(url))       
  end

end