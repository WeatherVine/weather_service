require 'fast_jsonapi'

class ClimateSerializer
  include FastJsonapi::ObjectSerializer
  attributes :temp, :precip, :vintage, :location, :start_date, :end_date
end
