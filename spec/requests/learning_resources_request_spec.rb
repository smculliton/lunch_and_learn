require 'rails_helper'

RSpec.describe 'learning resources request' do 
  describe 'GET /api/v1/learning_resources' do 
    context 'successful request' do 
      it 'returns learning resources for the country' do 
        VCR.use_cassette('images_of_laos') do 
          VCR.use_cassette('videos_about_laos') do 
            country = 'laos'
            params = { 'country' => country }
            get '/api/v1/learning_resources', params: params
            data = JSON.parse(response.body, symbolize_names: true)
            attributes = data[:data][:attributes] 
            
            expect(response.status).to eq(200)
            
            expect(data).to have_key :data
            expect(data[:data]).to have_key :id
            expect(data[:data][:id]).to eq(nil)
            expect(data[:data]).to have_key :type
            expect(data[:data]).to have_key :attributes

            expect(attributes).to have_key :video
            expect(attributes[:video]).to have_key :title
            expect(attributes[:video]).to have_key :youtube_video_id

            expect(attributes).to have_key :images
            expect(attributes[:images]).to all(have_key(:alt_tag))
            expect(attributes[:images]).to all(have_key(:url))

            expect(attributes).to have_key :country
            expect(attributes[:country]).to eq(country)
          end
        end
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