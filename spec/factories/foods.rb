FactoryBot.define do
  factory :food do
    name {Faker::Food.ingredient}
    calories {Faker::Number.between(1, 1000)}
  end
end
