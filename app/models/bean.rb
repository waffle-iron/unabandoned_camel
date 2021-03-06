class Bean < ApplicationRecord
  validates :price, :numericality => {:greater_than_or_equal_to => 1 }
  validates_inclusion_of :status, :in =>  0..1
  validates :title, presence: true, uniqueness: true
  validates :description, presence: true
  validates :price, presence: true
  has_many :bean_categories
  has_many :categories, through: :bean_categories
  dragonfly_accessor :image
  before_save :assign_image

  def subtotal(quantity)
    (price * quantity).to_i
  end

  def assign_image
    unless self.image != nil
      i = File.open("#{Rails.root}/public/images/coffee 11.jpg")
      self.image = i
      self.save!
    end
  end
end
