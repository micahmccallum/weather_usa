class Geocode
  attr_accessor :latitude, :longitude

  def initialize(search_term)
    result = Geocoder.search(search_term)
    location = result.find {|obj| obj.data["address"]["country_code"] == "us"}
    self.latitude = location.data["lat"]
    self.longitude = location.data["lon"]    
  end

end