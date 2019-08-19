# u1 = User.create!(
#   first_name: "John",
#   last_name: "Doe", 
#   email: "john@gmail.com", 
#   birthday: "20-10-1990", 
#   gender: "female", 
#   password: "123456", 
#   password_confirmation: "123456" 
# )

# u2 = User.create!(
#   first_name: "Sara",
#   last_name: "Doe", 
#   email: "sara@gmail.com", 
#   birthday: "20-10-1990", 
#   gender: "male", 
#   password: "123456", 
#   password_confirmation: "123456" 
# )

10.times do 
  User.create!(
  first_name:  Faker::Name.first_name,
  last_name:  Faker::Name.last_name, 
  email:  Faker::Internet.email, 
  birthday: Time.now,
  gender:  Faker::Gender.binary_type,
  password:  "123456",
  password_confirmation:  "123456"
  )
end

# f1 = Friendship.create!(user: u1, friend: u2, confirmed: false)
# f2 = Friendship.create!(user: u2, friend: u1, confirmed: false)

