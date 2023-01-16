FactoryBot.define do
  factory :favorite do
    country { Faker::Address.country.downcase }
    recipe_link { Faker::Internet.url }
    recipe_title { Faker::Food.dish }
    user_id { nil }
  end
end
