class BeanCategory < ActiveRecord::Base
  belongs_to :bean
  belongs_to :category
end
