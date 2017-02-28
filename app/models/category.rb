class Category < ApplicationRecord
  extend FriendlyId
  validates :name, presence: true, uniqueness: true

  before_create :slug

  friendly_id :name, use: :slugged

  has_many :bean_categories
  has_many :beans, through: :bean_categories

  private

   def slug
    self.slug = name.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
  end
end
