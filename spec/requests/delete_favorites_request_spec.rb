require 'rails_helper'

RSpec.describe 'delete favorites request' do 
  describe 'DELETE /api/v1/favorites' do 
    context 'successful request' do 
      it 'deletes a users favorite' do 
        user = create(:user)
        favorite = create(:favorite, user_id: user.id)

        delete '/api/v1/favorites', params: { api_key: user.api_key, favorite_id: favorite.id }

        expect(response.status).to eq 204
        expect(Favorite.find_by(id: favorite.id)).to eq(nil)
      end
    end

    context 'sad paths' do 
      it 'returns error if favorite id not provided' do 
        user = create(:user)

        delete '/api/v1/favorites', params: { api_key: user.api_key }
        data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq 400
        expect(data).to have_key :errors
      end

      it 'returns error if api key not provided' do 
        user = create(:user)
        favorite = create(:favorite, user_id: user.id)

        delete '/api/v1/favorites', params: { favorite_id: favorite.id }
        data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq 400
        expect(data).to have_key :errors
      end

      it 'returns error if api key does not match a user' do 
        user = create(:user)
        favorite = create(:favorite, user_id: user.id)

        delete '/api/v1/favorites', params: { api_key: 'random_id', favorite_id: favorite.id }
        data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq 401
        expect(data).to have_key :errors
      end

      it 'returns error if favorite id does not match a favorite' do 
        user = create(:user)
        favorite = create(:favorite, user_id: user.id)

        delete '/api/v1/favorites', params: { api_key: user.api_key, favorite_id: favorite.id + 1 }
        data = JSON.parse(response.body, symbolize_names: true)

        expect(response.status).to eq 401
        expect(data).to have_key :error
      end

      it 'returns error if favorite does not belong to user' do 
        user = create(:user)
        user2 = create(:user)
        favorite = create(:favorite, user_id: user.id)

        delete '/api/v1/favorites', params: { api_key: user2.api_key, favorite_id: favorite.id }
        data = JSON.parse(response.body, symbolize_names: true)
        
        expect(response.status).to eq 401
        expect(data).to have_key :errors
        expect(data[:errors]).to have_key :status
        expect(data[:errors]).to have_key :title
        expect(data[:errors]).to have_key :detail
      end
    end
  end
end