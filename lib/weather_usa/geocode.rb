class Geocode
  attr_reader :latitude, :longitude, :name

  def initialize(result)
    location = result.find {|obj| obj.data["address"]["country_code"] == "us"} 
    @name = location.data["display_name"]
    @latitude = location.data["lat"]
    @longitude = location.data["lon"]    
  end

  def self.get_geocode(search_term)
    result = Geocoder.search(search_term)
    if !(result.find {|obj| obj.data["address"]["country_code"] == "us"})
      puts
      puts "    Please enter a valid search.".red
      puts
      print "    >>  ".green
      input = gets.strip
      self.get_geocode(input)
    else
      Geocode.new(result)
    end   
  end

end