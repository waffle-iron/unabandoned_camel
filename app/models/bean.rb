class Bean < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
  has_many :bean_categories
  has_many :categories, through: :bean_categories


  # def active
  #   @bean == 1
  # end

end
