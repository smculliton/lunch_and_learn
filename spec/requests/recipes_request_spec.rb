require 'rails_helper'

RSpec.describe 'recipes requests' do 
  describe 'GET /api/v1/recipes' do 
    context 'country is provided' do
      it 'returns recipes of country' do 
        params = { 'country' => 'thailand' }
        get '/api/v1/recipes', params: params

        expect(response.status)
      end
    end
    context 'country is random' do 

    end
  end
end