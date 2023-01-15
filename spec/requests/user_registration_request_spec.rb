require 'rails_helper'

RSpec.describe 'user registration request' do
  describe 'POST /api/v1/users', type: :request do
    it 'creates a new user and returns user info' do
      body = { "name" => 'Athena Dao', "email" => 'athenadao@bestgirlever.com' }
      headers = { "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }
      post "/api/v1/users", params: body.to_json, headers: headers

      data = JSON.parse(response.body, symbolize_names: true)
      attributes = data[:data][:attributes]

      expect(data).to have_key :data
      expect(data[:data]).to have_key :type
      expect(data[:data]).to have_key :id
      expect(data[:data]).to have_key :attributes

      expect(attributes).to have_key :name
      expect(attributes[:name]).to eq('Athena Dao')

      expect(attributes).to have_key :email
      expect(attributes[:email]).to eq('athenadao@bestgirlever.com')

      expect(attributes).to have_key :api_key
    end
  end
end
