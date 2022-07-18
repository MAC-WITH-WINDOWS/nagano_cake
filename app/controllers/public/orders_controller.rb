class Public::OrdersController < ApplicationController
  def new
    @customer=current_customer
    @adress=ShippingAddress.where(customer_id:current_customer.id)
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

  def create
    order=Order.new
    order.save(order_params)
    redirect_to public_items_path
  end

  private

  def order_params
    params.require(:order).permit(:peyment_method, :post_code, :address, :to_name)
  end

end
