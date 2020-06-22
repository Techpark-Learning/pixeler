require 'rails_helper'

RSpec.describe "ArtItems", type: :request do

    describe "GET art_item#show" do
        it "should render art_item#show template" do
            created_art_item = FactoryBot.create(:art_item)
            visit art_item_path(created_art_item.id)
            page.should have_content(created_art_item.name)
            page.should have_content(created_art_item.price)
       end
    end

    describe "DELETE art_item#destroy" do
        it "Removes an art_item from the database" do
            created_art_item = FactoryBot.create(:art_item)
            visit art_item_path(created_art_item.id)
            page.should have_link("Delete")
            expect { click_link "Delete" }.to change(ArtItem, :count).by(-1)
        end
    end
end
