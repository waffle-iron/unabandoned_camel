class Order < ApplicationRecord
  serialize :contents, Hash
  belongs_to :user
  validates :contents, presence: true

  def self.ordered_count
    where(status:"Ordered").count
  end

  def self.paid_count
    where(status:"Paid").count
  end

  def self.cancelled_count
    where(status:"Cancelled").count
  end

  def self.completed_count
    where(status:"Completed").count
  end
end
