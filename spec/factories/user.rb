FactoryBot.define do
  factory :user do
    name { Faker::Books::Dune.character }
    email { Faker::Internet.unique.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end