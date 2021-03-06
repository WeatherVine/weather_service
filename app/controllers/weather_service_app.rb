require 'json'
require 'faraday'
require 'fast_jsonapi'
require 'sinatra'
require './app/services/weather_service'
require './models/climate'
require 'sinatra/json'
require './app/serializers/climate_serializer'
require './app/facades/weather_facade'


class WeatherServiceApp < Sinatra::Base
  before do
    content_type :json
  end

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
    else

      data = WeatherFacade.climate_data(params[:region], params[:vintage])

      if data.class != Climate
        data.to_json
      else
        body ClimateSerializer.new(data).serialized_json
        status 200
      end
    end
  end
end
