ENV['APP_ENV'] = 'test'

require './weather_service'
require 'rspec'
require 'rack/test'
require 'pry'
require './app/controllers/weather_service_app'

describe 'Climate Data API' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'has a successful response' do
    get '/climate_data'

    binding.pry
    expect(last_response).to be_ok
  end
end