require 'spec_helper'
require './query_service.rb'

describe 'Usuário vê tabela de testes' do
  it 'com sucesso' do
    visit '/tests-table'

    expect(page).to have_content 'Laboratório Rebase'
    expect(page).to have_content 'Lista de Exames Realizados'
    expect(page).to have_content 'Token'
    expect(page).to have_content 'Paciente'
    expect(page).to have_content 'CPF'    
    expect(page).to have_content 'Data de Nascimento'
    expect(page).to have_content 'CRM/UF'
    expect(page).to have_content 'Médico'
    expect(page).to have_content 'Exame'
    expect(page).to have_content 'Data'
    expect(page).to have_content 'Limites'
    expect(page).to have_content 'Resultado'
  end

  it 'e vê lista de exames' do
    conn = PG.connect(host: 'postgres', dbname: 'postgres', user: 'postgres')
    QueryService.new.import_csv('./spec/support/tests.csv')

    visit '/tests-table'

    expect(page).to have_content 'IQCZ17'
    expect(page).to have_content 'Emilly Batista Neto'
    expect(page).to have_content '048.973.170-88'    
    expect(page).to have_content '2001-03-11'
    expect(page).to have_content 'B000BJ20J4/PI'
    expect(page).to have_content 'Luiza Pires'
    expect(page).to have_content 'hemácias'
    expect(page).to have_content '2021-08-05'   
    expect(page).to have_content '45-52'
    expect(page).to have_content '97'
    expect(page).to have_content 'leucócitos'
    expect(page).to have_content '9-61'
    expect(page).to have_content '89'

    expect(page).to have_content '0W9I67'
    expect(page).to have_content 'Juliana dos Reis Filho'
    expect(page).to have_content '048.108.026-04'    
    expect(page).to have_content '1995-07-03'
    expect(page).to have_content 'B0002IQM66/SC'
    expect(page).to have_content 'Maria Helena Ramalho'
    expect(page).to have_content '2021-07-09'
    expect(page).to have_content '28'
    expect(page).to have_content '91'    
  end
end