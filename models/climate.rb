class Climate
  attr_reader :temp,
              :precip,
              :vintage,
              :location,
              :start_date,
              :end_date,
              :id

  def initialize(temp, precip, vintage, location, start_date, end_date)
    @id       = nil
    @temp     = temp
    @precip   = precip
    @vintage  = vintage
    @location = location
  end
end
