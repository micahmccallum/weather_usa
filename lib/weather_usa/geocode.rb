class Geocode

  def self.get_location(search_term)
    Geocode.search(search_term)
  end

end