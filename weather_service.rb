require 'sinatra'

class WeatherService < Sinatra::Base

  get '/' do
    'Hello World!'
  end

end
