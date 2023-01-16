require 'rails_helper'

RSpec.describe User, type: :model do 
  describe 'validations' do 
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
  end

  describe 'relationships' do 
    it { should have_many :favorites}
  end

  describe 'instance methods' do 
    describe '#create_api_key' do
      it 'generates random api key upon creation of User' do 
        user = create(:user)
        expect(user.api_key).to be_a String
        expect(user.api_key.length).to eq(20)
      end
    end
  end 
end