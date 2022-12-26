require 'capybara/rspec'
require 'sinatra'
require_relative '../server.rb'
Capybara.app = Sinatra::Application

describe 'vê o json de testes' do
    it 'com sucesso' do
        get "/tests"
        
        expect(response.status).to eq 200
        expect(response.content_type).to include('application/json')
        json_response = JSON.parse(response.body)
    end
end