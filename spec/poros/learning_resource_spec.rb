require 'rails_helper'

RSpec.describe LearningResource do 
  describe '#initialize' do 
    before(:each) do
      VCR.use_cassette('images_from_laos') do 
        VCR.use_cassette('videos_about_laos') do 
          @country = 'laos'
          images = LearningResourcesFacade.get_images(@country)
          video = LearningResourcesFacade.get_video(@country)
          @learning_resource = LearningResource.new(images, video, @country)
        end
      end
    end

    it 'has attributes' do 
      expect(@learning_resource).to be_a LearningResource
      expect(@learning_resource.video).to be_a Video
      expect(@learning_resource.images).to all(be_a Image)
      expect(@learning_resource.country).to eq(@country)
    end
  end
end 