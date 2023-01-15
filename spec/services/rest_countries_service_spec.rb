require 'rails_helper'

RSpec.describe RestCountriesService do
  describe '#all_countries' do
    it 'returns all countries with info' do
      VCR.use_cassette('all_countries') do 
        response = RestCountriesService.all_countries

        expect(response).to be_a Array
        expect(response).to all(have_key(:name))
        expect(response[0][:name]).to have_key :common
      end
    end
  end
end
