class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates :email, presence: true, uniqueness: true
  
  enum role: [:default, :admin]
end
