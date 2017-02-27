class Bean < ApplicationRecord
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  validates :image, presence: true
  has_many :bean_categories
  has_many :categories, through: :bean_categories

#Bean Status
#Active = 0
#Retired = 1
#Coming Soon = 2


  # def active
  #   @bean == 0
  # end

  def subtotal(quantity)
    (price * quantity).to_i
  end
end
