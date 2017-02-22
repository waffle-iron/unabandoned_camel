class Category < ApplicationRecord
  extend FriendlyId
 friendly_id :name

  has_many :bean_categories
  has_many :beans, through: :bean_categories
end
