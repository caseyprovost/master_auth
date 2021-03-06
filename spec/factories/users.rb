# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(12) }
  end
end
