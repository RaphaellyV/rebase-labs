require 'sinatra'
require 'pg'
require './query_service.rb'
require './my_job.rb'

get '/tests' do
  content_type 'application/json'
  QueryService.new.all.to_json
end

get '/tests-table' do
  send_file './views/tests_table.html'
end

get '/' do
  erb :home
end

get '/search' do
  @token = params[:query]
  @tests = QueryService.new.find(@token)
  erb :search
end

post '/import' do
  QueryService.new.import_csv(params[:file])
  'Exames importados com sucesso'
end

post '/import-queue' do
  csv_path = params[:file]
  MyJob.perform_async(csv_path)
end