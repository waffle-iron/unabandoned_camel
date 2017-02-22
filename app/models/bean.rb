class Bean < ApplicationRecord
  has_many :bean_categories
  has_many :categories, through: :beans_categories
end
