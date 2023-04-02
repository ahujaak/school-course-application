# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password }
    password_confirmation { password }
    role { 'admin' }
  end

  factory :admin_user, parent: :user, class: 'User' do
    role { 'admin' }
  end

  factory :school_admin, parent: :user, class: 'User' do
    role { 'school_admin' }
  end

  factory :student, parent: :user, class: 'User' do
    role { 'student' }
  end
end
