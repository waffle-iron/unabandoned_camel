# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TITLE = ["Yirgacheffe Oromia", "Rushashi Hingakawa", "Namadzi Kapno", "Tarrazu Hacienda La Minita", "Supremo Sur de Huila", "Penachi", "El Triunfo", "Sumatra Aceh", "Atitlan Nahuala", "Mocca Java", "Trieste Caffe" ]
DESCRIPTION = ["Delicious", "Fantastic", "Unctuous", "Sublime", "Amazing", "Earthy", "Bold", "Deep", "Crisp", "Acidic", "Tart"]
PRICE = [12, 15, 11, 13, 16, 18, 8, 9, 10]
IMAGE = ["asdf", "asdfasdf", "asdfasdf", "adsfadf", "adfadsf", "qwetqerh", "qwehhdfskgj"]

TITLE.each do |name|
  bean = Bean.create!(title: name, description: DESCRIPTION.sample, price: PRICE.sample, image: IMAGE.sample)
  puts "Created #{bean.title}"
end
        
