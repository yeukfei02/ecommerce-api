# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  context '001 - POST /api/users/signup' do
    before do
      params = {
        email: Faker::Internet.email,
        password: 'test'
      }
      post '/api/users/signup', params: params
    end

    it 'return success' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('signup')
    end
  end

  context '002 - POST /api/users/login' do
    before do
      params = {
        email: 'test@email.com',
        password: 'test'
      }
      post '/api/users/login', params: params
    end

    it 'return success' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('login')
      expect(response_body['token'].present?).to be true
    end
  end
end
