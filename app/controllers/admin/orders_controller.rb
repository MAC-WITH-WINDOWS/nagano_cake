class Admin::OrdersController < ApplicationController
  def show
    
    #@order = Order.find(params[:id])
    
    @order_items = OrderItem.all
    #@order_item = OrderItem.where(order_id: params[:id])
    
    # 注文商品の総額を計算
    #@order_items_price = @order_item.inject(0) { |sum, order| sum + @order_items.sum_of_price }
    
    # 注文商品の総額に送料を足して、合計総額を出す
    #@total = @order_item_price + 800
    
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
