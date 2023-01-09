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

  it 'POST /import' do
    post '/import', file: './spec/support/tests.csv'
    get '/tests'

    expect(last_response.content_type).to include('application/json')
    expect(last_response.body).to include 'id'
    expect(last_response.body).to include 'patient_registration_number'
    expect(last_response.body).to include 'patient_name'
    expect(last_response.body).to include 'patient_email'
    expect(last_response.body).to include 'patient_birth_date'
    expect(last_response.body).to include 'patient_address'
    expect(last_response.body).to include 'patient_city'
    expect(last_response.body).to include 'patient_state'
    expect(last_response.body).to include 'doctor_crm'
    expect(last_response.body).to include 'doctor_crm_state'
    expect(last_response.body).to include 'doctor_name'
    expect(last_response.body).to include 'doctor_email'
    expect(last_response.body).to include 'test_token'
    expect(last_response.body).to include 'test_date'
    expect(last_response.body).to include 'test_type'
    expect(last_response.body).to include 'test_limits'
    expect(last_response.body).to include 'test_result'
    expect(last_response.body).to include '048.973.170-88'
    expect(last_response.body).to include 'Emilly Batista Neto'
    expect(last_response.body).to include 'Juliana dos Reis Filho'
    expect(last_response.body).to include 'gerald.crona@ebert-quigley.com'
    expect(last_response.body).to include '2001-03-11'
    expect(last_response.body).to include '165 Rua Rafaela'
    expect(last_response.body).to include 'Ituverava'
    expect(last_response.body).to include 'Alagoas'
    expect(last_response.body).to include 'B000BJ20J4'
    expect(last_response.body).to include 'PI'
    expect(last_response.body).to include 'Maria Luiza Pires'
    expect(last_response.body).to include 'denna@wisozk.biz'
    expect(last_response.body).to include 'IQCZ17'
    expect(last_response.body).to include '2021-08-05'
    expect(last_response.body).to include 'hemácias'
    expect(last_response.body).to include '45-52'
    expect(last_response.body).to include '97'
    expect(last_response.body).to include 'leucócitos'
    expect(last_response.body).to include '9-61'
    expect(last_response.body).to include '89'
  end
end