class UnsplashService
  def self.search_photos_by_country(country)
    response = conn.get('/search/photos') do |req|
      req.headers['Authorization'] = "Client-ID #{ENV['unsplash_access_key']}"
      req.params['query'] = country
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://api.unsplash.com')
  end
end