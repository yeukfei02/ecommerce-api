require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe '001 - POST /api/users/signup' do
    before do
      params = {
        email: Faker::Internet.email,
        password: 'test'
      }
      post '/api/users/signup', params: params
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('signup')
    end
  end

  describe '002 - POST /api/users/login' do
    before do
      params = {
        email: Faker::Internet.email,
        password: 'test'
      }
      post '/api/users/login', params: params
    end

    it 'test result' do
      response_body = JSON.parse(response.body)
      puts "response_body = #{response_body}"
      expect(response_body.present?).to be true

      expect(response_body['message']).to eq('login')
      expect(response_body['token'].present?).to be true
    end
  end
end
