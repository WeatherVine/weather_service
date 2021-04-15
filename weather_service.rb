# require 'sinatra'
require 'json'
require 'faraday'
require 'pry'

# vintage = 2021
# grape_year = (vintage - 1)
#
# dates = [
#   ["#{grape_year}-01-01", "#{grape_year}-02-04"],
#   ["#{grape_year}-02-05", "#{grape_year}-03-11"],
#   ["#{grape_year}-03-12", "#{grape_year}-04-15"],
#   ["#{grape_year}-04-16", "#{grape_year}-05-20"],
#   ["#{grape_year}-05-21", "#{grape_year}-06-24"],
#   ["#{grape_year}-06-25", "#{grape_year}-07-29"],
#   ["#{grape_year}-07-30", "#{grape_year}-09-02"],
#   ["#{grape_year}-09-03", "#{grape_year}-10-07"],
#   ["#{grape_year}-10-08", "#{grape_year}-11-11"],
#   ["#{grape_year}-11-12", "#{grape_year}-12-16"],
#   ["#{grape_year}-12-17", "#{grape_year}-12-31"]
# ]
  get '/' do
    'Hello World!'
  end

  
  def find_avg_temp
    location = "Napa Valley"
    vintage = 2010
    grape_year = (vintage - 1)
    dates = [
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

    avg_temp = []

    dates.each do |range|
      response = Faraday.get("http://api.worldweatheronline.com/premium/v1/past-weather.ashx?key=900f2167e4ae442797e144340211404&q=#{location}&format=json&date=#{range[0]}&enddate=#{range[1]}&tp=24
        ")
      body = JSON.parse(response.body)

      avg_temps_array = body["data"]["weather"].map do |day|
        day["avgtempF"].to_i
      end
      avg_temp << avg_temps_array
    end

    avg_temp
  end

  def find_total_precip
    location = "Napa Valley"
    vintage = 2010
    grape_year = (vintage - 1)
    dates = [
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

    total_precip = []

    dates.each do |range|
      response = Faraday.get("http://api.worldweatheronline.com/premium/v1/past-weather.ashx?key=900f2167e4ae442797e144340211404&q=#{location}&format=json&date=#{range[0]}&enddate=#{range[1]}&tp=24
        ")
      body = JSON.parse(response.body)

      precip = body["data"]["weather"].map do |day|
        day["hourly"].first["precipInches"].to_f
      end

      total_precip << precip
    end

    total_precip
  end

average_annual_temp = (find_avg_temp.flatten.sum)/(find_avg_temp.flatten.size)
total_annual_precip = (find_total_precip.flatten.sum)
require "pry"; binding.pry
# response = Faraday.get("http://api.worldweatheronline.com/premium/v1/past-weather.ashx?key=900f2167e4ae442797e144340211404&q=Sonoma&format=json&date=2012-01-01&enddate=2012-02-04&tp=24
# ")
#
# body = JSON.parse(response.body)

# Temperature
# avg_temps_array = body["data"]["weather"].map do |day|
#   day["avgtempF"].to_i
# end
#
# average_temp = (avg_temps_array.sum)/(avg_temps_array.size)
#
# #Precipitation
# precip = body["data"]["weather"].map do |day|
#   day["hourly"].first["precipInches"].to_f
# end
#
# total_precip = precip.sum
