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
    end
  end
end