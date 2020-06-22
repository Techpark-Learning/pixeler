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

    describe "EDIT" do
        it "update the db values of items" do
            created_art_item = FactoryBot.create(:art_item)
            visit art_item_path(created_art_item.id)
            expect(page).to have_link "Edit"
            click_link "Edit"
            fill_in "Name", with: "Edited name"
            fill_in "Price", with: "250.99"
            click_button "Update"
            expect(page).to have_content "Item updated"
            expect(page).to have_content "Edited name"
            expect(page).to have_content "250.99"
        end

        it "show validation errors" do
            created_art_item = FactoryBot.create(:art_item)
            visit art_item_path(created_art_item.id)
            expect(page).to have_link "Edit"
            click_link "Edit"
            fill_in "Name", with: ""
            fill_in "Price", with: ""
            click_button "Update"
            expect(page).to have_content "can't be blank"
        end
    end
end
