require './models/climate'
require 'json'
require 'faraday'
require 'pry'
require 'fast_jsonapi'
require 'sinatra'
require './weather_service'
require './models/climate'
require 'sinatra/json'

class WeatherServiceApp < Sinatra::Base
  set :root, File.expand_path("..", __dir__)

  get '/api/v1/climate_data' do
    climate = Climate.new(temp, precip, vintage, location)

    json ({
          data: {
            type: "climate",
            id: 1,
            attributes: climate
          }
        })
  end

end
