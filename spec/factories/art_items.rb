# frozen_string_literal: true

FactoryBot.define do
  factory :art_item do
    name { 'MyString' }
    image { 'MyString' }
    price { '9.99' }
    user { nil }
  end
end
