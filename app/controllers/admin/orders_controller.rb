class Admin::OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_items = OrderItem.where(order_id: params[:id])
  end

  def update
      @order = Order.find(params[:id])
      @order.update(order_params)
      @order_items = OrderItem.where(order_id: params[:id])
      if @order.order_status == "payment_confirm"
        @order_items.update_all(making_status: "wait_product")
      end
      flash[:notice] = "注文ステータスが更新されました"
      redirect_to request.referrer
  end

  private

  def order_params
    params.require(:order).permit(:order_status)
  end

end
