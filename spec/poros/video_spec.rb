require 'rails_helper'

RSpec.describe Video do 
  describe '#initialize' do 
    it 'has attributes' do 
      VCR.use_cassette('videos_about_laos') do
        video_data = YoutubeService.search_videos_by_country('laos')[:items][0]
        video = Video.new(video_data)

        expect(video.title).to eq('A Super Quick History of Laos')
        expect(video.youtube_video_id).to eq('uw8hjVqxMXw')
      end
    end
  end
end