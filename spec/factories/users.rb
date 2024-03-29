FactoryBot.define do
  factory :user, aliases: [:friend] do
    first_name { "John" }
    last_name  { "Doe" }
    email  { "john@gmail.com" }
    birthday  { "20-10-1990" }
    gender  { "female" }
    password  { "123456" }
    password_confirmation  { "123456" }
  end

  factory :random_user, class: User do 
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker:: Internet.email }
    gender { Faker:: Gender.binary_type}
    birthday { Time.now }
    password { "123456"}
    password_confirmation { "123456"}
  end
end

