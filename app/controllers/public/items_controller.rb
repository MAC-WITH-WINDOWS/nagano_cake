class Public::ItemsController < ApplicationController
  def index
    @items=Item.all.page
  end

  def show
    @item=Item.find
  end
end
