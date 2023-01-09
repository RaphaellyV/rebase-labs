require 'sidekiq'
require './query_service.rb'
require 'pg'

class MyJob
  include Sidekiq::Job

  def perform(file)
    QueryService.new.import_csv(file)
    puts 'Exames importados com sucesso'
  end
end