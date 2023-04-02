# frozen_string_literal: true

FactoryBot.define do
  factory :batch do |f|
    f.name { "Batch #{rand(1..10)}" }
    f.start_time { Time.now + 1.day }
    f.end_time { start_time + 1.week }
    association :school
    association :course
  end
end
