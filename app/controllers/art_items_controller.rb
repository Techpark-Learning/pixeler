class ArtItemsController < ApplicationController    
    def index
        @art_item = ArtItem.all
    end

    def show
        @art_item = ArtItem.find params[:id]
    end

    def edit
        @art_item = ArtItem.find params[:id]
    end

    def update
       @art_item = ArtItem.find params[:id]
       if @art_item.update(art_item_params)
        flash[:success] = "Item updated"
        redirect_to @art_item
       else
        render :edit
       end 
    end

    def destroy
        @art_item = ArtItem.find(params[:id])
        @art_item.destroy
        flash[:success] = "Record #{@art_item.name} succesfully removed"
        redirect_to root_path
    end

    private

    def art_item_params
        params.require(:art_item).permit(:name, :price)
    end
end
