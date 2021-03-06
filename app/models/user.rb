class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates_presence_of :password, require: true

  has_secure_password

  has_many :favorites 

  before_create :get_api_key
  
  private
  
  def get_api_key
    self.api_key = SecureRandom.hex(14)
  end
end 