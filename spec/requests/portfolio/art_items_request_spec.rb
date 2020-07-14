require 'rails_helper'

RSpec.describe "Portfolio::ArtItems", type: :request do


  describe "GET portfolio/art_items#show" do
    it "tests the presence of art_items in user's portfolio" do
      test_user = FactoryBot.create(:user)
      test_art_item = FactoryBot.create(:art_item, user: test_user, name: "Test_Art_1")
      visit root_path
      click_link "Sign in"
      fill_in "Email", with: test_user.email
      fill_in "Password", with: "please"
      click_button "Log in"
      visit portfolio_art_items_path
      expect(page).to have_content "Test_Art_1" 
    end
  end

end
