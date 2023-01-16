require 'rails_helper'

RSpec.describe 'get user favorites request', type: :request do 
  describe 'GET /api/v1/favorites' do 
    describe 'successful request' do 
      it 'returns all of a users favorited recipes' do 
        user = create(:user)
        create_list(:favorite, 10, user_id: user.id)

        get '/api/v1/favorites', params: { api_key: user.api_key }
        data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq 200
        expect(data).to have_key :data
        expect(data[:data]).to be_a Array
        expect(data[:data].length).to eq(10)
        expect(data[:data]).to all(have_key(:id))
        expect(data[:data]).to all(have_key(:type))
        expect(data[:data]).to all(have_key(:attributes))

        data[:data].each do |favorite|
          expect(favorite[:attributes]).to have_key :recipe_title
          expect(favorite[:attributes]).to have_key :recipe_link
          expect(favorite[:attributes]).to have_key :country
          expect(favorite[:attributes]).to have_key :created_at
        end
      end

      it 'returns empty array if user has no favorites' do 
        user = create(:user)

        get '/api/v1/favorites', params: { api_key: user.api_key }
        data = JSON.parse(response.body, symbolize_names: true)

        expect(data[:data]).to be_empty
      end
    end

    describe 'sad paths' do 
      it 'returns error if bad api key' do 
        get '/api/v1/favorites', params: { api_key: 'FAKEFAKEFAKEFAKE' }
        data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(401)
        expect(data).to have_key :errors
        expect(data[:errors]).to have_key :status
        expect(data[:errors]).to have_key :title
        expect(data[:errors][:title]).to eq('BAD API KEY')
        expect(data[:errors]).to have_key :detail
        expect(data[:errors][:detail]).to eq('Key does not match any users in database')
      end

      it 'returns error if no api key provided' do 
        get '/api/v1/favorites'
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