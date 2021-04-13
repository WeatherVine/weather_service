require 'sinatra/base'

class WeatherService < Sinatra::Base

  get '/' do
    'Hello World!'
  end

end 
