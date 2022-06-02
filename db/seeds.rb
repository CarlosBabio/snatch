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

# def calculate_total_price
#   return unless start_date && end_date

#   self.total_price = (bike.price_per_day * (end_date - start_date).to_i).to_i
# end


# Creating 2 test users: 1 host, 1 rentee
user1 = User.new(
  first_name: "host",
  last_name: "host",
  email: "host@user.com",
  password: "123456",
  phone: "+61 38063321"
)

user2 = User.new(
  first_name: "rentee",
  last_name: "rentee",
  email: "rentee@user.com",
  password: "123456",
  phone: "+61 38019765"
)

user1.save
user2.save

# Manual bikes seed (8)
bike1 = Bike.new(
  title: "Honda Scoopy",
  description: "We present to your attention Honda Crea Scoopy. This is a modern scooter, made in retro design. Model replaced on the assembly line of Honda Giorno Crea AF54",
  address: "warung jawa",
  category: "scooter",
  engine_size: 50,
  # features: Faker::Vehicle.standard_specs,
  license_plate: Faker::Vehicle.license_plate,
  price_per_day: (5..50).to_a.sample,
  latitude: -8.6413,
  longitude: 115.13917267410699,
  user: User.first
)

bike1.save

# Booking seeds (3)
booking1 = Booking.new(
  start_date: Date.new(2022, 6, 2),
  end_date: Date.new(2022, 6, 15),
  total_price: 50,
  user: user1.id,
  bike: bike1.id
)

Review.create(
  rating: 4,
  comment: "I had such a lovely time renting this scooter around Canggu",
  booking: booking1.id
)
# Creating 20 bikes and 3 bookings per bike

# 20.times do
#   new_bike = Bike.new(
#     title: Faker::Vehicle.make_and_model,
#     description: Faker::Lorem.paragraph(sentence_count: 5),
#     address: Faker::Address.city,
#     category: CATEGORIES.sample,
#     engine_size: ENGINE.sample,
#     features: Faker::Vehicle.standard_specs,
#     license_plate: Faker::Vehicle.license_plate,
#     price_per_day: (5..50).to_a.sample,
#     latitude: -8.639880,
#     longitude: 115.140167,
#     user: User.first
#   )

#   new_bike.save

#   # 3.times do
#   #   Booking.create(
#   #     start_date: "11/06/2022",
#   #     end_date: "15/06/2022",
#   #     total_price: 100.00,
#   #     user: [user1, user2].sample,
#   #     bike: new_bike
#   #   )
#   # end
# end
