class ArtItem < ApplicationRecord
  belongs_to :user

  validates :name, :price, presence: true
  validates :price, numericality: { greater_than:0 }
end
