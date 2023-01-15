require 'rails_helper'

RSpec.describe UnsplashService do 
  describe '#search_photos_by_country' do 
    it 'returns photo info based on country' do 
      VCR.use_cassette('photos_of_laos') do 
        data = UnsplashService.search_photos_by_country('laos')

        expect(data).to be_a Hash
        expect(data).to have_key :results
        expect(data[:results]).to be_a Array

        expect(data[:results]).to all(have_key(:alt_description))
        expect(data[:results]).to all(have_key(:urls))
        data[:results].each do |photo|
          expect(photo[:urls]).to have_key :raw
        end
      end
    end
  end 
end