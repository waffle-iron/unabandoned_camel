class Category < ApplicationRecord
  has_many :bean_categories
  has_many :beans, through: :bean_categories
end
