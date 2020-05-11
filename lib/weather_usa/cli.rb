class WeatherUsa::CLI

  BASE_PATH = "https://api.weather.gov/points/"
  
  def call
    self.greeting
    self.new_location
    
  end

  def new_location
    self.ask_for_new_location
    @input = gets.strip
    self.get_weather_information
    self.display_current_conditions
    self.options    
  end

  def greeting
    puts
    puts 
    puts "                Welcome to Weather USA!".blue    
  end

  def ask_for_new_location       
    puts "  Please enter a geographic location in the United States.".blue
    puts "      (This can be a zip code or a city and state)".blue
    puts
    puts    
  end

  def options
    puts
    puts
    puts "    What would you like to do? (Please select an option.)".blue
    puts
    puts "    1) See a detailed forecast for the current location.".blue
    puts
    puts "    2) Choose a different location.".blue
    puts
    puts "    3) Exit the program.".blue
    puts
    puts
    option = gets.strip.to_s
    case option
    when "1"
      self.display_detailed_forecast
      self.options      
    when "2"      
      self.new_location
    when "3"
      puts
      puts
      puts "  Thank you for using Weather USA.".blue
      puts
      puts
      exit
    else
      self.options
    end
  end

  def display_current_conditions
    current = self.current_conditions
    puts ""
    puts "  #{current.name} for your selected location, ".blue + "#{@location.name}".red + ",".blue
    puts "      the current temperature is ".blue + "#{current.temperature}".red + ",".blue
    puts "      the current wind speed is ".blue + "#{current.wind_speed}".red + " from the ".blue + "#{current.wind_direction}".red + ".".blue
    puts "      Expected conditions: ".blue + "#{current.short_forecast}".red

  end

  def display_detailed_forecast
    puts
    puts
    puts "    #{current_conditions.detailed_forecast}".red
    puts
    puts
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

  def current_conditions
    Weather.all[0]
  end





 

  
    
  
end

