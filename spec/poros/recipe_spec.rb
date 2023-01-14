require 'rails_helper'

RSpec.describe Recipe do 
  describe '#initialize' do 
    it 'has attributes' do 
      VCR.insert_cassette('recipes_from_thailand') do 
        data = EdamamService.search_recipes_by_country('thailand')[:hits][0]
        country = 'thailand'

        recipe = Recipe.new(data, country)

        expect(recipe.name).to eq(data[:label])
        expect(recipe.url).to eq(data[:url])
        expect(recipe.image).to eq(data[:image])
        expect(recipe.country).to eq(country)
      end
    end
  end
end