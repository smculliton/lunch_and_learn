require 'rails_helper'

RSpec.describe 'recipes requests' do 
  describe 'GET /api/v1/recipes' do 
    context 'country is provided' do
      it 'returns recipes of country' do 
        VCR.use_cassette('recipes_from_thailand') do 
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
            expect(recipe[:id]).to eq(nil)
            expect(recipe[:attributes]).to have_key(:title)
            expect(recipe[:attributes]).to have_key(:url)
            expect(recipe[:attributes]).to have_key(:country)
            expect(recipe[:attributes]).to have_key(:image)
          end
        end
      end
    end

    context 'country is random' do 
      it 'returns recipes of randomly chosen country' do 
        allow(CountriesFacade).to receive(:random_country).and_return('british virgin islands')

        VCR.use_cassette('recipes_from_british_virgin_islands') do 
          get '/api/v1/recipes'

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
            expect(recipe[:id]).to eq(nil)
            expect(recipe[:attributes]).to have_key(:title)
            expect(recipe[:attributes]).to have_key(:url)
            expect(recipe[:attributes]).to have_key(:country)
            expect(recipe[:attributes]).to have_key(:image)
          end
        end
      end 
    end

    context 'search params dont return data' do 
      it 'returns an empty array' do 
        VCR.use_cassette('recipes_from_arrakis') do 
          params = { 'country' => 'arrakis' }
          get '/api/v1/recipes', params: params

          data = JSON.parse(response.body, symbolize_names: true)

          expect(data).to be_a Hash
          expect(data[:data]).to be_a Array
          expect(data[:data]).to be_empty
        end
      end
    end
  end
end