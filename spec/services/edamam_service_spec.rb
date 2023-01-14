require 'rails_helper'

RSpec.describe EdamamService do 
  describe '#search_recipes_by_country' do 
    it 'searches for recipes relating to a specific country' do 
      VCR.insert_cassette('recipes_from_thailand') do 
        response = EdamamService.search_recipes_by_country('Thailand')
        data = JSON.parse(response.body, symbolize_names: true)

        expect(data).to be_a Hash
        expect(data).to have_key :hits

        recipes = data[:hits]

        expect(recipes).to all( have_key(:label))
        expect(recipes).to all( have_key(:url))
        expect(recipes).to all( have_key(:image))
      end
    end
  end
end