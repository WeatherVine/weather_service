class Climate
  attr_reader :temp,
              :precip,
              :vintage,
              :location
              
  def initialize(temp, precip, vintage, location)
    @temp = temp
    @precip = precip
    @vintage = vintage
    @location = location
  end
end
