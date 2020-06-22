class ArtItemsController < ApplicationController    
    def index
        @art_item = ArtItem.all
    end

    def show
        @art_item = ArtItem.find params[:id]
    end

    def destroy
        @art_item = ArtItem.find(params[:id])
        @art_item.destroy
        flash[:success] = "Record #{@art_item.name} succesfully removed"
        redirect_to root_path
    end
end
