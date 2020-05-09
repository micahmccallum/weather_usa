class WeatherUsa::CLI

  BASE_PATH = "https://api.weather.gov/points/"
  
  def call
    self.menu
    #use for calling all of the methods in this class
  end

  def menu
    self.greeting
    initial_location = gets.strip
    location = self.get_geocode(initial_location)
    @weather = Weather.new(Scraper.scrape_weather_dot_gov(BASE_PATH, location.latitude, location.longitude))
    binding.pry

  
  end

  def greeting
    puts "Welcome to Weather USA!"
    puts "Please enter a geographic location in the United States."
    puts "(This can be a zip code or a city and state)"
  end

  def get_geocode(location)
    Geocode.new(location)
  end

  def get_weather
    Weather.new(Scraper.new(BASE_PATH))    
  end




 

  
    
  
end