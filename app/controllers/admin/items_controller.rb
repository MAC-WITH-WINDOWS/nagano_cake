class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def show
    @item = Item.find_by(params[:id])
    @genre = @item.genre
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
