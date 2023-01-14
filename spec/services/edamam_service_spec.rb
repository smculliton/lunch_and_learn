require 'rails_helper'

RSpec.describe EdamamService do 
  describe '#search_recipes_by_country' do 
    it 'searches for recipes relating to a specific country' do 
      VCR.use_cassette('recipes_from_thailand') do
        data = EdamamService.search_recipes_by_country('thailand')

        expect(data).to be_a Hash
        expect(data).to have_key :hits

        recipes = data[:hits]

        expect(recipes).to all( have_key(:recipe))

        recipes.each do |recipe|
          expect(recipe[:recipe]).to have_key(:label)
          expect(recipe[:recipe]).to have_key(:url)
          expect(recipe[:recipe]).to have_key(:image)
        end
      end
    end
  end
end