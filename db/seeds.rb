# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
puts "creating user"
user = User.create!(email:'user1@gmail.com', password: '123456')
puts "done"

Granny.destroy_all

puts "creating maria"
Granny.create!(name: "Maria", age: 80, city:'Madrid', user_id: user.id)

puts "done"
