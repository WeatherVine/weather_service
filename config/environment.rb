require 'rubygems'
require "bundler"
require 'require_all'
Bundler.require(:default)
Bundler.require(Sinatra::Base.environment)
require "active_support/deprecation"
require "active_support/all"
require 'figaro/sinatra'
require_all 'lib'
