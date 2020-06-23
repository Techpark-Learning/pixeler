# frozen_string_literal: true

class CreateArtItems < ActiveRecord::Migration[6.0]
  def change
    create_table :art_items, id: :uuid do |t|
      t.string :name
      t.string :image
      t.decimal :price, precision: 8, scale: 2
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
    add_index :art_items, [:name,:user_id], unique: true
    add_index :art_items, :image, unique: true
  end
end
