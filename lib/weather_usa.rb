require "pry"
require "rspec"
require "geocoder"
require "nokogiri"
require "open-uri"
require "json/ld"
require "colorize"

require "weather_usa/version"
require "weather_usa/cli"
require "weather_usa/scraper"
require "weather_usa/weather"
require "weather_usa/geocode"




module WeatherUsa
  class Error < StandardError; end
  # Your code goes here...
end
