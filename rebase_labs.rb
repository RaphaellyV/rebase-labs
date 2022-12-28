require 'sinatra'
require 'rack/handler/puma'
require 'csv'
require 'pg'

get '/tests' do
  conn = PG.connect(host: 'postgres', dbname: 'postgres', user: 'postgres')
  
  conn.exec('SELECT * FROM TESTS').to_a.to_json
end

get '/hello' do
  'Hello world!'
end