require 'rails_helper'

RSpec.describe YoutubeService do 
  describe '#search_videos_by_country' do 
    it 'returns video info of mr history channel by country name' do 
      VCR.use_cassette('videos_about_laos') do 
        data = YoutubeService.search_videos_by_country('laos')
        top_search_result = data[:items][0]

        expect(data).to be_a Hash
        expect(data).to have_key :items
        expect(top_search_result).to have_key :id
        expect(top_search_result[:id]).to have_key :videoId

        expect(top_search_result).to have_key :snippet
        expect(top_search_result[:snippet]).to have_key :title
      end
    end
  end
end