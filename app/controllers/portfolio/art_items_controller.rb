class Portfolio::ArtItemsController < ApplicationController
  before_action :authenticate_user!
  def index
    @user_art_items = current_user.art_items
  end
end
