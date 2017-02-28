class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def items
    @contents.map do |bean_id, quantity|
      bean = Bean.find(bean_id)
      CartItem.new(bean,quantity)
    end
  end

  def add_bean(bean)
    contents[bean.id.to_s] ||= 0
    contents[bean.id.to_s] += 1
  end

  def count_of(bean_id)
    contents[bean_id.to_s]
  end

  def total_count
    contents.values.sum
  end

  def total_price
    total = contents.map {|id, quantity|(Bean.find(id).price * quantity)}
    total.reduce(:+)
  end

  def find_title(id)
    items.each do |item|
      if item.id.to_s == id
        return item.title
      end
    end
  end

  def find_quantity(id)
    items.each do |item|
      if item.id.to_s == id
        return item.quantity
      end
    end
  end

  def cart_count
    contents.values.reduce(:+)
  end

  def cart_increase_decrease(cart, params)
    if params[:modify] == "1"
      @cart.contents[params[:id]] += params[:modify].to_i
    elsif params[:modify] == "-1"
      unless @cart.contents[params[:id]] == 1
        @cart.contents[params[:id]] -= params[:modify].to_i.abs
      end
    end
  end

  def self.cart_edit(params)
    if params[:update]
      @cart.contents[params[:id]] = params[:update].to_i
    end
  end
end
