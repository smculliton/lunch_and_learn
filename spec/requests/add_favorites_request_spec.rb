require 'rails_helper'

RSpec.describe 'add favorites request', type: :request do 
  describe 'POST /api/v1/favorites' do 
    context 'successful request' do 
      it 'creates a favorite for a user' do 
        user = create(:user)
        api_key = user.api_key
        body = { 'api_key' => api_key, 'country' => 'thailand', 'recipe_link' => 'www.reallygoodrecipes.com', 'recipe_title' => 'Best Crab Rangoon' }
        headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        post "/api/v1/favorites", params: body.to_json, headers: headers

        data = JSON.parse(response.body, symbolize_names: true)
        favorite = Favorite.last

        expect(response.status).to eq 201

        expect(data).to have_key :success
        expect(data[:success]).to eq('Favorite added successfully')
        expect(favorite.user).to eq(user)
        expect(favorite.country).to eq('thailand')
        expect(favorite.recipe_link).to eq('www.reallygoodrecipes.com')
        expect(favorite.recipe_title).to eq('Best Crab Rangoon')
      end
    end

    context 'sad paths' do 
      it 'returns error if api key is invalid' do 
        api_key = 'THIS_IS_NOT_AN_API_KEY'
        body = { 'api_key' => api_key, 'country' => 'thailand', 'recipe_link' => 'www.reallygoodrecipes.com', 'recipe_title' => 'Best Crab Rangoon' }
        headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        post "/api/v1/favorites", params: body.to_json, headers: headers

        data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq 401
        expect(data).to have_key :errors
        expect(data[:errors]).to have_key :status
        expect(data[:errors]).to have_key :title
        expect(data[:errors][:title]).to eq('BAD API KEY')
        expect(data[:errors]).to have_key :detail
        expect(data[:errors][:detail]).to eq('Key does not match any users in database')
      end

      it 'returns error if no api key provided' do 
        body = { 'country' => 'thailand', 'recipe_link' => 'www.reallygoodrecipes.com', 'recipe_title' => 'Best Crab Rangoon' }
        headers = { 'CONTENT_TYPE' => 'application/json', 'ACCEPT' => 'application/json' }
        post '/api/v1/favorites', params: body.to_json, headers: headers

        data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq 400 
        expect(data).to have_key :errors
        expect(data[:errors]).to have_key :status
        expect(data[:errors]).to have_key :title
        expect(data[:errors][:title]).to eq('MISSING PARAMS')
        expect(data[:errors]).to have_key :detail
        expect(data[:errors][:detail]).to eq('Missing required parameters: api_key')
      end
    end
  end
end