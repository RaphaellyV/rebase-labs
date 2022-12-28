require 'spec_helper'
require './app.rb'
require './query_service.rb'

describe 'Usuário visita a página inicial' do
  def app
    Sinatra::Application
  end

  it 'com sucesso' do
    get('/')

    expect(last_response.body).to include 'Laboratório Rebase'
    expect(last_response.body).to include 'Lista de Exames Realizados'
    expect(last_response.body).to include 'Token'
    expect(last_response.body).to include 'Paciente'
    expect(last_response.body).to include 'CPF'    
    expect(last_response.body).to include 'Data de Nascimento'
    expect(last_response.body).to include 'CRM/UF'
    expect(last_response.body).to include 'Médico'
    expect(last_response.body).to include 'Exame'
    expect(last_response.body).to include 'Data'
    expect(last_response.body).to include 'Limites'
    expect(last_response.body).to include 'Resultado'
  end

  it 'e vê lista de exames' do
    conn = PG.connect(host: 'postgres', dbname: 'postgres', user: 'postgres')
    QueryService.new.import_csv('./spec/support/tests.csv')

    get('/')

    expect(last_response.body).to include 'IQCZ17'
    expect(last_response.body).to include 'Emilly Batista Neto'
    expect(last_response.body).to include '048.973.170-88'    
    expect(last_response.body).to include '2001-03-11'
    expect(last_response.body).to include 'B000BJ20J4/PI'
    expect(last_response.body).to include 'Luiza Pires'
    expect(last_response.body).to include 'hemácias'
    expect(last_response.body).to include '2021-08-05'   
    expect(last_response.body).to include '45-52'
    expect(last_response.body).to include '97'
    expect(last_response.body).to include 'leucócitos'
    expect(last_response.body).to include '9-61'
    expect(last_response.body).to include '89'


    expect(last_response.body).to include '0W9I67'
    expect(last_response.body).to include 'Juliana dos Reis Filho'
    expect(last_response.body).to include '048.108.026-04'    
    expect(last_response.body).to include '1995-07-03'
    expect(last_response.body).to include 'B0002IQM66/SC'
    expect(last_response.body).to include 'Maria Helena Ramalho'
    expect(last_response.body).to include '2021-07-09'
    expect(last_response.body).to include '28'
    expect(last_response.body).to include '91'    
  end
end