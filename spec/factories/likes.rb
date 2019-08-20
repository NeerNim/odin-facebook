FactoryBot.define do
  factory :like do
    user { nil }
    post { nil }

    association :post 
    association :user
  end
end
