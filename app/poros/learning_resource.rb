class LearningResource
  attr_reader :images, :video, :country 

  def initialize(images, video, country)
    @images = images
    @video = video 
    @country = country
  end
end