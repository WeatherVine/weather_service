require './app/services/weather_service'
require 'rspec'
require 'rack/test'
require 'pry'
require 'spec_helper'

RSpec.describe 'the weather service' do
  include Rack::Test::Methods

  # def app
    # @app = WeatherServiceApp
  # end

  describe 'class methods' do
    it '::dates' do
      d = WeatherService.dates("2020")
      expect(d).to be_an(Array)
      expect(d.length).to eq(11)
      expect(d[0]).to eq(["2019-01-01", "2019-02-04"])
      expect(d[10]).to eq(["2019-12-17", "2019-12-31"])
    end
    it "::weather_connection" do
      wc = WeatherService.weather_connection

      expect(wc).to be_a(Faraday::Connection)
    end
    it "::data_call" do
      VCR.use_cassette('raw_data') do
        res = WeatherService.data_call('napa', '2018')
        expect(res.length).to eq(11)
        expect(res).to be_an(Array)
        expect(res[0]).to be_a(Hash)
        expect(res[0].length).to eq(1)
        expect(res[0][:data].length).to eq(2)
        expect(res[0][:data][:weather].length).to eq(35)
        expect(res[10][:data][:weather].length).to eq(15)
      end
    end
  end
end
