# frozen_string_literal: true

class User < ApplicationRecord
    devise :database_authenticatable, :registerable

    has_many :art_items

    
end
