require 'spec_helper'
require './tests.rb'
require 'sinatra'
require './rebase_labs.rb'

describe 'Tests list API' do
  context '.import_csv' do
    it 'guarda os dados de 4 testes no banco de dados existente' do
      conn = PG.connect(host: 'postgres', dbname: 'postgres', user: 'postgres')
      Tests.new.import_csv('./spec/support/tests.csv')
  
      result_array = conn.exec('SELECT * FROM TESTS').to_a
  
      expect(result_array.length).to eq 4
      expect(result_array[0]['patient_registration_number']).to eq '048.973.170-88'
      expect(result_array[0]['patient_name']).to eq 'Emilly Batista Neto'
      expect(result_array[0]['patient_email']).to eq 'gerald.crona@ebert-quigley.com'
      expect(result_array[0]['patient_birth_date']).to eq '2001-03-11'
      expect(result_array[0]['patient_address']).to eq '165 Rua Rafaela'
      expect(result_array[0]['patient_city']).to eq 'Ituverava'
      expect(result_array[0]['patient_state']).to eq 'Alagoas'
      expect(result_array[0]['doctor_crm']).to eq 'B000BJ20J4'
      expect(result_array[0]['doctor_crm_state']).to eq 'PI'
      expect(result_array[0]['doctor_name']).to eq 'Maria Luiza Pires'
      expect(result_array[0]['doctor_email']).to eq 'denna@wisozk.biz'
      expect(result_array[0]['test_token']).to eq 'IQCZ17'
      expect(result_array[0]['test_date']).to eq '2021-08-05'
      expect(result_array[0]['test_type']).to eq 'hemácias'
      expect(result_array[0]['test_limits']).to eq '45-52'
      expect(result_array[0]['test_result']).to eq '97'
      expect(result_array[1]['patient_registration_number']).to eq '048.973.170-88'
      expect(result_array[1]['test_type']).to eq 'leucócitos'
      expect(result_array[2]['patient_registration_number']).to eq '048.108.026-04'
      expect(result_array[2]['test_type']).to eq 'hemácias'
      expect(result_array[3]['patient_registration_number']).to eq '048.108.026-04'
      expect(result_array[3]['test_type']).to eq 'leucócitos'
    end
    
    it 'guarda os dados de todos os testes do arquivo data.csv no banco de dados existente' do
      conn = PG.connect(host: 'postgres', dbname: 'postgres', user: 'postgres')
      Tests.new.import_csv('./data.csv')
  
      list_length = conn.exec('SELECT * FROM TESTS').to_a.length
  
      expect(list_length).to eq 3900
    end
  end

  it 'GET /tests' do
    def app
      Sinatra::Application
    end
    conn = PG.connect(host: 'postgres', dbname: 'postgres', user: 'postgres')
    Tests.new.import_csv('./spec/support/tests.csv')
    result_json = conn.exec('SELECT * FROM TESTS').to_a.to_json

    get('/tests')

    expect(last_response.status).to eq 200
    expect(last_response.body).to eq result_json
  end
end