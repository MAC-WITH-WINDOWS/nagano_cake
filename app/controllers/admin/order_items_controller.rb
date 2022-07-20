class Admin::OrderItemsController < ApplicationController

  def update
      @order_item = OrderItem.find(params[:id])
      @order_item.update(order_item_params)
      @order = @order_item.order
      @order_items = @order.order_items
      #binding.pry
      if @order_item.making_status == "in_product"  # => @order_item.in_product?
         @order.update(order_status: "production")
      #elsif @order_items.all?{|making_status| making_status.making_status == "finish_product"} # => @order_items.all?{|f| f.finish_product?}
      elsif @order_items.where(making_status: "finish_product").count == @order_items.count
         @order.update(order_status: "ship_preparation")
      end
      
      flash[:notice] = "製作ステータスが更新されました"
      redirect_to request.referrer
  end

  private

  def order_item_params
    params.require(:order_item).permit(:making_status)
  end

end
