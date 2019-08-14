# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create!(first_name: "John", last_name: "Doe", email: "johndoe@example.com", birthday: "11-01-1985", gender: "Male", password: "password123")
u2 = User.create!(first_name: "Jane", last_name: "Doe", email: "janedoe@example.com", birthday: "12-01-1985", gender: "Female", password: "password123")
u3 = User.create!(first_name: "Bob", last_name: "Dole", email: "bob@example.com", birthday: "10-01-1986", gender: "Male", password: "password123")
u4 = User.create!(first_name: "Barbara", last_name: "Dole", email: "barb@example.com", birthday: "09-05-1981", gender: "Female", password: "password123")

f1 = Friendship.create!(user: u1, friend: u2, confirmed: false)
f2 = Friendship.create!(user: u2, friend: u1, confirmed: false)

f1.update_attributes(confirmed: true)
f2.update_attributes(confirmed: true)

f3 = Friendship.create!(user: u3, friend: u4, confirmed: false)
f4 = Friendship.create!(user: u4, friend: u3, confirmed: false)

u5 = User.create!(first_name: "Jonathan", last_name: "Dole", email: "johnny@example.com", birthday: "09-05-1981", gender: "Male", password: "password123")
f5 = Friendship.create!(user: u5, friend: u4)
