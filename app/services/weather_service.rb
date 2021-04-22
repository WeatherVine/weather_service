require 'json'
require 'faraday'
require './models/climate'
require 'figaro/sinatra'

class WeatherService

  def self.dates(vintage)
    grape_year = (vintage.to_i) - 1
    [
      ["#{grape_year}-01-01", "#{grape_year}-02-04"],
      ["#{grape_year}-02-05", "#{grape_year}-03-11"],
      ["#{grape_year}-03-12", "#{grape_year}-04-15"],
      ["#{grape_year}-04-16", "#{grape_year}-05-20"],
      ["#{grape_year}-05-21", "#{grape_year}-06-24"],
      ["#{grape_year}-06-25", "#{grape_year}-07-29"],
      ["#{grape_year}-07-30", "#{grape_year}-09-02"],
      ["#{grape_year}-09-03", "#{grape_year}-10-07"],
      ["#{grape_year}-10-08", "#{grape_year}-11-11"],
      ["#{grape_year}-11-12", "#{grape_year}-12-16"],
      ["#{grape_year}-12-17", "#{grape_year}-12-31"]
    ]
  end

  def self.data_call(region, vintage)
    dates(vintage).map do |range|
      response = weather_connection.get("/premium/v1/past-weather.ashx?key=#{ENV['WEATHER_API_KEY']}&q=#{region}&format=json&date=#{range[0]}&enddate=#{range[1]}&tp=24")

      body = JSON.parse(response.body, symbolize_names: true)
    end
  end

  def self.weather_connection
    weather_connection ||= Faraday.new({
      url: "#{ENV['WEATHER_API_URL']}"
    })
  end
end
