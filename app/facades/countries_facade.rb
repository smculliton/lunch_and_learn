class CountriesFacade
  def self.random_country
    country = RestCountriesService.all_countries.sample
    country[:name][:common]
  end
end 