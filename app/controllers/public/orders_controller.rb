class Public::OrdersController < ApplicationController
  def new
    @customer=current_customer
  end

  def check
    #binding.pry
    #@order = Order.new(params[:select_address]),(order_params)
    @order = Order.new(order_params)
    @order.customer_id=current_customer.id
    @adress=(params[:order][:select_address])

    if @adress == "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.to_name = current_customer.first_name + current_customer.last_name
    # 登録済みの住所の場合、配送先を呼び出してその情報を格納する
    elsif @adress == "1"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.to_name = @address.to_name
    end
    @cart_items = CartItem.where(customer_id: current_customer.id)
    #@cart_items = current_customer.carts_items
    @cart_items.build
    @total_price = 0
  end

  def finish
  end

  def index
    @order=Order.all
  end

  def show
  end

  def create
    @order=Order.new(order_params)
    @order.save
    redirect_to public_orders_finish_path
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :to_name, :customer_id,:total_payment,:postage,:created_at)

  end

end
