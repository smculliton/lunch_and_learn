require 'rails_helper'

RSpec.describe LearningResourcesFacade do 
  describe '#get_video' do
    it 'returns a video object from video API search' do 
      VCR.use_cassette('videos_about_laos', allow_playback_repeats: true) do
        country = 'laos'
        videos = YoutubeService.search_videos_by_country(country)
        video = LearningResourcesFacade.get_video(country)

        expect(video).to be_a Video
        expect(video.title).to eq(videos[:items][0][:snippet][:title])
        expect(video.youtube_video_id).to eq(videos[:items][0][:id][:videoId])
      end
    end
  end

  describe '#get_images' do 
    it 'returns images from image search' do 
      VCR.use_cassette('images_of_laos') do 
        country = 'laos'
        images = LearningResourcesFacade.get_images(country)

        expect(images).to be_a Array

        expect(images).to all(be_a Image)
        images.each do |image|
          expect(image.alt_tag).to be_a String
          expect(image.url).to be_a String
        end
      end
    end
  end
end