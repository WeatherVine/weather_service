source 'https://rubygems.org'
ruby '2.5.3'
gem 'sinatra', require: 'sinatra/base'
gem 'pg'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'json'
gem 'shotgun'
gem 'pry'
gem 'faraday'
gem 'fast_jsonapi'
gem 'sinatra-contrib'

group :development, :test do
  gem 'figaro', git: 'https://github.com/bpaquet/figaro.git', branch: 'sinatra'
  gem 'rspec'
  gem 'rspec-core'
  gem 'tux'
  gem 'capybara'
  gem 'launchy'
  gem 'rack-test'
  gem 'rake'
end

group :test do
  gem 'simplecov'
  gem 'webmock'
  gem 'vcr'
end
