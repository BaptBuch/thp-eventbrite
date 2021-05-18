# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

User.destroy_all
Event.destroy_all

10.times do
  user = User.create(first_name: Faker::Superhero.name, last_name: Faker::Superhero.suffix, description: Faker::Movie.quote, email: Faker::Name.first_name+"@yopmail.com", password: Faker::Lorem.characters(number: 10)) 
end

t1 = Time.now
t2 = Time.parse("2023-01-01 00:00:00")

5.times do
    event = Event.create(start_date: rand(t1..t2),
        duration: rand(5..100)*5,
        description: Faker::Lorem.paragraph_by_chars(number: 300, supplemental: false),
        location: Faker::Address.city,
        price: rand(1..1000),
        title: Faker::Sports::Football.competition,
        admin: User.all.sample
    )
end