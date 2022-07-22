class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all
    @orders = Order.page(params[:page])
    @amount = 0
  end
end