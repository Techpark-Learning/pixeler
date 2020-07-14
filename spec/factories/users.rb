# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { 'MyString' }
    email { 'MyString' }
    password { 'please' }
  end
end
