require 'json'
require 'faraday'
require 'pry'
require 'fast_jsonapi'
require 'sinatra'
require './weather_service'
require './models/climate'
require 'sinatra/json'
require './app/serializers/climate_serializer'


class WeatherServiceApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/api/v1/climate_data' do

    if params.empty?
      json ({:error => 'Please provide a region and vintage year'})
    elsif params[:region].nil?
      json ({:error => 'Please provide a region'})
    elsif params[:vintage].nil?
      json ({:error => 'Please provide a vintage year'})
    elsif !params[:vintage].to_i.between?(1970,2020)
      json ({:error => 'Please provide a vintage year between 1970 and 2020'})
    elsif params.count < 2 || params.count > 2
      json ({:error => 'Please provide only a region and vintage year'})
    # elsif bad_region?(params[:region])
      # json ({:error => 'Not Found'})
    else

      climate = Climate.new(temp, precip, vintage, region, start_date, end_date)

      # json ({
            # data: {
              # type: "climate",
              # id: 1,
              # attributes: climate
              # }
            # })
      body ClimateSerializer.new(climate).serialized_json
      status 200
    end
  end
end
