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
Ability.destroy_all
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
urls_chosen = ["https://images.unsplash.com/photo-1581579438747-1dc8d17bbce4?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870",
  "https://images.unsplash.com/photo-1634089916298-9fa27180526c?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870",
  "https://images.unsplash.com/photo-1593100126453-19b562a800c1?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1467"]
a = ["Pull you by the ear", "Telling repeated stories", "Make you a cocido when you are sick", "Forces you to eat more", "Cooking", "Crochet"]
a.each do |ability|
  abs = Ability.new(
    name: ability,
    description: "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
  )
  abs.save
  puts abs.name
end
Granny.destroy_all
puts "Creating good seeds"
granny = Granny.new(
  name: "Eduarda",
  age: rand(80..90),
  city: "Toledo, España",
  user: User.all.sample,
  price: rand(80..300),
  description: "This granny is really patience and intelligence. At my age I have just graduated from a technical university specialized in engineering. I like doing shots in 100 montaditos."
)
granny.save!
granny_ability = GrannyAbility.new(
  granny: granny,
  ability: Ability.all.sample
)
granny_ability.save
file = URI.open(urls_chosen[0])
granny.photo.attach(io: file, filename: "#{granny.name}.png", content_type: 'image/png')
puts granny.name
granny = Granny.new(
  name: "Marta",
  age: rand(80..90),
  city: "Rio do Janeiro, Brasil",
  user: User.all.sample,
  price: rand(80..300),
  description: "This granny likes guaraná and surfing in the beaches of Rio. I used to swear in portuguese but don't be worried because I'm really nice and I will always help you in whatever you need."
)
granny.save!
granny_ability = GrannyAbility.new(
  granny: granny,
  ability: Ability.all.sample
)
granny_ability.save
file = URI.open(urls_chosen[1])
granny.photo.attach(io: file, filename: "#{granny.name}.png", content_type: 'image/png')
puts granny.name
granny = Granny.new(
  name: "Joana",
  age: rand(80..90),
  city: "Madrid, España",
  user: User.all.sample,
  price: rand(80..300),
  description: "This granny would like to eat just patatas bravas all the time. I also like to complaint about everything. I have a great sense of humour and I also like whiskey."
)
granny.save!
granny_ability = GrannyAbility.new(
  granny: granny,
  ability: Ability.all.sample
)
granny_ability.save
file = URI.open(urls_chosen[2])
granny.photo.attach(io: file, filename: "#{granny.name}.png", content_type: 'image/png')
puts granny.name
puts "granny_ability done"
n = 0
cities = ["Madrid, España", "Barcelona, España", "Toledo, España", "Salamanca, España"]
puts 'Creating 4 fake grannies per city...'
urls = ["https://images.unsplash.com/photo-1593100126453-19b562a800c1?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1467",
  "https://images.unsplash.com/photo-1566616213894-2d4e1baee5d8?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=871",
  "https://images.unsplash.com/photo-1634089916298-9fa27180526c?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870",
  "https://images.unsplash.com/photo-1447005497901-b3e9ee359928?ixlib=rb-1.2.1&raw_url=true&q=80&fm=jpg&crop=entropy&cs=tinysrgb&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774",
  "https://images.unsplash.com/photo-1581579438747-1dc8d17bbce4?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870",
  "https://images.unsplash.com/photo-1551727028-e050e6ed2f62?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774",
"https://images.unsplash.com/photo-1575467678930-c7acd65d6470?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870",
"https://images.unsplash.com/photo-1422015347944-9dd46d16bd0b?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870",
"https://images.unsplash.com/photo-1637080146000-4c0673b1bb71?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387",
"https://images.unsplash.com/photo-1556889882-73ea40694a98?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=900",
"https://images.unsplash.com/photo-1577368287217-16ff9373a733?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870",
"https://images.unsplash.com/photo-1560807775-06a31fa55c52?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387",
"https://images.unsplash.com/photo-1555929248-160aae345052?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387",
"https://images.unsplash.com/photo-1533128361669-69c065857a13?crop=entropy&cs=tinysrgb&fm=jpg&ixlib=rb-1.2.1&q=80&raw_url=true&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=436"]


cities.each do |city|


  3.times do
    granny = Granny.new(
      name: Faker::Name.female_first_name,
      age: rand(60..80),
      city: city,
      user: User.all.sample,
      price: rand(80..300),
      description: Faker::Hobby.activity
    )
    granny.save!
    2.times do
      granny_ability = GrannyAbility.new(
        granny: granny,
        ability: Ability.all.sample
      )
      granny_ability.save
      puts "granny_ability done"
    end
    file = URI.open(urls[n])
    n += 1
    granny.photo.attach(io: file, filename: "#{granny.name}.png", content_type: 'image/png')
    puts granny.name
    puts "creating abilities"
  end
end
puts "done"
