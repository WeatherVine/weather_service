require 'json'
require 'sinatra'
require 'sinatra/json'
require './app/services/weather_service'
require './models/climate'

class WeatherFacade

  def self.climate_data(region, vintage)
    data = WeatherService.data_call(region, vintage)
    if !data[0][:data][:error]
      temp_results = avg_temp(data)
      precip_results = total_precip(data)
      packager(temp_results, precip_results, region, vintage)
    else
      return data[0]
    end
  end

  def self.packager(temp, precip, region, vintage)
    start_date = "#{vintage.to_i - 1}-01-01"
    end_date   = "#{vintage.to_i - 1}-12-31"

    Climate.new(temp, precip, vintage, region, start_date, end_date)
  end

  def self.avg_temp(data)
    raw = temp_helper(data)
    raw.sum / raw.length
  end

  def self.temp_helper(data)
    data.flat_map do |range|
      range[:data][:weather].map do |day|
        day[:avgtempF].to_i
      end
    end
  end

  def self.total_precip(data)
    raw = precip_helper(data)
    raw.sum
  end

  def self.precip_helper(data)
    data.flat_map do |range|
      range[:data][:weather].map do |day|
        day[:hourly].first[:precipInches].to_f
      end
    end
  end
end
