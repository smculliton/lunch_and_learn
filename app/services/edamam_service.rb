class EdamamService
  def self.search_recipes_by_country(country)
    conn.get('/api/recipes/v2') do |req|
      req.params['q'] = country
      req.params['app_id'] = ENV['edamam_app_id']
      req.params['app_key'] = ENV['edamam_app_key']
      req.params['type'] = ENV['public']
    end
  end

  def self.conn
    Faraday.new('https://api.edamam.com')
  end
end