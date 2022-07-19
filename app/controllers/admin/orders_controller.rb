class Admin::OrdersController < ApplicationController
  def show
    
    @order = Order.find(params[:id])
    
    @order_items = OrderItem.all
    #@order_item = OrderItem.where(order_id: params[:id])
  end
  
  def update
      @order = Order.find(params[:id])
      @order.update(order_params)
      redirect_to request.referrer
  end
  
  private
  
  def order_params
    params.require(:order).permit(:order_status)
  end
  
end
