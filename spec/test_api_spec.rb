require 'spec_helper'
require './query_service.rb'
require './tests_api.rb'

describe 'Tests API' do  
  it 'GET /tests' do
    conn = PG.connect(host: 'postgres', dbname: 'postgres', user: 'postgres')
    QueryService.new.import_csv('./spec/support/tests.csv')
    result_json = conn.exec('SELECT * FROM TESTS').to_a.to_json

    get('/tests')

    expect(last_response.status).to eq 200
    expect(last_response.content_type).to include('application/json')
    expect(last_response.body).to eq result_json
  end
end