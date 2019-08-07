FactoryBot.use_parent_strategy = false


FactoryBot.define do
  factory :post do
    title { "test title" }
    content { "Lorem Ipsum is simply dummy text of the printing and typesetting industry." }   
    association :user, factory: :user, strategy: :build
  end
end