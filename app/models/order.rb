class Order < ApplicationRecord
  belongs_to :user
  has_many :order_beans
  has_many :beans, through: :order_beans

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
    order_beans.sum(:quantity)
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

  def self.build_order(cart, user)
    order = user.orders.create(total_price: cart.total_price)
    cart.items.each do |cart_item|
      order.order_beans.create(bean_id: cart_item.id,
                              quantity: cart_item.quantity,
                              price: cart_item.price,
                              subtotal: (cart_item.quantity * cart_item.price),
                              item_title: cart_item.title,
                              )
    end
    order
  end
end
