# frozen_string_literal: true

FactoryBot.define do
  factory :art_item do
    user
    sequence(:name) { |s| "ArtItem#{s}" }
    image { "MyString" }
    price { rand(100) }
  end
end
