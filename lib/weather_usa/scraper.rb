
class Scraper
  
  def self.scrape_weather_dot_gov(url, location)

    
    weather_array = []
    current = {}
    base_url = url + "points/#{location.latitude},#{location.longitude}"
    station_url = base_url + "/stations"
    forecast_url = base_url + "/forecast"
    station_doc = Scraper::get_doc(station_url)
    station_id = station_doc["features"].first["properties"]["stationIdentifier"]
    station_name = station_doc["features"].first["properties"]["name"]
    current_url = url + "stations/#{station_id}/observations/latest"
    current_doc = Scraper::get_doc(current_url)
    
    
    current[:weather_description] = current_doc["properties"]["textDescription"]
    current[:temperature] = current_doc["properties"]["temperature"]["value"]
    current[:station_name] = station_name
    
    zone_doc = Scraper::get_doc(base_url)
    zone_id = zone_doc["properties"]["forecastZone"].split("/").last
    alert_url  = url + "alerts/active/zone/#{zone_id}"
    alerts = Scraper::get_doc(alert_url)
    if alerts["features"].count > 0
      current[:alert_headline] = alerts["features"][0]["properties"]["headline"]
      current[:alert_description] = alerts["features"][0]["properties"]["description"]
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
      weather_period[:is_daytime] = period["isDaytime"]     
      weather_array << weather_period    
    end    
    weather_array[0][:current] = current
    binding.pry
    weather_array
  end

  def self.get_doc(url)
    JSON.load(URI.open(url))       
  end

end