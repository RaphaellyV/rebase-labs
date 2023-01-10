require 'spec_helper'

describe 'Usuário busca por token de exame' do
  it 'a partir da tela inicial' do
    visit '/'
    
    expect(page).to have_content 'Laboratório Rebase'
    expect(page).to have_content 'Resultados de Exames'
    expect(page).to have_field 'query'
    expect(page).to have_button 'Buscar'
  end

  it 'com sucesso' do
    post '/import', file: './spec/support/tests.csv'

    visit '/'
    fill_in 'query', with: 'IQCZ17'
    click_on 'Buscar'

    expect(page).to have_content 'Resultado da pesquisa pelo token IQCZ17'
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
    expect(page).to have_content 'Emilly Batista Neto'
    expect(page).to have_content '048.973.170-88'
    expect(page).to have_content '11/03/2001'
    expect(page).to have_content 'B000BJ20J4/PI'
    expect(page).to have_content 'Maria Luiza Pires'
    expect(page).to have_content 'hemácias'
    expect(page).to have_content 'leucócitos'
    expect(page).to have_content '05/08/2021'
    expect(page).to have_content '45-52'
    expect(page).to have_content '9-61'
    expect(page).to have_content '97'
    expect(page).to have_content '89'
  end

  it 'e não encontra o token' do
    visit '/'
    fill_in 'query', with: 'IQCZ17'
    click_on 'Buscar'

    expect(page).to have_content 'Resultado da pesquisa pelo token IQCZ17'
    expect(page).to have_content 'Token inválido.'
  end
end