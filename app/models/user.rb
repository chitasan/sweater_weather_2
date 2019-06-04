class User < ApplicationRecord
  validates_presence_of :api_key
  validates :email, presence: true, uniqueness: true

  has_secure_password
end 