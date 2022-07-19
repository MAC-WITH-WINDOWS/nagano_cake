class Public::ItemsController < ApplicationController
  def index
    @items=Item.all.page
  end

  def show
    @item=Item.find(params[:id])
  end
  
  def search
    @genre = Genre.find_by(name: params[:keyword])
    @items = @genre.items.page
    render :index
  end

end