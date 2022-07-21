class Public::ItemsController < ApplicationController
  def index
    @sale_items = Item.where(sales_status: 0)
    @items = @sale_items.page(params[:page]).per(8)
  end

  def show
    @item=Item.find(params[:id])
  end

  def search
    @genre = Genre.find_by(name: params[:keyword])
    items = @genre.items
    @sale_items = items.where(sales_status: 0)
    @items = @sale_items.page
    render :index
  end

end