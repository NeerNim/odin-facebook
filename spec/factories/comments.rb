FactoryBot.define do
  factory :comment do
    body { "MyText" }

    association :post 
    association :user
  end
end
