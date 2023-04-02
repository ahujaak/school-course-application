# frozen_string_literal: true

FactoryBot.define do
  factory :enrollment_request do |f|
    association :batch
    association :student, factory: :student
    association :approver, factory: :school_admin
  end
end
