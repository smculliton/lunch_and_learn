require 'rails_helper'

RSpec.describe CountriesFacade do 
  describe '#random_country' do 
    before(:each) do 
      # VCR.insert_cassette('all_countries') do 
      #   @countries = RestCountriesService.all_countries
      #   # @country = CountriesFacade.random_country
      # end
    end
    it 'returns a random country' do 
      VCR.insert_cassette('all_countries') do 
        countries = RestCountriesService.all_countries
        country = CountriesFacade.random_country

        test = countries.one? do |tested_country|
          tested_country[:name][:common] == country
        end

        expect(country).to be_a String
        expect(test).to eq(true)
      end
    end
  end
end