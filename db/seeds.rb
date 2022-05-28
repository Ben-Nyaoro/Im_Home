# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Database clean now!!"

user1 = User.create!(email: "abc@blabla.com", password: "123456", name: "Jane Doe", phone_number: "+4912345678912")
user2 = User.create!(email: "bcd@blabla.com", password: "123456", name: "Horst Schmidt", phone_number: "+49123434534333")

new_buddy1 = Buddy.create!(name: "Buddy", phone_number: "+49123456789123", user: user1)
new_buddy2 = Buddy.create!(name: "Buddy", phone_number: "+49123456789123", user: user1)
new_buddy3 = Buddy.create!(name: "Buddy", phone_number: "+49123456789123", user: user2)


new_address1 = Address.create!(address_line1: "Schnellerstraße 112", address_line2: "c/o Müller", postcode: 12439, city: "Berlin")
new_address2 = Address.create!(address_line1: "Heidekampweg 6", postcode: 12437, city: "Berlin")
new_address3 = Address.create!(address_line1: "Elsenstraße 4", postcode: 12437, city: "Berlin")
new_address4 = Address.create!(address_line1: "Michael-Brückner-Weg 3", postcode: 12524, city: "Berlin")

new_journey1 = Journey.create!(starting_point_id: new_address1.id, destination_id: 2,
  mode_of_transportation: "Bus", time_estimate: "20", user_id: 1, buddy_id: 1)
new_journey2 = Journey.create!(starting_point_id: new_address3.id, destination_id: 4,
  mode_of_transportation: "Train", time_estimate: "40", user_id: 1, buddy_id: 2)

new_safe_place1 = SafePlace.create!(name: "Home", address_id: 1, user_id: 1)
new_safe_place2 = SafePlace.create!(name: "Work", address_id: 2, user_id: 1)
new_safe_place3 = SafePlace.create!(name: "Friend", address_id: 3, user_id: 1)
new_safe_place4 = SafePlace.create!(name: "Parents", address_id: 4, user_id: 1)

puts "Created"
