require 'pg'
require './query_service.rb'

QueryService.new.import_csv('./data.csv')