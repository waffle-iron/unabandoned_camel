class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || {}
  end

  def add_bean(bean_id)
    contents[bean_id.to_s] ||= 0
    contents[bean_id.to_s] += 1
  end

  def count_of(bean_id)
    contents[bean_id.to_s]
  end

  def total_count
    contents.values.sum
  end

  def total_price
    # total = []
    # contents.each {|id, quantity| total << (Bean.find(id).price * quantity)}
    # total.reduce(:+)
    total = contents.map {|id, quantity|(Bean.find(id).price * quantity)}
    total.reduce(:+)
  end
end
