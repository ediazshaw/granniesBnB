# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

User.destroy_all
puts 'Creating 10 fake users...'

10.times do
  user = User.new(
    email: Faker::Internet.email,
    password: '123456'
  )
  user.save!
  puts user.email
end
puts "done"

Granny.destroy_all

cities = ["Madrid", "Lisboa", "Barcelona", "London", "Hamburg", "Bogota"]
puts 'Creating 20 fake grannies per city...'

cities.each do |city|
  4.times do
    granny = Granny.new(
      name: Faker::Name.name,
      age: rand(60..80),
      city: city,
      user: User.all.sample,
      price: rand(80..300),
      description: Faker::Hobby.activity
    )
    granny.save!
    puts granny.name
  end
end
puts "done"
