class Public::HomesController < ApplicationController
  def top
    @genres = Genre.all
    sale_items = Item.where(sales_status: 0)
    @items = sale_items.limit(4).order(updated_at: "DESC")
  end

  def about
  end
end
