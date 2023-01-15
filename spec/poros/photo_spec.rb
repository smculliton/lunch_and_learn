require 'rails_helper'

RSpec.describe Photo do 
  describe '#initialize' do 
    it 'has attributes' do 
      VCR.use_cassette('photos_of_laos') do 
        data = UnsplashService.search_photos_by_country('laos')
        photo_data = data[:results][0]

        photo = Photo.new(photo_data)
        
        expect(photo).to be_a Photo
        expect(photo.alt_tag).to eq(photo_data[:alt_description])
        expect(photo.alt_tag.nil?).to eq false
        expect(photo.url).to eq(photo_data[:urls][:raw])
        expect(photo.url.nil?).to eq false
      end
    end
  end
end