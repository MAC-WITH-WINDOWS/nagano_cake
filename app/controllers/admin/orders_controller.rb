class Admin::OrdersController < ApplicationController
  def show
    #@order = Order.find(params[:id])
    @orders = Order.all
    # @order.save ? (redirect_to request.referer) : (render :show) #link_toで使えない時に
  end
end
