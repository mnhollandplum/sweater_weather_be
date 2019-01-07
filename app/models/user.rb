require 'securerandom'
class User < ApplicationRecord
  before_create :generate_api_key
  validates_presence_of :email, uniqueness: true
  validates_presence_of :password
  validates_presence_of :password_confirmation
  has_many :favorites

  def generate_api_key
    self.api_key = SecureRandom.uuid
  end
end
