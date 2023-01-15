class YoutubeService
  def self.search_videos_by_country(country)
    response = conn.get('/youtube/v3/search') do |req|
      req.headers['x-goog-api-key'] = ENV['google_api_key']
      req.params['channelId'] = 'UCluQ5yInbeAkkeCndNnUhpw'
      req.params['part'] = 'snippet'
      req.params['q'] = country
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new('https://www.googleapis.com')
  end
end