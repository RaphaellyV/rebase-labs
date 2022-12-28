require 'sinatra'
require 'pg'
require './query_service.rb'

get '/' do
  @tests = QueryService.new.all
  erb :home 
end

get '/tests' do
  QueryService.new.all.to_json
end

get '/hello' do
  'Hello world!'
end