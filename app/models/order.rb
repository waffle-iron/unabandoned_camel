class Order < ApplicationRecord
  serialize :contents, Hash
  belongs_to :user
  validates :contents, presence: true

  def item_count
    contents.values.sum
  end
end
