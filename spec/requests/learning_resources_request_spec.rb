require 'rails_helper'

RSpec.describe 'learning resources request' do 
  describe 'GET /api/v1/learning_resources' do 
    context 'successful request' do 
      it 'returns learning resources for the country' do 
          params = { 'country' => 'thailand' }
          get '/api/v1/learning_resources', params: params
          data = JSON.parse(response.body, symbolize_names: true)

          expect(response.status).to eq(200)
          expect(data).to have_key :data
      end
    end

    context 'resources are not found for country' do 
      it 'returns empty videos array'
      it 'returns empty images array'
    end

    context 'unsuccessful request' do 
      it 'returns error message if country params arent given' do 
        get '/api/v1/learning_resources'
        data = JSON.parse(response.body, symbolize_names: true)
        
        expect(response.status).to eq 400
        expect(data).to have_key :errors
        expect(data[:errors]).to have_key(:status)
        expect(data[:errors]).to have_key(:title)
        expect(data[:errors]).to have_key(:detail)

        expect(data[:errors][:status]).to eq(400)
        expect(data[:errors][:title]).to eq('MISSING PARAMS')
        expect(data[:errors][:detail]).to eq('Missing required parameters: country')
      end 
    end
  end
end