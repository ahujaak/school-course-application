# frozen_string_literal: true

FactoryBot.define do
  factory :course do |f|
    f.name { Faker::Educator.course_name }
    f.description { "Hi this is a test course" }
    association :school
  end
end
