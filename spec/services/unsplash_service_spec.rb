require 'rails_helper'

RSpec.describe UnsplashService do 
  describe '#search_images_by_country' do 
    it 'returns image info based on country' do 
      VCR.use_cassette('images_of_laos') do 
        data = UnsplashService.search_images_by_country('laos')

        expect(data).to be_a Hash
        expect(data).to have_key :results
        expect(data[:results]).to be_a Array

        expect(data[:results]).to all(have_key(:alt_description))
        expect(data[:results]).to all(have_key(:urls))
        data[:results].each do |image|
          expect(image[:urls]).to have_key :raw
        end
      end
    end
  end 
end