class Order < ApplicationRecord
  serialize :contents, Hash
  belongs_to :user
  validates :contents, presence: true

end
