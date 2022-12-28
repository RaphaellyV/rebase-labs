require 'sinatra'
require 'rack/handler/puma'
require './rebase_labs.rb'

Rack::Handler::Puma.run(
  Sinatra::Application,
  Port: 3000,
  Host: '0.0.0.0'
)