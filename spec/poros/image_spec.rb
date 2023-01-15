require 'rails_helper'

RSpec.describe Image do 
  describe '#initialize' do 
    it 'has attributes' do 
      VCR.use_cassette('images_of_laos') do 
        data = UnsplashService.search_images_by_country('laos')
        image_data = data[:results][0]

        image = Image.new(image_data)
        
        expect(image).to be_a Image
        expect(image.alt_tag).to eq(image_data[:alt_description])
        expect(image.alt_tag.nil?).to eq false
        expect(image.url).to eq(image_data[:urls][:raw])
        expect(image.url.nil?).to eq false
      end
    end
  end
end