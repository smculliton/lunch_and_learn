require 'rails_helper'

RSpec.describe LearningResourcesFacade do 
  describe '#get_video' do
    it 'returns a video object from video API search' do 
      VCR.use_cassette('videos_about_laos') do
        country = 'laos'
        videos = YoutubeService.search_videos_by_country(country)
        video = VideosFacade.get_video(country)

        expect(video).to be_a Video
        expect(video.title).to eq(videos[:items][0][:snippet][:title])
        expect(video.youtube_video_id).to eq(videos[:items][0][:id][:videoId])
      end
    end
  end
end