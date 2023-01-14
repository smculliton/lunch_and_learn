require 'rails_helper'

RSpec.describe CountriesFacade do 
  describe '#random_country' do 
    it 'returns a random country' do 
      VCR.use_cassette('all_countries', allow_playback_repeats: true) do
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