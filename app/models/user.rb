class User < ApplicationRecord
  validates_presence_of :name, :email
  validates_uniqueness_of :email
  before_create :create_api_key
  has_many :favorites

  private

  def create_api_key
    self.api_key = SecureRandom.hex(10)
  end
end