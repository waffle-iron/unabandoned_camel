# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TITLE = ["Yirgacheffe Oromia",
         "Rushashi Hingakawa",
         "Namadzi Kapno",
         "Tarrazu Hacienda",
         "Supremo Sur de Huila",
         "Penachi",
         "El Triunfo",
         "Sumatra Aceh",
         "Atitlan Nahuala",
         "Mocca Java",
         "Trieste Caffe",
         "Starbucks",
         "JFG",
         "Folgers",
         "Columbian",
         "Ethiopian",
         "Morracan Gold",
         "Elixir of Life",
         "Joes Hipster Coffee",
         "Nutty and Delicious",
         "Wooden Box Coffee",
         "Dollar Coffee Club",
         "Bitter but Filling",
         "US Army Surplus",
         "Christmas Blend",
         "My Verona",
         "Turing Strength",
         "Awake Forever",
         "Great Value",
         "Yellow Can",
         "Rainforest Basics",
         "Mother Earths Tears",
         "God Water",
         "Burnt and Tasteless",
         "Not Your Fathers",
         "Mothers Coffee",
         "Schwartz Fuel",
         "Immediate Relief",
         "STA-AWAKE",
         "Earthy and Happy",
         "Eyes Wide Open",
         "Angel Blood",
         "Dilated",
         "Waffle House",
         "Ruby",
         "Bacon Ipsum",
         "Burnt",
         "Avenger",
         "Birdman",
         "Aroma",
         "Smokey",
         "Chocolate-covered",
         "Snowfall",
         "RU TIRED?",
         "Product of Congo",
         "Dirt Cheap Joe",
         "Just Joe",
         "Life is Better",
         "Drink This",
         "Aromatic Del-ish",
         "Java on Rails",
         "Last Cup"]
DESCRIPTION = ["Delicious", "Fantastic", "Unctuous", "Sublime", "Amazing", "Earthy", "Bold", "Deep", "Crisp", "Acidic", "Tart"]
PRICE = [12, 15, 11, 13, 16, 18, 8, 9, 10]
IMAGE = ['coffee 2.jpg', 'coffee 3.jpg', 'coffee 5.jpg', 'coffee 6.jpg', 'coffee 7.jpg', 'coffee 8.jpg', 'coffee 9.jpg',
         'coffee 10.jpg', 'coffee 11.jpg', 'coffee 12.jpg', 'coffee 13.jpg', 'coffee 14.jpg', 'coffee 15.jpg', 'coffee 16.jpg',
         'coffee 17.jpg', 'coffee 18.jpg', 'coffee 20.jpg', 'coffee 21.jpg', 'coffee 22.jpg']
NAME  = ['Dark Roast', 'Light Roast', 'Columbian', 'Decaf', 'Caffeinated', 'Ethiopian',]


NAME.each do |name|
  category = Category.create!(name: name)
  puts "Created #{category.name}"
end

Category.each do |category|
  10.times do
    category.beans.create(title: name, description: DESCRIPTION.sample, price: PRICE.sample, image: File.open("#{Rails.root}/public/images/#{IMAGE.sample}"))
    puts "Created #{category.beans.count} beans for #{Category.name}"
  end
end
User.create(email: "admin@admin.com", password: "password", role: 1)
