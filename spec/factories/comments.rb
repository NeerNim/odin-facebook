FactoryBot.define do
  factory :comment do
    title { "MyString" }
    body { "MyText" }
    user { nil }
    post { nil }
  end
end
