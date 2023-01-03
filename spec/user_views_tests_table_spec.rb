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
    expect(page.body).to include('script src="tests_table.js"')
  end
end