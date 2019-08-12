FactoryBot.define do
  factory :user  do
    first_name { "John" }
    last_name  { "Doe" }
    email { "john@gmail.com" }
    password { "123456" }
    birthday { "20-10-1990" }
    gender { "female" } 
  end
end

