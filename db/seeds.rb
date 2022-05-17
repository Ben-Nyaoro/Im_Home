# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Buddy.destroy_all
Journey.destroy_all
puts "Database clean now!!"

user1 = User.create!(email: "abc@blabla.com", password: "123456", name: "Jane Doe", phone_number: "+4912345678912")
user2 = User.create!(email: "bcd@blabla.com", password: "123456", name: "Horst Schmidt", phone_number: "+49123434534333")
user3 = User.create!(email: "cde@blabla.com", password: "123456", name: "Lisa Müller", phone_number: "+4912345678955")

new_buddy = Buddy.create!(name: "Buddy", phone_number: "+49123456789123", user: user1)

new_journey = Journey.create!(starting_point: "Rinkartstr. 3, 12437 Berlin", destination: "Schönhauser Allee 15, 10119 Berlin",
  mode_of_transportation: "Bus", time_estimate: "20", journey_status: "started",
  buddy_status: "accepted", user_id: 1, buddy_id: 1)


puts "Created"
