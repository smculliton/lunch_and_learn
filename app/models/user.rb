class User < ApplicationRecord
  validates_presence_of :name, :email, :password_digest
  validates_uniqueness_of :email
  validates_confirmation_of :password

  before_create :create_api_key

  has_secure_password
  has_many :favorites

  private

  def create_api_key
    self.api_key = SecureRandom.hex(10)
  end
end