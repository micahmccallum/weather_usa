
class Scraper
  # URL = "https://api.weather.gov/points/"

  def self.scrape_weather_dot_gov(url, latitude, longitude)
    doc = Scraper::get_doc(url + "#{latitude},#{longitude}/forecast")
   
    binding.pry
  end

  def self.get_doc(url)
    JSON.load(URI.open(url))       
  end

end