class LearningResourcesFacade
  def self.get_video(country)
    data = YoutubeService.search_videos_by_country(country)
    video_data = data[:items][0]
    Video.new(video_data)
  end

  def self.get_images(country)
    images = UnsplashService.search_images_by_country(country)[:results]
    images.map do |image_data|
      Image.new(image_data)
    end
  end

  def self.get_learning_resources(country)
    LearningResource.new(get_images(country), get_video(country), country)
  end
end