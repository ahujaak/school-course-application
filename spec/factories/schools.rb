# frozen_string_literal: true

FactoryBot.define do
  factory :school do |f|
    f.name { Faker::Educator.secondary_school }
    f.email { Faker::Internet.email }
    f.address { Faker::Address.full_address }
    association :admin, factory: :school_admin
  end
end
