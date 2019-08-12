FactoryBot.define do
  factory :comment do
    title { "MyString" }
    body { "MyText" }

    association :post 
    association :user
  end
end
