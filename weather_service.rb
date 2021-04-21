require 'json'
require 'faraday'
require 'pry'
require './models/climate'


def dates
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

def region
  params[:region]
end

def vintage
  params[:vintage].to_i
end

def grape_year
  vintage - 1
end

# def start_date
# end

# def end_date
# end

def find_avg_temp
  avg_temp = []
  dates.each do |range|
    response = Faraday.get("http://api.worldweatheronline.com/premium/v1/past-weather.ashx?key=900f2167e4ae442797e144340211404&q=#{region}&format=json&date=#{range[0]}&enddate=#{range[1]}&tp=24
    ")

    body = JSON.parse(response.body, symbolize_names: true)

    avg_temps_array = body[:data][:weather].map do |day|
      day[:avgtempF].to_i
    end
    avg_temp << avg_temps_array
  end

  avg_temp
end

def temp
  (find_avg_temp.flatten.sum)/(find_avg_temp.flatten.size)
end

# def weather_connection #.self in service
  # weather_connection ||= Faraday.new({
    # url: 'http://api.worldweatheronline.com' # ENV['WEATHER_API_URL']
  # })
# end

def find_total_precip
  total_precip = []

  dates.each do |range|
    # response = weather_connection.get("/premium/v1/past-weather.ashx?key=900f2167e4ae442797e144340211404&q=#{region}&format=json&date=#{range[0]}&enddate=#{range[1]}&tp=24")
    response = Faraday.get("http://api.worldweatheronline.com/premium/v1/past-weather.ashx?key=900f2167e4ae442797e144340211404&q=#{region}&format=json&date=#{range[0]}&enddate=#{range[1]}&tp=24
    ")
    body = JSON.parse(response.body, symbolize_names: true)

    precip = body[:data][:weather].map do |day|
      day[:hourly].first[:precipInches].to_f
    end

    total_precip << precip
  end

  total_precip
end

def precip
  find_total_precip.flatten.sum
end

def bad_region?(region_param)
  response = Faraday.get("http://api.worldweatheronline.com/premium/v1/past-weather.ashx?key=900f2167e4ae442797e144340211404&q=#{region_param}&format=json")
  body = JSON.parse(response.body)
  out = body[:data].keys.include?(:error)
  require "pry"; binding.pry
end
