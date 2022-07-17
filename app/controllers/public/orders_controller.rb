class Public::OrdersController < ApplicationController
  def new
  end

  def check
    @order = Order.new(order_params)
    @order.address_update
    @cart_items = current_customer.carts_items
    @cart_items.build
    @total_price = 0
  end

  def finish
  end

  def index
  end

  def show
  end
  
  private
  
  def order_params
    params.require(:order).permit(:peyment_method, :post_code, :address, :to_name)
  end
  
end
