require './app/facades/weather_facade'
require './app/services/weather_service'
require 'rspec'
require 'rack/test'
require 'pry'
require 'spec_helper'

RSpec.describe 'the weather facade' do
  include Rack::Test::Methods

  # def app
    # @app = WeatherServiceApp
  # end

  describe 'class methods' do
    describe '::climate_data' do
      it 'happy path returns Climate object with required methods / data' do
        VCR.use_cassette('facade_climate_data') do
          res = WeatherFacade.climate_data('napa', '2018')
          expect(res).to be_a(Climate)
          expect(res.respond_to?('id')).to eq(true)
          expect(res.respond_to?('start_date')).to eq(true)
          expect(res.respond_to?('end_date')).to eq(true)
          expect(res.respond_to?('precip')).to eq(true)
          expect(res.respond_to?('region')).to eq(true)
          expect(res.respond_to?('temp')).to eq(true)
          expect(res.respond_to?('vintage')).to eq(true)
          expect(res.end_date).to eq("2017-12-31")
          expect(res.id).to eq(nil)
          expect(res.precip).to eq(40.2)
          expect(res.region).to eq("napa")
          expect(res.start_date).to eq("2017-01-01")
          expect(res.temp).to eq(64)
          expect(res.vintage).to eq("2018")
        end
      end
      it "sad path returns error message" do
        VCR.use_cassette('facade_climate_sad') do
          res = WeatherFacade.climate_data('xxxx', '2018')
          msg = {:msg=>"Unable to find any matching weather location to the query submitted!"}
          expect(res).to be_a(Hash)
          expect(res.keys).to eq([:data])
          expect(res[:data].keys).to eq([:error])
          expect(res[:data][:error]).to be_an(Array)
          expect(res[:data][:error][0]).to eq(msg)
        end
      end
    end
    describe '::packager' do
      it 'returns Climate object with correct data' do
        VCR.use_cassette('facade_climate_data') do
          pkg = WeatherFacade.packager(64, 40.2, 'napa', '2018')
          expect(pkg).to be_a(Climate)
          expect(pkg.respond_to?('id')).to eq(true)
          expect(pkg.respond_to?('start_date')).to eq(true)
          expect(pkg.respond_to?('end_date')).to eq(true)
          expect(pkg.respond_to?('precip')).to eq(true)
          expect(pkg.respond_to?('region')).to eq(true)
          expect(pkg.respond_to?('temp')).to eq(true)
          expect(pkg.respond_to?('vintage')).to eq(true)
          expect(pkg.end_date).to eq("2017-12-31")
          expect(pkg.id).to eq(nil)
          expect(pkg.precip).to eq(40.2)
          expect(pkg.region).to eq("napa")
          expect(pkg.start_date).to eq("2017-01-01")
          expect(pkg.temp).to eq(64)
          expect(pkg.vintage).to eq("2018")
        end
      end
    end
    describe '::avg_temp' do
      it 'returns average temp integer' do
        VCR.use_cassette('facade_climate_data') do
          data = WeatherService.data_call('napa', '2018')
          res = WeatherFacade.avg_temp(data)
          expect(res).to be_an(Integer)
          expect(res).to eq(64)
        end
      end
    end
    describe '::temp_helper' do
      it 'returns temps array' do
        VCR.use_cassette('facade_climate_data') do
          data = WeatherService.data_call('napa', '2018')
          res = WeatherFacade.temp_helper(data)
          expect(res).to be_an(Array)
          expect(res.length).to eq(365)
          expect(res.sum / 365).to eq(64)
        end
      end
    end
    describe '::total_precip' do
      it 'returns total precip float' do
        VCR.use_cassette('facade_climate_data') do
          data = WeatherService.data_call('napa', '2018')
          res = WeatherFacade.total_precip(data)
          expect(res).to be_a(Float)
          expect(res).to eq(40.2)
        end
      end
    end
    describe '::precip_helper' do
      it 'returns precip Array' do
        VCR.use_cassette('facade_climate_data') do
          data = WeatherService.data_call('napa', '2018')
          res = WeatherFacade.precip_helper(data)
          expect(res).to be_an(Array)
          expect(res.length).to eq(365)
          expect(res.sum).to eq(40.2)
        end
      end
    end
  end
end
