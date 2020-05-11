class Weather
  attr_accessor :location, :current_temp, :forecast

  def initialize(weather)
    binding.pry
    attribute_hash.each do |attribute|
      self.send "#{k}=", v      
    end
    self
  end

end