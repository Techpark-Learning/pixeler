require 'rails_helper'

RSpec.describe ArtItem, type: :model do
  describe "#DeleteArtItem" do
    it "Remove Item from the database" do
     created_art_item = FactoryBot.create(:art_item)
      expect(created_art_item).to be_persisted
      created_art_item.destroy
      #We don't really need to test this, but later we will add soft deletes
      expect(ArtItem.exists? created_art_item.id).to be_falsy
    end
  end  
end