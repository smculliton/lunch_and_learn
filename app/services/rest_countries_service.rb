class RestCountriesService
  def self.all_countries
    conn.get('/v3.1/all')
  end

  def self.conn
    Faraday.new('https://restcountries.com')
  end
end