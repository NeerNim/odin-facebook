FactoryBot.define do
  factory :user  do
    first_name { "John" }
    last_name  { "Doe" }
    email  { "john@gmail.com" }
    birthday  { "20-10-1990" }
    gender  { "female" }
    password  { "123456" }
    password_confirmation  { "123456" }
  end
end

