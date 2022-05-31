# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

CATEGORIES = ["scooter", "motorbike", "bicycle"]
ENGINE = [50, 150, 250, 500]

User.create!(
  first_name: "test",
  last_name: "host",
  email: "host@user.com",
  password: "123456",
  phone: "+61 38063321"
)

User.create!(
  first_name: "test",
  last_name: "rentee",
  email: "rentee@user.com",
  password: "123456",
  phone: "+61 38019765"
)

20.times do
  Bike.create!(
    title: Faker::Vehicle.make_and_model,
    description: Faker::Lorem.paragraph(sentence_count: 5),
    address: Faker::Address.city,
    category: CATEGORIES.sample,
    engine_size: ENGINE.sample,
    features: Faker::Vehicle.standard_specs,
    license_plate: Faker::Vehicle.license_plate,
    price_per_day: (5..50).to_a.sample,
    latitude: -8.639880,
    longitude: 115.140167,
    user: User.first
  )
end
