require 'rails_helper'

RSpec.describe 'user registration request' do
  describe 'POST /api/v1/users', type: :request do
    it 'creates a new user and returns user info' do
      body = { "name" => 'Athena Dao', "email" => 'athenadao@bestgirlever.com' }
      headers = { "CONTENT_TYPE" => "application/json", 'ACCEPT' => 'application/json' }
      post "/api/v1/users", params: body.to_json, headers: headers

      # data = JSON.parse(response.body, symbolize_names: true)
    end
  end
end
