require "rubygems"
require "bundler"
require "capybara/dsl"
Bundler.require(:default)
Bundler.require(Sinatra::Base.environment)