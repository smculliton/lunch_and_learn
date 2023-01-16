require 'rails_helper'

RSpec.describe 'delete favorites request' do 
  describe 'DELETE /api/v1/favorites' do 
    it 'deletes a users favorite' do 
      user = create(:user)
      favorite = create(:favorite, user_id: user.id)

      delete '/api/v1/favorites', params: { api_key: user.api_key, favorite_id: favorite.id }
      
      expect(response.status).to eq 204
      expect(Favorite.find_by(id: favorite.id)).to eq(nil)
    end
  end
end