FactoryGirl.define do

factory :bean do
  title
  description
  price
  image
end

# factory :category do
#   title
# end

sequence :title do |n|
  "#{n} Title"
end

sequence :description do |n|
  "#{n} description"
end

sequence :price do |n|
  "#{n} Price"
end

sequence :image do |n|
  "#{n} Image"
end

end
#  trait :with_beans do
#       ignore do
#         number_of_beans 1
#       end
#     after(:create) do |category, evaluator|
#       create_list(:category, evaluator.number_of_beans,category: category)
#     end
#   end
# end