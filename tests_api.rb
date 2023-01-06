require 'sinatra'
require 'pg'
require './query_service.rb'

get '/tests' do
  content_type 'application/json'
  QueryService.new.all.to_json
end

get '/tests-table' do
  send_file './views/tests_table.html'
end

post '/import' do
  QueryService.new.import_csv(params[:file])
  'Exames importados com sucesso'
end