class LearningResourcesFacade
  def self.get_video(country)
    data = YoutubeService.search_videos_by_country(country)
    video_data = data[:items][0]
    Video.new(video_data)
  end
end