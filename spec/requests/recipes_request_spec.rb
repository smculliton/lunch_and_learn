require 'rails_helper'

RSpec.describe 'recipes requests' do 
  describe 'GET /api/v1/recipes' do 
    context 'country is provided' do
      it 'returns recipes of country' do 
        params = { 'country' => 'thailand' }
        get '/api/v1/recipes', params: params
        
        data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq(200)
        expect(data).to be_a Hash
        expect(data).to have_key(:data)

        recipes = data[:data]

        expect(recipes).to be_a Array
        expect(recipes).to all(have_key(:id))
        expect(recipes).to all(have_key(:type))
        expect(recipes).to all(have_key(:attributes))
        recipes.each do |recipe|
          expect(recipe[:attributes]).to have_key(:title)
          expect(recipe[:attributes]).to have_key(:url)
          expect(recipe[:attributes]).to have_key(:country)
          expect(recipe[:attributes]).to have_key(:image)
        end
      end
    end
    context 'country is random' do 

    end
  end
end