class Climate
  attr_reader :temp,
              :precip,
              :vintage,
              :region,
              :start_date,
              :end_date,
              :id

  def initialize(temp, precip, vintage, region, start_date, end_date)
    @id         = nil
    @temp       = temp
    @precip     = precip
    @vintage    = vintage
    @region     = region
    @start_date = start_date
    @end_date   = end_date
  end
end
