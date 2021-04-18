ENV['APP_ENV'] = 'test'

require './weather_service'
require 'rspec'
require 'rack/test'
require 'pry'
require 'spec_helper'
require './app/controllers/weather_service_app'

describe 'Climate Data API' do
  include Rack::Test::Methods

  def app
    @app = WeatherServiceApp
  end

  it 'has a successful response' do
    VCR.use_cassette('climate_data') do
      get '/climate_data'

      expect(last_response).to be_ok
    end
  end

  it 'outputs the right data' do
    VCR.use_cassette('climate_data') do
      get '/climate_data'
      parsed = JSON.parse(last_response.body, symbolize_names: true)
      data = parsed[:data]
      
      expect(data[:type]).to eq("climate")
      expect(data[:id]).to eq(1)
      expect(data[:attributes]).to have_key(:temp)
      expect(data[:attributes]).to have_key(:precip)
      expect(data[:attributes]).to have_key(:vintage)
      expect(data[:attributes]).to have_key(:location)
    end
  end
end