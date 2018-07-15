FactoryBot.define do
  factory :table do
    restaurant
    name Faker::GameOfThrones.house
    min_guests 1
    max_guests 8
  end
  factory :guest do
    email Faker::Internet.email
    name Faker::GameOfThrones.character
  end

  factory :restaurant do
    name Faker::GameOfThrones.house
    email Faker::Internet.email
    phone '333-333-3333'
  end

  factory :shift do
    restaurant
    name 'All day'
    from '00:00'
    to '23:59'
  end
end
