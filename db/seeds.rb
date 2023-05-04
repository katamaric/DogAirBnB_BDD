# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

city1 = City.create!(city_name: Faker::Address.city)
city2 = City.create!(city_name: Faker::Address.city)

3.times do 
  DogSitter.create!(name: Faker::Name.name, city: city1)
  DogSitter.create!(name: Faker::Name.name, city: city2)
end 

5.times do 
  Dog.create!(name: Faker::Creature::Dog.name, city: city1)
  Dog.create!(name: Faker::Creature::Dog.name, city: city2)
end 

# Create random strolls
DogSitter.all.each do |dog_sitter|
  2.times do
    dog = Dog.where(city: dog_sitter.city).sample
    Stroll.create(dog_sitter: dog_sitter, dog: dog, city: dog_sitter.city)
  end
end


