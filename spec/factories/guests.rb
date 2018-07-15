FactoryBot.define do
  factory :guest do
    email Faker::Internet.email
    name Faker::GameOfThrones.character
  end
end
