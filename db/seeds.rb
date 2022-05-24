# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require "open-uri"


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

cities = ["Madrid", "Lisboa", "Hamburg", "Bogota"]
puts 'Creating 4 fake grannies per city...'
urls = ["https://images.unsplash.com/photo-1593100126453-19b562a800c1?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1467",
  "https://images.unsplash.com/photo-1442458370899-ae20e367c5d8?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774",
  "https://images.unsplash.com/photo-1566616213894-2d4e1baee5d8?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871",
  "https://images.unsplash.com/photo-1634089916298-9fa27180526c?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870",
  "https://images.unsplash.com/photo-1447005497901-b3e9ee359928?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774",
  "https://images.unsplash.com/photo-1581579438747-1dc8d17bbce4?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870",
  "https://images.unsplash.com/photo-1551727028-e050e6ed2f62?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774"]


cities.each do |city|

  3.times do
    granny = Granny.new(
      name: Faker::Name.name,
      age: rand(60..80),
      city: city,
      user: User.all.sample,
      price: rand(80..300),
      description: Faker::Hobby.activity
    )
    granny.save!
    file = URI.open(urls.sample)
    granny.photo.attach(io: file, filename: "#{granny.name}.png", content_type: 'image/png')
    puts granny.name
  end
end
puts "done"
