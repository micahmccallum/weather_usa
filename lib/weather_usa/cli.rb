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
    puts "    2) See an extended forecast.".blue
    puts
    puts "    3) Choose a different location.".blue
    puts
    puts "    4) Exit the program.".blue
    option = gets.strip.to_s
    case option
    when "1"
      self.display_detailed_forecast
      self.options
    when "2"
      self.display_extended_forecast
      self.options
    when "3"      
      self.new_location
    when "4"
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
    puts "      Expected conditions: ".blue + "#{current.short_forecast}.".red

  end

  def display_detailed_forecast 
    detailed_forecast = current_conditions.detailed_forecast.split(".")
    puts
    puts
    detailed_forecast.each do |line|
      puts "    #{line}.".red
    end
    puts
    puts
  end

  def display_extended_forecast
    extended_forecast = Weather.all
    puts
    puts
    extended_forecast.each do |period|
      period.name.include?("ight") ? am_pm = "Low" : am_pm = "High"
      puts
      puts "    #{period.name}".red
      puts "        #{period.short_forecast}".red
      puts "        #{am_pm} temperature: ".blue + "#{period.temperature}".red      
    end
  end

  def get_weather_information
    self.get_location
    self.scrape_weather_site
    self.create_weather_objects_from_array        
  end

  def get_location
    @location = Geocode.get_geocode(@input)
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

