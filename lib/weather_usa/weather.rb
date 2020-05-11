class Weather
  attr_accessor :number, :name, :temperature, :wind_speed, :wind_direction,
                 :short_forecast, :detailed_forecast

  @@all = []

  def initialize(weather_hash)
    weather_hash.each do |k, v|
      self.send "#{k}=", v         
    end    
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear_all
    @@all = []
  end

  
end