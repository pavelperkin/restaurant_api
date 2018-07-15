FactoryBot.define do
  factory :restaurant do
    name Faker::GameOfThrones.house
    email Faker::Internet.email
    phone Faker::PhoneNumber.phone_number
  end
end
