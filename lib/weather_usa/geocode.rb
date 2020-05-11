class Geocode
  attr_reader :latitude, :longitude, :name

  def initialize(search_term)
    result = Geocoder.search(search_term)
    location = result.find {|obj| obj.data["address"]["country_code"] == "us"} 
    @name = location.data["display_name"]
    @latitude = location.data["lat"]
    @longitude = location.data["lon"]    
  end

end