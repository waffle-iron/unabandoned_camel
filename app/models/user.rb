class User < ApplicationRecord
  has_secure_password
  has_many :orders
  validates :email, presence: true, uniqueness: true
  validates :first_name,
            :last_name,
            :street,
            :city,
            :state,
            :zip, presence: true

  enum role: [:default, :admin]
end
