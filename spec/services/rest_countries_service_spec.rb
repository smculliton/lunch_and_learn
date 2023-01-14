require 'rails_helper'

RSpec.describe RestCountriesService do
  describe '#all_countries' do
    it 'returns all countries with info' do
      VCR.insert_cassette('all_countries') do
        response = RestCountriesService.all_countries
        data = JSON.parse(response.body, symbolize_names: true)

        expect(data).to be_a Array
        expect(data).to all(have_key(:name))
        expect(data[0][:name]).to have_key :common
      end
    end
  end
end
