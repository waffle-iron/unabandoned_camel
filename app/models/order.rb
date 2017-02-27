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

  def item_count
    contents.values.sum
  end

  def date
    created_at.strftime('%m/%d/%Y %I:%M %p')
  end

  def completed_or_cancelled?
    status == 'Completed' || 'Cancelled'
  end

  def update_time
    updated_at.strftime('%m/%d/%Y %I:%M %p')
  end
end
