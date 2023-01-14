require 'rails_helper'

RSpec.describe RecipesFacade do 
  describe '#get_recipes_from_country' do 
    it 'gets recipes from country and returns recipe objects' do 
      VCR.insert_cassette('recipes_from_thailand') do 
        response = RecipesFacade(get_recipes_from_country('thailand'))

        expect(response).to be_a Array
        expect(response).to all(be_a Recipe)
      end
    end
  end
end