class LearningResourcesFacade
  def self.get_video(country)
    data = YoutubeService.search_videos_by_country(country)
    video_data = data[:items][0]
    Video.new(video_data)
  end

  def self.get_photos(country)
    photos = UnsplashService.search_photos_by_country(country)[:results]
    photos.map do |photo_data|
      Photo.new(photo_data)
    end
  end
end