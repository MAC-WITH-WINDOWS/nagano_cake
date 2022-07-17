class Admin::OrdersController < ApplicationController
  def show
    #@customer = Customer.find(customer.id)
    #@order = Order.find(params[:id])
    @orders = Order.all
    @total = 0
    # @order.save ? (redirect_to request.referer) : (render :show) #link_toで使えない時に
  end
end
