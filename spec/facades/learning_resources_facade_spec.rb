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

  describe '#get_photos' do 
    it 'returns photos from photo search' do 
      VCR.use_cassette('photos_from_laos') do 
        country = 'laos'
        photos = LearningResourcesFacade.search_photos_by_country(country)

        expect(photos).to be_a Array
        
        expect(photos).to all(be_a Photo)
        photos.each do |photo|
          expect(photo.alt_tag).to be_a String
          expect(photo.youtube_video_id).to be_a String
        end
      end
    end
  end
end