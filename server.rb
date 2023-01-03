require 'rack/handler/puma'
require './tests_api.rb'

Rack::Handler::Puma.run(
  Sinatra::Application,
  Port: 3000,
  Host: '0.0.0.0'
)