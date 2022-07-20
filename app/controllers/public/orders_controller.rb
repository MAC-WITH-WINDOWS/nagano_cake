class Public::OrdersController < ApplicationController
  def new
    @customer=current_customer
  end

  def check
    #binding.pry
   
    @order = Order.new(order_params)
    @order.customer_id=current_customer.id
    @adress=(params[:order][:select_address])

    if @adress == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.to_name = current_customer.first_name + current_customer.last_name
    # 登録済みの住所の場合、配送先を呼び出してその情報を格納する
    elsif @adress == "1"
      @address = ShippingAddress.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.to_name = @address.name
    end
    @cart_items = CartItem.where(customer_id: current_customer.id)
    #@cart_items = current_customer.carts_items
    @cart_items.build
    @total_price = 0
  end

  def finish
  end

  def index
    @order=Order.where(customer_id: current_customer.id)
    @item=OrderItem.all
  end

  def show
    @order=Order.find(params[:id])
    @item=OrderItem.where(order_id:@order.id)
  end

  def create
    @order=Order.new(order_params)
    @cart_items = CartItem.where(customer_id: current_customer.id)
    @order.save
    @cart_items.each do |cart|
      #binding.pry
      order_item= OrderItem.new
      order_item.item_id = cart.item_id
      order_item.order_id = @order.id
      order_item.amount = cart.amount
      order_item.purchace_price = cart.item.tax_free_price
      order_item.making_status = 0
      order_item.save
    end
    @cart_items.destroy_all
    redirect_to "/public/orders/finish"
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :to_name, :customer_id,:total_payment,:postage,:created_at)

  end

end