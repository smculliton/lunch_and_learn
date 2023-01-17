require 'rails_helper'

RSpec.describe 'user login request', type: :request do 
  describe 'POST /api/v1/sessions' do 
    context 'successful login' do 
      it 'creates a session' do 
        user = create(:user)
        body = { "email" => user.email, 'password' => 'password' }
        headers = { "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }

        post '/api/v1/sessions', params: body.to_json, headers: headers

        data = JSON.parse(response.body, symbolize_names: true)
        attributes = data[:data][:attributes]

        expect(response.status).to eq 200

        expect(data).to have_key :data
        expect(data[:data]).to have_key :type
        expect(data[:data]).to have_key :id
        expect(data[:data]).to have_key :attributes
  
        expect(attributes).to have_key :name
        expect(attributes[:name]).to eq(user.name)
  
        expect(attributes).to have_key :email
        expect(attributes[:email]).to eq(user.email)
  
        expect(attributes).to have_key :api_key
        expect(attributes[:api_key]).to eq(user.api_key)
      end
    end 

    context 'unsuccessful login' do 
      it 'returns error message' do 
        user = create(:user)
        body = { "email" => user.email, 'password' => 'not_password' }
        headers = { "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }

        post '/api/v1/sessions', params: body.to_json, headers: headers

        data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq 400

        expect(data).to have_key :errors
      end
    end
  end
end