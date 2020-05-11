class WeatherUsa::CLI

  BASE_PATH = "https://api.weather.gov/points/"
  
  def call
    self.menu
    #use for calling all of the methods in this class
  end

  def menu

    self.greeting
    @input = gets.strip
    self.get_weather_information
    
    binding.pry  
  end

  def greeting
    puts "Welcome to Weather USA!"
    puts "Please enter a geographic location in the United States."
    puts "(This can be a zip code or a city and state)"
  end

  def get_weather_information
    self.get_location
    self.scrape_weather_site
    self.create_weather_objects_from_array        
  end

  def get_location
    @location = Geocode.new(@input)
  end 

  def scrape_weather_site
    @weather_array = Scraper.scrape_weather_dot_gov(BASE_PATH, @location)
  end

  def create_weather_objects_from_array    
    @weather_array.each do |period|
      Weather.new(period)
    end 
  end






 

  
    
  
end

