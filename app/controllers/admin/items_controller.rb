class Admin::ItemsController < ApplicationController
    def index
      @items = Item.all
      @item = Item.page(params[:page])
    end
    
    def new
      @item = Item.new
      @genres = Genre.all
    end
    
    def show
    end
    
    def create
      @item = Item.new(item_params)
      @item.save
      redirect_to admin_item_path(@item.id)
    end
    
    def edit
    end
    
    private

    def item_params
      params.require(:item).permit(:image, :name, :introduction, :genre_id, :tax_free_price, :sales_status)
    end

end
