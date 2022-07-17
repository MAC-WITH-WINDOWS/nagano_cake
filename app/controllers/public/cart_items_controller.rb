class Public::CartItemsController < ApplicationController
  def index
     @cart=CartItem.all
     @cart_items=Item.find(params[:id])
  end

end